import os
import asyncio
from celery import Celery
from app.config import settings
from app.db import SessionLocal
from app.models.source import Source
from app.services.scraper import scrape_url
from app.services.document_parser import parse_document
from app.services.extractor import run_extraction
from app.services.storage_service import save_extraction_result
import urllib.parse
import logging

logger = logging.getLogger(__name__)

celery_app = Celery(
    "tasks",
    broker=settings.CELERY_BROKER_URL,
    backend=settings.CELERY_RESULT_BACKEND
)

# Celery settings configurations
celery_app.conf.update(
    task_serializer="json",
    accept_content=["json"],
    result_serializer="json",
    timezone="UTC",
    enable_utc=True,
)

# Helper to run async playwright functions inside Celery's sync execution model
def run_async(coro):
    try:
        loop = asyncio.get_event_loop()
    except RuntimeError:
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)
    return loop.run_until_complete(coro)

@celery_app.task(name="tasks.extract_url_task", bind=True, max_retries=3, default_retry_delay=10)
def extract_url_task(self, source_id: int, api_key: str = None):
    """
    Celery task to scrape a single URL, extract its schema & records using Gemini,
    and save them into MySQL.
    """
    logger.info(f"Starting single URL extraction task for source ID: {source_id}")
    db = SessionLocal()
    
    try:
        source = db.query(Source).filter(Source.id == source_id).first()
        if not source:
            logger.error(f"Source with ID {source_id} not found.")
            return False
            
        source.status = "processing"
        db.commit()
        
        # Scrape page (running async Playwright using loop wrapper)
        scraped_data = run_async(scrape_url(source.url, use_playwright=True))
        
        source.title = scraped_data["title"] or source.url
        db.commit()
        
        # Extract via AI (Gemini)
        extraction_res = run_extraction(
            title=scraped_data["title"],
            cleaned_text=scraped_data["cleaned_text"],
            tables_markdown=scraped_data["tables_markdown"],
            api_key=api_key
        )
        
        # Save records, schemas, and relationships
        save_extraction_result(db, source_id, extraction_res)
        return True
        
    except Exception as exc:
        logger.error(f"Error extracting URL {source_id}: {exc}")
        db.rollback()
        
        # Mark source as failed if max retries reached
        if self.request.retries >= self.max_retries:
            source = db.query(Source).filter(Source.id == source_id).first()
            if source:
                source.status = "failed"
                db.commit()
            return False
            
        raise self.retry(exc=exc)
    finally:
        db.close()


@celery_app.task(name="tasks.extract_file_task", bind=True, max_retries=2, default_retry_delay=5)
def extract_file_task(self, source_id: int, file_path: str, api_key: str = None):
    """
    Celery task to parse an uploaded file (PDF, CSV, Excel, XML, JSON),
    extract records, schemas, and relationships using Gemini, and persist to MySQL.
    """
    logger.info(f"Starting file extraction task for source ID: {source_id}, file: {file_path}")
    db = SessionLocal()
    
    try:
        source = db.query(Source).filter(Source.id == source_id).first()
        if not source:
            logger.error(f"Source with ID {source_id} not found.")
            return False
            
        source.status = "processing"
        db.commit()
        
        # Parse file contents
        parsed_data = parse_document(file_path)
        
        # Update source metadata
        source.title = parsed_data["title"]
        db.commit()
        
        # Extract details using Gemini
        extraction_res = run_extraction(
            title=parsed_data["title"],
            cleaned_text=parsed_data["cleaned_text"],
            tables_markdown=parsed_data["tables_markdown"],
            api_key=api_key
        )
        
        # Save elements to database
        save_extraction_result(db, source_id, extraction_res)
        return True
        
    except Exception as exc:
        logger.error(f"Error parsing file {file_path} for source {source_id}: {exc}")
        db.rollback()
        
        if self.request.retries >= self.max_retries:
            source = db.query(Source).filter(Source.id == source_id).first()
            if source:
                source.status = "failed"
                db.commit()
            return False
            
        raise self.retry(exc=exc)
    finally:
        db.close()


@celery_app.task(name="tasks.crawl_website_task", bind=True)
def crawl_website_task(self, source_id: int, api_key: str = None, max_depth: int = 2, max_pages: int = 10):
    """
    Background crawler task. Walks a website starting from a seed URL,
    discover links, creates new child Sources, and extracts schemas and records.
    """
    logger.info(f"Starting website crawler task for seed source ID: {source_id}, depth: {max_depth}, limit: {max_pages}")
    db = SessionLocal()
    
    try:
        seed_source = db.query(Source).filter(Source.id == source_id).first()
        if not seed_source:
            logger.error(f"Seed source ID {source_id} not found.")
            return False
            
        seed_source.status = "processing"
        db.commit()
        
        seed_url = seed_source.url
        parsed_seed = urllib.parse.urlparse(seed_url)
        
        queue = [(seed_url, 0, source_id)] # (url, depth, db_source_id)
        visited = {seed_url}
        pages_processed = 0
        
        while queue and pages_processed < max_pages:
            current_url, current_depth, current_source_id = queue.pop(0)
            
            logger.info(f"Crawling page {pages_processed + 1}/{max_pages}: {current_url} at depth {current_depth}")
            
            # Scrape content
            try:
                scraped = run_async(scrape_url(current_url, use_playwright=True))
            except Exception as scrape_err:
                logger.warning(f"Failed to scrape crawled page {current_url}: {scrape_err}")
                if current_source_id == source_id:
                    # If the seed URL itself fails, raise it to mark task failed
                    raise scrape_err
                
                # Otherwise, mark child page as failed and continue
                child_src = db.query(Source).filter(Source.id == current_source_id).first()
                if child_src:
                    child_src.status = "failed"
                    db.commit()
                continue

            # Update the source title
            current_source = db.query(Source).filter(Source.id == current_source_id).first()
            if current_source:
                current_source.title = scraped["title"] or current_url
                current_source.status = "processing"
                db.commit()

            # Perform AI Extraction on current page
            try:
                extraction_res = run_extraction(
                    title=scraped["title"],
                    cleaned_text=scraped["cleaned_text"],
                    tables_markdown=scraped["tables_markdown"],
                    api_key=api_key
                )
                # Store
                save_extraction_result(db, current_source_id, extraction_res)
            except Exception as ext_err:
                logger.error(f"Gemini extraction failed on page {current_url}: {ext_err}")
                if current_source:
                    current_source.status = "failed"
                    db.commit()
                if current_source_id == source_id:
                    raise ext_err

            pages_processed += 1
            
            # Discovered links queuing if depth not reached
            if current_depth < max_depth:
                for link in scraped["links"]:
                    if link not in visited and len(visited) < max_pages * 2:
                        visited.add(link)
                        # Create a new child Source in db
                        child_source = Source(
                            url=link,
                            title=link,
                            source_type="url",
                            status="pending"
                        )
                        db.add(child_source)
                        db.commit() # Save to get ID
                        
                        queue.append((link, current_depth + 1, child_source.id))
                        
        # Mark seed source status as completed after queue runs out
        seed_source = db.query(Source).filter(Source.id == source_id).first()
        if seed_source and seed_source.status == "processing":
            seed_source.status = "completed"
            db.commit()
            
        logger.info(f"Finished crawling. Crawled {pages_processed} pages out of {len(visited)} visited candidates.")
        return True
        
    except Exception as e:
        logger.error(f"Crawler task crash: {e}")
        db.rollback()
        seed_source = db.query(Source).filter(Source.id == source_id).first()
        if seed_source:
            seed_source.status = "failed"
            db.commit()
        return False
    finally:
        db.close()
