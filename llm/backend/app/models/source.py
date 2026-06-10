from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.orm import relationship
from datetime import datetime
from app.db import Base

class Source(Base):
    __tablename__ = "sources"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    url = Column(String(2048), nullable=True)
    title = Column(String(255), nullable=True)
    source_type = Column(String(50), nullable=False)  # 'url', 'pdf', 'html', 'csv', 'xlsx', 'json', 'xml'
    status = Column(String(50), nullable=False, default="pending")  # 'pending', 'processing', 'completed', 'failed'
    created_at = Column(DateTime, default=datetime.utcnow)

    # Relationships
    schemas = relationship("SchemaMetadata", back_populates="source", cascade="all, delete-orphan")
    records = relationship("Record", back_populates="source", cascade="all, delete-orphan")
