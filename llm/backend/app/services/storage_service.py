from sqlalchemy.orm import Session
from app.models.source import Source
from app.models.schema import SchemaMetadata
from app.models.record import Record
from app.models.relationship import Relationship
from app.services.extractor import ExtractionResult
import logging

logger = logging.getLogger(__name__)

def save_extraction_result(
    db: Session,
    source_id: int,
    extraction_result: ExtractionResult
) -> dict:
    """
    Saves schemas, records, and relationships inside a transaction,
    mapping temp indexes to generated MySQL record IDs.
    """
    try:
        # 1. Update source status
        source = db.query(Source).filter(Source.id == source_id).first()
        if not source:
            raise ValueError(f"Source with id {source_id} not found")

        # 2. Save Schemas
        db_schemas = []
        for schema_data in extraction_result.schemas:
            # Check if schema already exists for this source
            existing_schema = db.query(SchemaMetadata).filter(
                SchemaMetadata.source_id == source_id,
                SchemaMetadata.schema_name == schema_data.schema_name
            ).first()
            
            schema_json = {f.name: f.type for f in schema_data.fields}
            
            if existing_schema:
                existing_schema.schema_json = schema_json
                db_schemas.append(existing_schema)
            else:
                new_schema = SchemaMetadata(
                    source_id=source_id,
                    schema_name=schema_data.schema_name,
                    schema_json=schema_json
                )
                db.add(new_schema)
                db_schemas.append(new_schema)

        # Flush to get schema IDs (if needed) but keep transaction open
        db.flush()

        # 3. Save Records (maintain list of saved records to match indices for relationships)
        db_records = []
        for idx, record_data in enumerate(extraction_result.records):
            new_record = Record(
                source_id=source_id,
                record_type=record_data.record_type,
                data_json=record_data.data
            )
            db.add(new_record)
            db_records.append(new_record)
            
        # Flush records to populate record.id (needed for relationships)
        db.flush()

        # 4. Save Relationships
        db_relationships = []
        for rel in extraction_result.relationships:
            p_idx = rel.parent_record_index
            c_idx = rel.child_record_index
            
            # Boundary checks
            if 0 <= p_idx < len(db_records) and 0 <= c_idx < len(db_records):
                parent_id = db_records[p_idx].id
                child_id = db_records[c_idx].id
                
                new_rel = Relationship(
                    parent_record_id=parent_id,
                    child_record_id=child_id,
                    relationship_type=rel.relationship_type
                )
                db.add(new_rel)
                db_relationships.append(new_rel)
            else:
                logger.warning(
                    f"Relationship ignored due to invalid indices: parent={p_idx}, child={c_idx} (records count={len(db_records)})"
                )

        # Commit everything
        source.status = "completed"
        db.commit()
        logger.info(f"Successfully saved {len(db_schemas)} schemas, {len(db_records)} records, and {len(db_relationships)} relationships for source {source_id}")
        
        return {
            "schemas_count": len(db_schemas),
            "records_count": len(db_records),
            "relationships_count": len(db_relationships)
        }
    except Exception as e:
        db.rollback()
        logger.error(f"Error saving extraction result: {e}")
        # Mark source as failed
        source = db.query(Source).filter(Source.id == source_id).first()
        if source:
            source.status = "failed"
            db.commit()
        raise e
