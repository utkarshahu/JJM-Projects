import json
import logging
import re
import time
from typing import List, Dict, Any, Optional, Tuple
import google.generativeai as genai
from pydantic import BaseModel, Field
from sqlalchemy import text
from sqlalchemy.orm import Session
from app.config import settings
from app.models.schema import SchemaMetadata
from app.models.query_history import QueryHistory

logger = logging.getLogger(__name__)

class SQLGenerationResult(BaseModel):
    thought: str = Field(description="Explanation of the query strategy, mapping record types and JSON keys.")
    sql: str = Field(description="The complete MySQL 8 SQL query starting with SELECT.")
    columns: List[str] = Field(description="List of columns extracted/projected in the select clause, in order.")

def get_active_schemas_description(db: Session) -> str:
    """
    Fetches schemas from database and formats them as a readable string for the LLM prompt.
    """
    schemas = db.query(SchemaMetadata).all()
    if not schemas:
        return "No schemas are registered in the database yet."
        
    lines = ["Here are the available record types and their schema properties stored in the 'records' table:"]
    for s in schemas:
        lines.append(f"- Record Type: '{s.schema_name}'")
        lines.append("  Fields (keys inside records.data_json):")
        for f_name, f_type in s.schema_json.items():
            lines.append(f"    - {f_name} (type: {f_type})")
    return "\n".join(lines)

def validate_sql_safety(sql: str) -> Tuple[bool, Optional[str]]:
    """
    Validates SQL safety. Only SELECT queries targeting allowed tables are permitted.
    Blocks update/delete/destructive actions.
    """
    # 1. Clean query string
    cleaned = sql.strip().upper()
    
    # 2. Must start with SELECT
    if not cleaned.startswith("SELECT"):
        return False, "Query must start with SELECT."
        
    # 3. Block destructive keywords using regex word boundary searches
    blacklist = [
        r"\bDROP\b", r"\bDELETE\b", r"\bTRUNCATE\b", r"\bALTER\b", 
        r"\bUPDATE\b", r"\bINSERT\b", r"\bCREATE\b", r"\bREPLACE\b",
        r"\bRENAME\b", r"\bGRANT\b", r"\bREVOKE\b"
    ]
    for pattern in blacklist:
        if re.search(pattern, cleaned):
            return False, f"Query contains prohibited SQL operations matching '{pattern}'."
            
    # 4. Only allowed tables
    # Find all table names references (e.g. FROM table, JOIN table)
    # Simple regex check for safety
    allowed_tables = {"RECORDS", "SOURCES", "SCHEMAS", "RELATIONSHIPS", "QUERY_HISTORY"}
    # Tokenize words and find what follows FROM or JOIN
    words = re.findall(r"\b[A-Z_]+\b", cleaned)
    for i, word in enumerate(words):
        if word in ("FROM", "JOIN"):
            if i + 1 < len(words):
                target_table = words[i + 1]
                if target_table not in allowed_tables:
                    # Ignore subqueries (e.g., SELECT ... FROM (SELECT...))
                    if target_table != "SELECT":
                        return False, f"Table '{target_table}' is not permitted for querying."
                        
    return True, None

