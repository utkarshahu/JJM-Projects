import re
import urllib.parse
from bs4 import BeautifulSoup
import requests
from playwright.async_api import async_playwright
import logging

logger = logging.getLogger(__name__)

def clean_html(html_content: str, base_url: str) -> dict:
    """
    Cleans HTML content, extracts the title, links, tables in markdown format, and stripped text.
    """
    soup = BeautifulSoup(html_content, "lxml")
    
    # 1. Extract title
    title = soup.title.string.strip() if soup.title else ""
    
    # 2. Extract links on the same domain
    links = []
    parsed_base = urllib.parse.urlparse(base_url)
    base_domain = parsed_base.netloc
    
    for a_tag in soup.find_all("a", href=True):
        href = a_tag["href"]
        full_url = urllib.parse.urljoin(base_url, href)
        parsed_url = urllib.parse.urlparse(full_url)
        # Only keep links within the same domain, strip fragments/queries for normalization
        if parsed_url.netloc == base_domain:
            clean_url = urllib.parse.urlunparse((
                parsed_url.scheme,
                parsed_url.netloc,
                parsed_url.path,
                "", "", ""
            ))
            if clean_url not in links:
                links.append(clean_url)

    # 3. Extract and convert tables to markdown
    tables_md = []
    for table in soup.find_all("table"):
        table_markdown = convert_table_to_markdown(table)
        if table_markdown:
            tables_md.append(table_markdown)
            # Remove table from soup so it doesn't duplicate in text extraction
            table.decompose()

    # 4. Strip boilerplate scripts/styles
    for element in soup(["script", "style", "noscript", "iframe", "svg", "header", "footer", "nav", "form"]):
        element.decompose()

    # 5. Extract cleaned text
    text_content = soup.get_text(separator="\n")
    # Clean up excess whitespace and blank lines
    text_content = re.sub(r"\n\s*\n+", "\n\n", text_content)
    text_content = re.sub(r" +", " ", text_content)
    text_content = text_content.strip()

    return {
        "title": title,
        "cleaned_text": text_content,
        "tables_markdown": tables_md,
        "links": links
    }

def convert_table_to_markdown(table_tag) -> str:
    """
    Helper function to parse an HTML table tag into markdown text.
    """
    rows = []
    for tr in table_tag.find_all("tr"):
        cells = []
        for cell in tr.find_all(["td", "th"]):
            # Normalize cell text
            txt = re.sub(r"\s+", " ", cell.get_text(strip=True))
            cells.append(txt)
        if cells:
            rows.append(cells)
            
    if not rows:
        return ""
    
    # Check max columns to pad headers or rows
    max_cols = max(len(r) for r in rows)
    headers = rows[0]
    if len(headers) < max_cols:
        headers += [""] * (max_cols - len(headers))
        
    markdown = []
    # Header row
    markdown.append("| " + " | ".join(headers) + " |")
    # Separator row
    markdown.append("| " + " | ".join(["---"] * max_cols) + " |")
    # Data rows
    for row in rows[1:]:
        if len(row) < max_cols:
            row += [""] * (max_cols - len(row))
        elif len(row) > max_cols:
            row = row[:max_cols]
        markdown.append("| " + " | ".join(row) + " |")
        
    return "\n".join(markdown)

async def scrape_url(url: str, use_playwright: bool = True) -> dict:
    """
    Scrapes a web page. Runs Playwright by default for full JS rendering,
    and falls back to standard HTTP requests if it fails.
    """
    html_content = ""
    success = False
    
    if use_playwright:
        try:
            logger.info(f"Scraping {url} with Playwright")
            async with async_playwright() as p:
                browser = await p.chromium.launch(headless=True)
                page = await browser.new_page()
                await page.set_viewport_size({"width": 1280, "height": 800})
                await page.set_extra_http_headers({
                    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
                })
                # Go to URL with 10s timeout
                await page.goto(url, wait_until="networkidle", timeout=10000)
                html_content = await page.content()
                await browser.close()
                success = True
        except Exception as e:
            logger.warning(f"Playwright scraping failed for {url}: {e}. Falling back to requests.")
            
    if not success:
        try:
            logger.info(f"Scraping {url} with requests")
            headers = {
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
            }
            r = requests.get(url, headers=headers, timeout=5)
            r.raise_for_status()
            html_content = r.text
        except Exception as e:
            logger.error(f"Requests scraping failed for {url}: {e}")
            raise e

    return clean_html(html_content, url)
