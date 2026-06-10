import sys
import os

# Add project root to path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.db import SessionLocal
from app.models.source import Source
from app.worker import extract_url_task

db = SessionLocal()
source = db.query(Source).filter(Source.id == 4).first()
if source:
    print(f"Resetting Source {source.id} from status {source.status} to pending")
    source.status = "pending"
    db.commit()

db.close()

print("Triggering extract_url_task for source ID 4...")
try:
    res = extract_url_task(4)
    print("Task result:", res)
except Exception as e:
    print("Task failed with exception:", e)
