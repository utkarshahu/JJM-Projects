import asyncio
import sys
import os
import json

# Add project root to path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.services.scraper import scrape_url
from app.config import settings
import google.generativeai as genai

async def main():
    sys.stdout.reconfigure(encoding='utf-8')
    url = "https://jjm.up.gov.in/NamamiGange/DistrictwiseDrainsStatus"
    print("Scraping...")
    res = await scrape_url(url, use_playwright=True)
    print("Scraped successfully.")
    
    cleaned_text = res["cleaned_text"]
    tables_markdown = res["tables_markdown"]
    print("Cleaned text length:", len(cleaned_text))
    print("Tables count:", len(tables_markdown))
    
    # Let's save them to file to inspect
    with open("scraped_text.txt", "w", encoding="utf-8") as f:
        f.write(cleaned_text)
        f.write("\n\n--- TABLES ---\n\n")
        f.write("\n\n".join(tables_markdown))
        
    # Construct prompt
    tables_section = ""
    if tables_markdown:
        tables_section = "\n\n### Tabular Data from Document:\n" + "\n\n".join(tables_markdown)

    prompt = f"""
You are an expert Data Ingestion Engine. Your task is to analyze the source content below and extract ALL meaningful structural data.

---
Source Title: Districtwise Drains Status
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

    genai.configure(api_key=settings.GEMINI_API_KEY, transport="rest")
    model = genai.GenerativeModel("gemini-2.5-flash-lite")
    
    print("Sending request to Gemini...")
    try:
        response = model.generate_content(
            prompt,
            generation_config=genai.types.GenerationConfig(
                response_mime_type="application/json",
                max_output_tokens=8192,
                temperature=0.1
            )
        )
        print("Response text length:", len(response.text))
        with open("gemini_raw_response.json", "w", encoding="utf-8") as f:
            f.write(response.text)
        print("Saved raw response to gemini_raw_response.json")
    except Exception as e:
        print("FAILED:", e)

if __name__ == "__main__":
    asyncio.run(main())