def translate_nl_to_sql(
    db: Session,
    user_query: str,
    api_key: Optional[str] = None
) -> SQLGenerationResult:
    """
    Uses Gemini 2.5 Flash to translate Natural Language query into MySQL 8 SQL query
    that fetches fields inside data_json.
    """
    active_key = api_key or settings.GEMINI_API_KEY
    if not active_key or active_key == "your_gemini_api_key_here":
        raise ValueError("Gemini API key is missing. Please configure it in Settings or your .env file.")

    genai.configure(api_key=active_key, transport="rest")
    
    # Get active schema definitions
    schema_info = get_active_schemas_description(db)
    
    prompt = f"""
You are an expert MySQL 8 Database Administrator. Translate the user's Natural Language request into a safe, valid, read-only MySQL 8 SELECT query.

---
DATABASE SCHEMA DESIGN:
The records table stores all extracted items inside a JSON column called 'data_json'.
Table structure:
CREATE TABLE records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_id INT,
    record_type VARCHAR(255),
    data_json JSON,
    created_at DATETIME
);

TABLE RELATIONSHIPS:
We also have a relationships table if they ask about parent/child associations:
CREATE TABLE relationships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parent_record_id INT,
    child_record_id INT,
    relationship_type VARCHAR(255)
);

And the sources table contains crawl details:
CREATE TABLE sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(2048),
    title VARCHAR(255),
    source_type VARCHAR(50),
    status VARCHAR(50),
    created_at DATETIME
);

---
DYNAMIC RECORDS PROPERTIES:
{schema_info}

---
CRITICAL RULES FOR SQL GENERATION:
1. Since fields are stored inside 'data_json', you must query them using MySQL 8 JSON path operators:
   - To get string value: `data_json->>'$.field_name'` (Equivalent to JSON_UNQUOTE(JSON_EXTRACT(data_json, '$.field_name')))
   - To compare numerical values, cast them: `CAST(data_json->>'$.price' AS DECIMAL(10,2))` or `CAST(data_json->>'$.drains' AS SIGNED)`
   - To check dates, cast them: `CAST(data_json->>'$.date_field' AS DATE)`
2. ALWAYS filter by the correct 'record_type' field (e.g. `WHERE record_type = 'District'` or `WHERE record_type = 'Company'`).
3. Projects/Aliases (AS clause) should represent the raw JSON property names for readable table headers, e.g.:
   `SELECT data_json->>'$.district' AS district, CAST(data_json->>'$.drains' AS SIGNED) AS drains FROM records WHERE record_type = 'District'`
4. Allow ONLY read-only SELECT statements. Do not perform any write commands.
5. In your projection, select the base record 'id' as well if relevant (e.g. `SELECT id, data_json->>'$.district' AS district...`).
6. If the user query does not match any registered schema, return a SELECT query returning empty result or query the records table generally.

User Request: "{user_query}"

OUTPUT FORMAT:
You must return a JSON object conforming exactly to this structure:
{{
  "thought": "explanation of query strategy",
  "sql": "SELECT ...",
  "columns": ["col1", "col2"]
}}
"""

    model = genai.GenerativeModel("gemini-2.5-flash-lite")
    
    logger.info(f"Generating SQL query using gemini-2.5-flash-lite for prompt: {user_query}")
    
    response = model.generate_content(
        prompt,
        generation_config=genai.types.GenerationConfig(
            response_mime_type="application/json",
            max_output_tokens=2048,
            temperature=0.0
        )
    )
    
    result_json = json.loads(response.text)
    return SQLGenerationResult(**result_json)

def execute_nl_query(
    db: Session,
    user_query: str,
    api_key: Optional[str] = None
) -> Dict[str, Any]:
    """
    Translates, validates, and runs a natural language query, return tabular results
    and logging execution in history.
    """
    start_time = time.time()
    
    # 1. Translate NL -> SQL
    sql_result = translate_nl_to_sql(db, user_query, api_key=api_key)
    generated_sql = sql_result.sql
    
    # 2. Validate Safety
    is_safe, error_msg = validate_sql_safety(generated_sql)
    if not is_safe:
        logger.error(f"SQL Safety check failed for generated SQL: {generated_sql}. Error: {error_msg}")
        raise ValueError(f"Generated SQL failed safety check: {error_msg}")
        
    # 3. Execute query
    try:
        result_proxy = db.execute(text(generated_sql))
        # Parse records
        rows = []
        for row in result_proxy:
            # Row mapping to keys
            rows.append(dict(row._mapping))
            
        execution_time = time.time() - start_time
        
        # 4. Log in query history
        history_entry = QueryHistory(
            user_query=user_query,
            generated_sql=generated_sql,
            execution_time=execution_time
        )
        db.add(history_entry)
        db.commit()
        
        return {
            "thought": sql_result.thought,
            "sql": generated_sql,
            "columns": sql_result.columns,
            "results": rows,
            "execution_time_seconds": execution_time,
            "success": True
        }
    except Exception as e:
        db.rollback()
        execution_time = time.time() - start_time
        logger.error(f"Failed to execute generated SQL: {generated_sql}. Error: {e}")
        
        # Log failed history entry
        try:
            history_entry = QueryHistory(
                user_query=user_query,
                generated_sql=f"-- FAILED: {generated_sql}\n-- ERROR: {str(e)}",
                execution_time=execution_time
            )
            db.add(history_entry)
            db.commit()
        except Exception as db_err:
            logger.error(f"Failed to log query failure to history: {db_err}")
            
        return {
            "thought": sql_result.thought,
            "sql": generated_sql,
            "columns": sql_result.columns,
            "error": str(e),
            "execution_time_seconds": execution_time,
            "success": False
        }
