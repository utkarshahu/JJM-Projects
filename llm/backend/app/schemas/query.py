from pydantic import BaseModel
from typing import List, Dict, Any, Optional

class QueryRequest(BaseModel):
    query: str

class QueryResponse(BaseModel):
    success: bool
    thought: str
    sql: str
    columns: List[str]
    results: List[Dict[str, Any]]
    execution_time_seconds: float
    error: Optional[str] = None

class AnalyticsRequest(BaseModel):
    query: str

class ChartRec(BaseModel):
    chart_type: str
    x_axis_key: str
    y_axis_keys: List[str]
    title: str

class MetricItem(BaseModel):
    label: str
    value: str

class AnalyticsResponseSchema(BaseModel):
    success: bool
    sql: str
    query_thought: Optional[str] = None
    results: List[Dict[str, Any]]
    columns: List[str]
    summary: str
    insights: List[str]
    metrics: List[MetricItem]
    chart: ChartRec
    execution_time_seconds: float
    error: Optional[str] = None
