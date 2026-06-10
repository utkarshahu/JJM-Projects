from sqlalchemy import Column, Integer, Text, Double, DateTime
from datetime import datetime
from app.db import Base

class QueryHistory(Base):
    __tablename__ = "query_history"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    user_query = Column(Text, nullable=False)
    generated_sql = Column(Text, nullable=False)
    execution_time = Column(Double, nullable=False)  # in seconds
    created_at = Column(DateTime, default=datetime.utcnow)
