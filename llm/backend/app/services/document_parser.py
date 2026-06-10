import os
import json
import pandas as pd
from pypdf import PdfReader
import logging

logger = logging.getLogger(__name__)

def parse_pdf(file_path: str) -> dict:
    """Extracts text page-by-page from a PDF file."""
    reader = PdfReader(file_path)
    text_parts = []
    for idx, page in enumerate(reader.pages):
        text = page.extract_text()
        if text:
            text_parts.append(f"--- Page {idx + 1} ---\n{text}")
    return {
        "title": os.path.basename(file_path),
        "cleaned_text": "\n\n".join(text_parts),
        "tables_markdown": []
    }

def parse_csv(file_path: str) -> dict:
    """Parses CSV using pandas and converts to a markdown table."""
    df = pd.read_csv(file_path)
    md_table = df_to_markdown(df)
    return {
        "title": os.path.basename(file_path),
        "cleaned_text": f"CSV data with {len(df)} rows and {len(df.columns)} columns.",
        "tables_markdown": [md_table]
    }

def parse_excel(file_path: str) -> dict:
    """Parses Excel using pandas (reads all sheets) and converts sheets to markdown tables."""
    xls = pd.ExcelFile(file_path)
    tables_md = []
    text_summary = []
    for sheet_name in xls.sheet_names:
        df = pd.read_excel(xls, sheet_name=sheet_name)
        text_summary.append(f"Sheet '{sheet_name}' contains {len(df)} rows.")
        md = df_to_markdown(df)
        if md:
            tables_md.append(f"### Sheet: {sheet_name}\n\n{md}")
            
    return {
        "title": os.path.basename(file_path),
        "cleaned_text": "\n".join(text_summary),
        "tables_markdown": tables_md
    }

def parse_json(file_path: str) -> dict:
    """Parses and pretty prints JSON."""
    with open(file_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    pretty_json = json.dumps(data, indent=2)
    return {
        "title": os.path.basename(file_path),
        "cleaned_text": f"JSON Data:\n```json\n{pretty_json}\n```",
        "tables_markdown": []
    }

def parse_xml(file_path: str) -> dict:
    """Parses XML and extracts clean text structure."""
    with open(file_path, "r", encoding="utf-8") as f:
        xml_content = f.read()
    # XML can be fed directly or stripped using beautifulsoup if required
    return {
        "title": os.path.basename(file_path),
        "cleaned_text": f"XML Data:\n```xml\n{xml_content}\n```",
        "tables_markdown": []
    }

def df_to_markdown(df: pd.DataFrame) -> str:
    """Custom pandas DataFrame to markdown converter."""
    if df.empty:
        return ""
    headers = [str(col) for col in df.columns]
    markdown = []
    markdown.append("| " + " | ".join(headers) + " |")
    markdown.append("| " + " | ".join(["---"] * len(headers)) + " |")
    for _, row in df.iterrows():
        # Replace newlines in values to prevent breaking cell alignment
        row_vals = []
        for val in row:
            if pd.isna(val):
                row_vals.append("")
            else:
                s = str(val).replace("\n", " ")
                row_vals.append(s)
        markdown.append("| " + " | ".join(row_vals) + " |")
    return "\n".join(markdown)

def parse_document(file_path: str) -> dict:
    """
    Routes file paths to specific parsing functions based on extension.
    """
    ext = os.path.splitext(file_path)[1].lower()
    logger.info(f"Parsing file {file_path} with extension {ext}")
    
    if ext == ".pdf":
        return parse_pdf(file_path)
    elif ext == ".csv":
        return parse_csv(file_path)
    elif ext in [".xlsx", ".xls"]:
        return parse_excel(file_path)
    elif ext == ".json":
        return parse_json(file_path)
    elif ext in [".xml", ".html", ".htm"]:
        if ext in [".html", ".htm"]:
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()
            # Clean HTML format using BeautifulSoup
            from app.services.scraper import clean_html
            return clean_html(content, "file:///" + os.path.basename(file_path))
        else:
            return parse_xml(file_path)
    else:
        # Default fallback to text reading
        with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
        return {
            "title": os.path.basename(file_path),
            "cleaned_text": content,
            "tables_markdown": []
        }
