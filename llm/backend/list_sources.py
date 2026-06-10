from app.db import SessionLocal
from app.models.source import Source

db = SessionLocal()
sources = db.query(Source).all()
print(f"Total Sources: {len(sources)}")
for s in sources:
    print(f"ID: {s.id} | Type: {s.source_type} | Status: {s.status} | URL: {s.url} | Title: {s.title}")
db.close()
