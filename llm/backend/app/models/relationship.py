from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.db import Base

class Relationship(Base):
    __tablename__ = "relationships"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    parent_record_id = Column(Integer, ForeignKey("records.id", ondelete="CASCADE"), nullable=False)
    child_record_id = Column(Integer, ForeignKey("records.id", ondelete="CASCADE"), nullable=False)
    relationship_type = Column(String(255), nullable=False)

    # Relationships to Record objects
    parent = relationship("Record", foreign_keys=[parent_record_id])
    child = relationship("Record", foreign_keys=[child_record_id])
