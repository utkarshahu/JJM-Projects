from pydantic import BaseModel
from datetime import datetime
from typing import Dict, Any

class RecordResponse(BaseModel):
    id: int
    source_id: int
    record_type: str
    data_json: Dict[str, Any]
    created_at: datetime

    class Config:
        from_attributes = True

class SchemaResponse(BaseModel):
    id: int
    source_id: int
    schema_name: str
    schema_json: Dict[str, str]
    created_at: datetime

    class Config:
        from_attributes = True
