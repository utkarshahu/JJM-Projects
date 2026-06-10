import pytest
from app.services.query_engine import validate_sql_safety

def test_valid_select_queries():
    # Standard SELECT queries targeting records
    q1 = "SELECT id, data_json->>'$.district' AS district FROM records WHERE record_type = 'District'"
    is_safe, err = validate_sql_safety(q1)
    assert is_safe is True
    assert err is None

    # SELECT with casting and aggregates
    q2 = "SELECT data_json->>'$.company' AS company, SUM(CAST(data_json->>'$.revenue' AS DECIMAL(10,2))) AS total_revenue FROM records GROUP BY company"
    is_safe, err = validate_sql_safety(q2)
    assert is_safe is True
    assert err is None

def test_blocked_destructive_keywords():
    # DROP query injection
    is_safe, err = validate_sql_safety("SELECT * FROM records; DROP TABLE sources;")
    assert is_safe is False
    assert "prohibited SQL operations" in err

    # DELETE query injection
    is_safe, err = validate_sql_safety("DELETE FROM records WHERE id = 1")
    assert is_safe is False
    assert "Query must start with SELECT" in err

    # UPDATE query injection
    is_safe, err = validate_sql_safety("SELECT * FROM records; UPDATE records SET data_json = '{}'")
    assert is_safe is False
    assert "prohibited SQL operations" in err

def test_disallowed_tables():
    # Querying system users tables or other arbitrary things (if any)
    is_safe, err = validate_sql_safety("SELECT * FROM users")
    assert is_safe is False
    assert "is not permitted for querying" in err

    # Valid query checking multiple joins of allowed tables
    is_safe, err = validate_sql_safety("SELECT r.id, s.url FROM records r JOIN sources s ON r.source_id = s.id")
    assert is_safe is True
    assert err is None
