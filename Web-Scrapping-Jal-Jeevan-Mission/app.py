from flask import Flask, jsonify, render_template
import mysql.connector
import subprocess
import sys
from dotenv import load_dotenv
import os
load_dotenv()


DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

MAIN_DB_NAME = os.getenv("MAIN_DB_NAME")
AUDIT_DB_NAME = os.getenv("AUDIT_DB_NAME")
app = Flask(__name__)


# ==========================

# MAIN DB
# ==========================
def get_main_connection():
    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=MAIN_DB_NAME
    )

# ==========================
# AUDIT DB
# ==========================
def get_audit_connection():
    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=AUDIT_DB_NAME
    )


# ==========================
# HOME PAGE
# ==========================

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/test-python")
def test_python():
    return sys.executable

@app.route("/api/fetch-now", methods=["POST"])
def fetch_now():
    try:
        subprocess.run(
            [
                r"C:\Users\utkar\PyCharmMiscProject\.venv\Scripts\python.exe",
                "manual_refresh.py"
            ],
            check=True
        )

        return jsonify({
            "success": True,
            "message": "Data Updated Successfully"
        })

    except Exception as e:

        return jsonify({
            "success": False,
            "message": str(e)
        }), 500



# ==========================
# CURRENT DATA
# ==========================

@app.route("/api/current")
def current_data():

    conn = get_main_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
    SELECT
        d.district_name,
        r.river_name,

        dm.total_drains,
        dm.total_discharge,

        td.tapped_drains,
        td.tapped_discharge,

        ud.untapped_drains,
        ud.untapped_discharge,

        pt.partial_tapped_drains,
        pt.partial_tapped_discharge,

        nt.not_to_be_tapped_drains,
        nt.not_to_be_tapped_discharge,

        dm.scrape_time

    FROM districts d

    JOIN rivers r
        ON d.district_id = r.district_id

    JOIN drain_master dm
        ON r.river_id = dm.river_id

    LEFT JOIN tapped_drains td
        ON dm.drain_id = td.drain_id

    LEFT JOIN untapped_drains ud
        ON dm.drain_id = ud.drain_id

    LEFT JOIN partial_tapped_drains pt
        ON dm.drain_id = pt.drain_id

    LEFT JOIN not_to_be_tapped_drains nt
        ON dm.drain_id = nt.drain_id
    """)

    data = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(data)

# ==========================
# AUDIT DATA
# ==========================

@app.route("/api/audit")
def audit_data():

    conn = get_audit_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
    SELECT
        d.district_name,
        r.river_name,

        dm.total_drains,
        dm.total_discharge,

        td.tapped_drains,
        td.tapped_discharge,

        ud.untapped_drains,
        ud.untapped_discharge,

        pt.partial_tapped_drains,
        pt.partial_tapped_discharge,

        nt.not_to_be_tapped_drains,
        nt.not_to_be_tapped_discharge,

        dm.scrape_time

    FROM districts d

    JOIN rivers r
        ON d.district_id = r.district_id

    JOIN drain_master dm
        ON r.river_id = dm.river_id

    LEFT JOIN tapped_drains td
        ON dm.drain_id = td.drain_id

    LEFT JOIN untapped_drains ud
        ON dm.drain_id = ud.drain_id

    LEFT JOIN partial_tapped_drains pt
        ON dm.drain_id = pt.drain_id

    LEFT JOIN not_to_be_tapped_drains nt
        ON dm.drain_id = nt.drain_id
    """)

    data = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(data)



if __name__ == "__main__":
    app.run(
        debug=True,
        host="0.0.0.0",
        port=5000
    )