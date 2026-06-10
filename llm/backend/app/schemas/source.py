from pydantic import BaseModel, HttpUrl
from datetime import datetime
from typing import Optional

class URLExtractRequest(BaseModel):
    url: str
    crawl: bool = False
    max_depth: Optional[int] = 2
    max_pages: Optional[int] = 10

class SourceResponse(BaseModel):
    id: int
    url: Optional[str] = None
    title: Optional[str] = None
    source_type: str
    status: str
    created_at: datetime

    class Config:
        from_attributes = True
