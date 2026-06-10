import os
import shutil
import uuid
import json
from typing import List, Optional, Dict, Any
from fastapi import FastAPI, Depends, HTTPException, UploadFile, File, Form, Header, status
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from sqlalchemy import desc

# App imports
from app.config import settings
from app.db import engine, Base, get_db
from app.models.source import Source
from app.models.schema import SchemaMetadata
from app.models.record import Record
from app.models.query_history import QueryHistory
from app.schemas import (
    URLExtractRequest,
    SourceResponse,
    RecordResponse,
    SchemaResponse,
    QueryRequest,
    QueryResponse,
    AnalyticsRequest,
    AnalyticsResponseSchema
)
from app.worker import extract_url_task, extract_file_task, crawl_website_task, celery_app
from app.services.query_engine import execute_nl_query
from app.services.analytics import generate_analytics

# Auto-create tables on startup (FastAPI direct initialization)
Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Universal AI Data Extraction & Intelligence API",
    description="Production-grade API for schema-less data extraction and intelligence.",
    version="1.0.0"
)

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Restrict in production, open for development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Persistent settings file path
SETTINGS_FILE_PATH = os.path.join(settings.UPLOAD_DIR, "settings.json")

def load_stored_api_key() -> str:
    """Loads API key from local JSON settings file if it exists."""
    if os.path.exists(SETTINGS_FILE_PATH):
        try:
            with open(SETTINGS_FILE_PATH, "r") as f:
                data = json.load(f)
                return data.get("gemini_api_key", "")
        except Exception:
            pass
    return ""

def save_stored_settings(api_key: str, max_depth: int, max_pages: int):
    """Saves settings to local JSON file."""
    try:
        with open(SETTINGS_FILE_PATH, "w") as f:
            json.dump({
                "gemini_api_key": api_key,
                "max_depth": max_depth,
                "max_pages": max_pages
            }, f, indent=2)
    except Exception as e:
        print(f"Error saving settings: {e}")

def get_active_api_key(custom_key: Optional[str] = Header(None, alias="X-Gemini-Key")) -> str:
    """
    Resolves the API key using priority:
    1. Custom Header X-Gemini-Key
    2. Stored settings.json key
    3. .env configured GEMINI_API_KEY
    """
    if custom_key and custom_key.strip():
        return custom_key.strip()
    
    stored = load_stored_api_key()
    if stored and stored.strip():
        return stored.strip()
        
    return settings.GEMINI_API_KEY

@app.get("/")
def read_root():
    return {
        "status": "online",
        "service": "Universal Data Intelligence Platform",
        "documentation": "/docs"
    }

# --- Ingestion Endpoints ---

@app.post("/api/extract/url", response_model=SourceResponse, status_code=status.HTTP_202_ACCEPTED)
def extract_url(
    req: URLExtractRequest,
    db: Session = Depends(get_db),
    api_key: str = Depends(get_active_api_key)
):
    """
    Initiates background scraping and extraction for a given website URL.
    Can perform simple extraction or recursively crawl same-domain links.
    """
    # Create Source entry
    db_source = Source(
        url=req.url,
        title=req.url,
        source_type="url",
        status="pending"
    )
    db.add(db_source)
    db.commit()
    db.refresh(db_source)

    # Trigger Celery Task
    if req.crawl:
        task = crawl_website_task.delay(
            source_id=db_source.id,
            api_key=api_key,
            max_depth=req.max_depth or settings.CRAWL_MAX_DEPTH,
            max_pages=req.max_pages or settings.CRAWL_MAX_PAGES
        )
    else:
        task = extract_url_task.delay(
            source_id=db_source.id,
            api_key=api_key
        )

    # We return the source, the frontend can query task status using /api/jobs/{job_id}
    # We pass the celery task ID in the response headers or add it to source metadata
    return db_source

@app.post("/api/extract/file", response_model=SourceResponse, status_code=status.HTTP_202_ACCEPTED)
def extract_file(
    file: UploadFile = File(...),
    db: Session = Depends(get_db),
    api_key: str = Depends(get_active_api_key)
):
    """
    Ingests and parses uploaded CSV, XLSX, PDF, JSON, XML, or HTML documents.
    """
    # Create unique filename
    ext = os.path.splitext(file.filename)[1]
    unique_filename = f"{uuid.uuid4()}{ext}"
    dest_path = os.path.join(settings.UPLOAD_DIR, unique_filename)

    # Save local file copy
    with open(dest_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)

    # Map source type based on extension
    s_type = ext.lower().replace(".", "")
    if s_type in ["xls", "xlsx"]:
        s_type = "xlsx"

    db_source = Source(
        url=None,
        title=file.filename,
        source_type=s_type,
        status="pending"
    )
    db.add(db_source)
    db.commit()
    db.refresh(db_source)

    # Trigger background parsing Celery job
    extract_file_task.delay(
        source_id=db_source.id,
        file_path=dest_path,
        api_key=api_key
    )

    return db_source

