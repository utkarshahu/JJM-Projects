import json
import logging
from typing import List, Dict, Any, Optional
import google.generativeai as genai
from pydantic import BaseModel, Field
from app.config import settings

logger = logging.getLogger(__name__)

# Pydantic models for structured output with Gemini
class FieldInfo(BaseModel):
    name: str = Field(description="Name of the property in snake_case, e.g., 'revenue', 'employees_count', 'district_name'")
    type: str = Field(description="Data type of the field. Must be one of: 'string', 'number', 'boolean', 'date'")

class ExtractedSchema(BaseModel):
    schema_name: str = Field(description="Name of the entity/table in PascalCase, e.g. 'District', 'Company', 'Product'")
    fields: List[FieldInfo] = Field(description="Properties defining the schema")

class ExtractedRecord(BaseModel):
    record_type: str = Field(description="Name of the schema this record belongs to. Must match schema_name of one of the defined schemas.")
    data: Dict[str, Any] = Field(description="Dictionary containing the extracted data for this record, mapping field name keys to their values.")

class ExtractedRelationship(BaseModel):
    parent_record_index: int = Field(description="0-based index of the parent record in the records array")
    child_record_index: int = Field(description="0-based index of the child record in the records array")
    relationship_type: str = Field(description="The nature of the relationship, e.g. 'located_in', 'employed_by', 'flows_through', 'manufactures'")

class ExtractionResult(BaseModel):
    schemas: List[ExtractedSchema] = Field(description="List of schemas discovered in the content")
    records: List[ExtractedRecord] = Field(description="List of records extracted from the content")
    relationships: List[ExtractedRelationship] = Field(description="List of relationships linking the extracted records")


def run_extraction(
    title: str,
    cleaned_text: str,
    tables_markdown: List[str],
    api_key: Optional[str] = None
) -> ExtractionResult:
    """
    Calls Gemini 2.5 Flash to automatically discover schemas, extract records,
    and build relationships from clean text and tables.
    """
    active_key = api_key or settings.GEMINI_API_KEY
    if not active_key or active_key == "your_gemini_api_key_here":
        logger.error("Gemini API key is not configured.")
        raise ValueError("Gemini API key is missing. Please configure it in Settings or your .env file.")

    genai.configure(api_key=active_key, transport="rest")
    
    # Construct the instruction and input context
    tables_section = ""
    if tables_markdown:
        tables_section = "\n\n### Tabular Data from Document:\n" + "\n\n".join(tables_markdown)

    prompt = f"""
You are an expert Data Ingestion Engine. Your task is to analyze the source content below and extract ALL meaningful structural data.

---
Source Title: {title}

---
Source Content:
{cleaned_text}
{tables_section}
---

INSTRUCTIONS:
1. Identify all main entities or topics (e.g. Districts, Companies, Products, Rivers, Projects, People).
2. For each entity, define a schema. Choose a schema name in PascalCase (e.g., 'Company', 'DistrictWaterSource', 'ProductDetail').
3. For each schema, define its fields and infer their data type ('string', 'number', 'boolean', 'date'). Field names must be snake_case.
4. Extract all data rows as Records. Populate the record's data map exactly conforming to its schema fields. Ensure values match the field types (e.g. extract numbers for 'number' types, do not include unit suffixes like 'USD' or 'km' directly in the numbers, extract clean ISO dates or strings for dates).
5. Detect relationships between these records. Use 0-based indices in the returned 'records' list to link parents to children.

Extract as much comprehensive data as possible. Do not invent details; only use facts present in the text.

OUTPUT FORMAT:
You must return a JSON object conforming exactly to this structure:
{{
  "schemas": [
    {{
      "schema_name": "PascalCase",
      "fields": [
        {{ "name": "field_name", "type": "string|number|boolean|date" }}
      ]
    }}
  ],
  "records": [
    {{
      "record_type": "PascalCase",
      "data": {{
        "field_name": "value"
      }}
    }}
  ],
  "relationships": [
    {{
      "parent_record_index": 0,
      "child_record_index": 1,
      "relationship_type": "type"
    }}
  ]
}}
"""

    model = genai.GenerativeModel("gemini-2.5-flash-lite")
    
    logger.info("Sending request to Gemini 2.5 Flash Lite for extraction...")
    
    try:
        response = model.generate_content(
            prompt,
            generation_config=genai.types.GenerationConfig(
                response_mime_type="application/json",
                max_output_tokens=8192,
                temperature=0.1
            )
        )
        
        # Parse the JSON response
        result_json = json.loads(response.text)
        return ExtractionResult(**result_json)
    except Exception as e:
        logger.error(f"Gemini generation or parsing failed: {e}")
        raise e
