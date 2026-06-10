from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, JSON
from sqlalchemy.orm import relationship
from datetime import datetime
from app.db import Base

class SchemaMetadata(Base):
    __tablename__ = "schemas"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    source_id = Column(Integer, ForeignKey("sources.id", ondelete="CASCADE"), nullable=False)
    schema_name = Column(String(255), nullable=False, index=True)
    schema_json = Column(JSON, nullable=False)  # Schema details e.g., {"district": "string", "river": "string"}
    created_at = Column(DateTime, default=datetime.utcnow)

    # Relationships
    source = relationship("Source", back_populates="schemas")