# --- Data Retrival Endpoints ---

@app.get("/api/sources", response_model=List[SourceResponse])
def get_sources(db: Session = Depends(get_db)):
    """Returns all ingested sources, sorted by newest first."""
    return db.query(Source).order_by(desc(Source.created_at)).all()

@app.delete("/api/sources/{source_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_source(source_id: int, db: Session = Depends(get_db)):
    """Deletes a source and all associated records and relationships."""
    source = db.query(Source).filter(Source.id == source_id).first()
    if not source:
        raise HTTPException(status_code=404, detail="Source not found")
    db.delete(source)
    db.commit()
    return

@app.get("/api/records", response_model=List[RecordResponse])
def get_records(
    source_id: Optional[int] = None,
    record_type: Optional[str] = None,
    limit: int = 100,
    offset: int = 0,
    db: Session = Depends(get_db)
):
    """Retrieves extracted JSON records, allowing filtering by source or schema record type."""
    query = db.query(Record)
    if source_id is not None:
        query = query.filter(Record.source_id == source_id)
    if record_type is not None:
        query = query.filter(Record.record_type == record_type)
    return query.order_by(desc(Record.created_at)).limit(limit).offset(offset).all()

@app.get("/api/schemas", response_model=List[SchemaResponse])
def get_schemas(db: Session = Depends(get_db)):
    """Returns all dynamic schemas discovered by the AI engine."""
    return db.query(SchemaMetadata).order_by(desc(SchemaMetadata.created_at)).all()

# --- NL Query & Analytics Endpoints ---

@app.post("/api/query", response_model=QueryResponse)
def run_query(
    req: QueryRequest,
    db: Session = Depends(get_db),
    api_key: str = Depends(get_active_api_key)
):
    """
    Natural Language Query Console. Translates user search questions into safe,
    executable MySQL queries targeting JSON columns, and returns rows.
    """
    try:
        results = execute_nl_query(db, req.query, api_key=api_key)
        return results
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@app.post("/api/analytics", response_model=AnalyticsResponseSchema)
def run_analytics(
    req: AnalyticsRequest,
    db: Session = Depends(get_db),
    api_key: str = Depends(get_active_api_key)
):
    """
    AI Analytics Panel. Runs natural language queries to fetch data,
    evaluates findings, creates summaries, and outputs charts mapping configurations.
    """
    try:
        results = generate_analytics(db, req.query, api_key=api_key)
        return results
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

# --- Job Status Endpoint ---

@app.get("/api/jobs/{job_id}")
def get_job_status(job_id: str):
    """Retrieves celery background task processing status."""
    res = celery_app.AsyncResult(job_id)
    return {
        "job_id": job_id,
        "status": res.status,  # PENDING, STARTED, SUCCESS, FAILURE, RETRY
        "result": str(res.result) if res.status in ["SUCCESS", "FAILURE"] else None
    }

# --- Settings Management Endpoints ---

@app.get("/api/settings")
def get_app_settings():
    """Returns currently active crawler configurations and whether the Gemini key is present."""
    stored_key = load_stored_api_key()
    has_key = bool(stored_key.strip() or settings.GEMINI_API_KEY)
    
    # Load settings from file or defaults
    max_depth = settings.CRAWL_MAX_DEPTH
    max_pages = settings.CRAWL_MAX_PAGES
    
    if os.path.exists(SETTINGS_FILE_PATH):
        try:
            with open(SETTINGS_FILE_PATH, "r") as f:
                data = json.load(f)
                max_depth = data.get("max_depth", max_depth)
                max_pages = data.get("max_pages", max_pages)
        except Exception:
            pass

    return {
        "has_gemini_api_key": has_key,
        "api_key_masked": f"***{stored_key[-4:]}" if stored_key else "Environment Default",
        "max_depth": max_depth,
        "max_pages": max_pages,
        "upload_directory": settings.UPLOAD_DIR,
        "mysql_database": settings.MYSQL_DATABASE
    }

@app.post("/api/settings")
def update_app_settings(
    gemini_api_key: str = Form(None),
    max_depth: int = Form(2),
    max_pages: int = Form(10)
):
    """Saves API keys and crawling thresholds locally in a persistent file."""
    save_stored_settings(
        api_key=gemini_api_key or load_stored_api_key(),
        max_depth=max_depth,
        max_pages=max_pages
    )
    return {"message": "Settings updated successfully"}

@app.get("/api/query-history")
def get_query_history(limit: int = 50, db: Session = Depends(get_db)):
    """Returns a log of previous natural language searches."""
    history = db.query(QueryHistory).order_by(desc(QueryHistory.created_at)).limit(limit).all()
    return history
