import asyncio
import sys
import os
import json

# Add project root to path
sys.path.append(
    os.path.dirname(
        os.path.dirname(
            os.path.abspath(__file__)
        )
    )
)

from app.services.scraper import scrape_url
from app.config import settings

from google import genai


async def main():
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass
    print("Testing scrape...")

    url = "https://en.wikipedia.org/wiki/Jal_Jeevan_Mission"

    # Scrape website
    res = await scrape_url(
        url,
        use_playwright=True
    )

    print("Scraped successfully.")

    cleaned_text = res.get("cleaned_text", "")[:5000]

    prompt = f"""
You are an expert Data Ingestion Engine.

Analyze the source content below and extract ALL meaningful structured data.

Source Content:
{cleaned_text}

OUTPUT FORMAT:

Return ONLY valid JSON.

{{
  "schemas": [
    {{
      "schema_name": "PascalCaseEntityName",
      "fields": [
        {{
          "name": "snake_case_field_name",
          "type": "string"
        }}
      ]
    }}
  ],
  "records": [
    {{
      "record_type": "PascalCaseEntityName",
      "data": {{
        "field_name": "value"
      }}
    }}
  ],
  "relationships": [
    {{
      "parent_record_index": 0,
      "child_record_index": 1,
      "relationship_type": "related_to"
    }}
  ]
}}
"""

    client = genai.Client(
        api_key=settings.GEMINI_API_KEY
    )

    print("Sending request to Gemini...")

    try:

        response = client.models.generate_content(
            model="gemini-2.5-flash-lite",
            contents=prompt,
            config={
                "temperature": 0.1,
                "response_mime_type": "application/json"
            }
        )

        print("\nRAW RESPONSE:\n")
        print(response.text)

        result_json = json.loads(response.text)

        schemas = result_json.get("schemas", [])
        records = result_json.get("records", [])
        relationships = result_json.get("relationships", [])

        print("\n========== SUCCESS ==========")

        print(
            "Schemas:",
            [s.get("schema_name") for s in schemas]
        )

        print(
            "Records Count:",
            len(records)
        )

        print(
            "Relationships Count:",
            len(relationships)
        )

        print("=============================\n")

    except json.JSONDecodeError as e:
        print("\nJSON PARSE ERROR")
        print(e)

    except Exception as e:
        print("\nREQUEST FAILED")
        print(str(e))


if __name__ == "__main__":
    asyncio.run(main())