from flask import Flask, render_template, jsonify
import mysql.connector
import threading
import os
from dotenv import load_dotenv
import scrap

load_dotenv()

app = Flask(__name__)

# =====================================================
# DATABASE CONFIG
# =====================================================

DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("MAIN_DB_NAME")
}

refresh_running = False


def get_connection():
    return mysql.connector.connect(**DB_CONFIG)


# =====================================================
# HOME
# =====================================================

@app.route("/")
def home():
    return render_template("index.html")


# =====================================================
# MANUAL REFRESH
# =====================================================

@app.route("/api/fetch-now", methods=["POST"])
def fetch_now():

    global refresh_running

    if refresh_running:
        return jsonify({
            "status": "running",
            "message": "Refresh already running"
        })

    def run_refresh():

        global refresh_running

        try:

            refresh_running = True

            print("=" * 80)
            print("MANUAL REFRESH STARTED")
            print("=" * 80)

            scrap.scheduler()

            print("=" * 80)
            print("MANUAL REFRESH COMPLETED")
            print("=" * 80)

        except Exception as e:

            print("REFRESH ERROR:", e)

        finally:

            refresh_running = False

    threading.Thread(
        target=run_refresh,
        daemon=True
    ).start()

    return jsonify({
        "status": "success",
        "message": "Refresh Started"
    })


# =====================================================
# REFRESH STATUS
# =====================================================

@app.route("/api/refresh-status")
def refresh_status():

    return jsonify({
        "running": refresh_running
    })


# =====================================================
# STATUS SUMMARY TABLE
# =====================================================

@app.route("/api/status-summary")
def status_summary():

    try:

        conn = get_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT
                m.maintainer_name,
                s.total_stp,
                s.compliant,
                s.non_compliant,
                s.non_operational,
                s.report_date
            FROM stp_status_summary s
            INNER JOIN stp_maintainers m
                ON s.maintainer_id = m.maintainer_id
            ORDER BY m.maintainer_name
        """)

        rows = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify(rows)

    except Exception as e:

        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500


# =====================================================
# CAPACITY SUMMARY TABLE
# =====================================================

@app.route("/api/capacity-summary")
def capacity_summary():

    try:

        conn = get_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT
                c.category_name,
                s.total_stp,
                s.capacity_mld,
                s.utilization_capacity_mld,
                s.utilization_percent,
                s.report_date
            FROM stp_capacity_summary s
            INNER JOIN stp_categories c
                ON s.category_id = c.category_id
            ORDER BY c.category_id
        """)

        rows = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify(rows)

    except Exception as e:

        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500


# =====================================================
# DASHBOARD STATS
# =====================================================

@app.route("/api/stats")
def stats():

    try:

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            SELECT COUNT(*)
            FROM stp_maintainers
        """)
        maintainers = cursor.fetchone()[0]

        cursor.execute("""
            SELECT COUNT(*)
            FROM stp_categories
        """)
        categories = cursor.fetchone()[0]

        cursor.execute("""
            SELECT MAX(report_date)
            FROM stp_status_summary
        """)
        report_date = cursor.fetchone()[0]

        cursor.close()
        conn.close()

        return jsonify({
            "maintainers": maintainers,
            "categories": categories,
            "report_date": str(report_date)
        })

    except Exception as e:

        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500


# =====================================================
# FAVICON
# =====================================================

@app.route("/favicon.ico")
def favicon():
    return "", 204


# =====================================================
# GLOBAL ERROR HANDLER
# =====================================================

@app.errorhandler(Exception)
def handle_error(error):

    print("ERROR:", error)

    return jsonify({
        "status": "error",
        "message": str(error)
    }), 500


# =====================================================
# START SERVER
# =====================================================

if __name__ == "__main__":

    print("Starting Flask Server...")
    print("Database:", DB_CONFIG["database"])

    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True
    )