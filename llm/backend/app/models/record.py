from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, JSON
from sqlalchemy.orm import relationship
from datetime import datetime
from app.db import Base

class Record(Base):
    __tablename__ = "records"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    source_id = Column(Integer, ForeignKey("sources.id", ondelete="CASCADE"), nullable=False)
    record_type = Column(String(255), nullable=False, index=True)  # Matches schema_name
    data_json = Column(JSON, nullable=False)  # Extracted key-values
    created_at = Column(DateTime, default=datetime.utcnow)

    # Relationships
    source = relationship("Source", back_populates="records")
