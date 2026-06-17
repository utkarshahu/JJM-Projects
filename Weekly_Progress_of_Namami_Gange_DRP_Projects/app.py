import mysql.connector
from manual_refresh import manual_refresh
import os
import threading
import time
from flask import Flask, jsonify, render_template
import mysql.connector
from dotenv import load_dotenv

# Load variables from .env file
load_dotenv()
from scrap import (
    create_csv,
    backup_current_to_audit,
    clear_current,
    load_csv_to_current
)

app = Flask(__name__)

refresh_running = False
# Retrieve values using os.getenv()
DB_CONFIG = {
    "host": os.getenv("DB_HOST", "localhost"),
    "user": os.getenv("DB_USER", "root"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("MAIN_DB_NAME")
}


def get_connection():

    return mysql.connector.connect(
        **DB_CONFIG
    )


def refresh_data():

    global refresh_running

    if refresh_running:
        return False

    try:

        refresh_running = True

        print("\n" + "=" * 60)
        print("AUTO REFRESH STARTED")
        print("=" * 60)

        print(
            "\nSTEP 1 : Create CSV"
        )

        create_csv()

        print(
            "\nSTEP 2 : Backup Current -> Audit"
        )

        backup_current_to_audit()

        print(
            "\nSTEP 3 : Clear Current DB"
        )

        clear_current()

        print(
            "\nSTEP 4 : Load CSV To Current DB"
        )

        load_csv_to_current()

        print(
            "\nAUTO REFRESH COMPLETED"
        )

        return True

    except Exception as e:

        print(
            "\nREFRESH ERROR:",
            e
        )

        return False

    finally:

        refresh_running = False


def background_scheduler():

    while True:

        try:

            refresh_data()

        except Exception as e:

            print(
                "Scheduler Error:",
                e
            )

        time.sleep(10)


@app.route("/")
def home():

    return render_template(
        "index.html"
    )


@app.route("/api/current")
def current_data():

    try:

        conn = get_connection()

        cur = conn.cursor(
            dictionary=True
        )

        cur.execute("""
            SELECT

                p.project_id,

                p.sr_no,

                d.district_name,

                c.city_name,

                p.project_name,

                p.stp_count,

                p.stp_capacity,

                p.drain_count,

                p.update_date,

                p.remarks,

                p.scrape_time

            FROM DRP_Projects p

            LEFT JOIN districts d
                ON p.district_id =
                   d.district_id

            LEFT JOIN cities c
                ON p.city_id =
                   c.city_id

            ORDER BY p.sr_no
        """)

        data = cur.fetchall()

        cur.close()
        conn.close()

        return jsonify(data)

    except Exception as e:

        print(
            "Current Data Error:",
            e
        )

        return jsonify([])


@app.route("/api/stats")
def stats():

    try:

        conn = get_connection()

        cur = conn.cursor()

        cur.execute(
            "SELECT COUNT(*) FROM DRP_Projects"
        )

        total_projects = (
            cur.fetchone()[0]
        )

        cur.execute(
            "SELECT COUNT(*) FROM districts"
        )

        total_districts = (
            cur.fetchone()[0]
        )

        cur.execute(
            "SELECT COUNT(*) FROM cities"
        )

        total_cities = (
            cur.fetchone()[0]
        )

        cur.close()
        conn.close()

        return jsonify({

            "total_projects":
                total_projects,

            "total_districts":
                total_districts,

            "total_cities":
                total_cities,

            "refresh_running":
                refresh_running

        })

    except Exception as e:

        print(
            "Stats Error:",
            e
        )

        return jsonify({

            "total_projects": 0,
            "total_districts": 0,
            "total_cities": 0,
            "refresh_running": False

        })


@app.route("/api/last-update")
def last_update():

    try:

        conn = get_connection()

        cur = conn.cursor()

        cur.execute("""
            SELECT
                MAX(scrape_time)
            FROM DRP_Projects
        """)

        result = cur.fetchone()

        cur.close()
        conn.close()

        return jsonify({

            "last_update":
                str(result[0])
                if result[0]
                else None

        })

    except Exception as e:

        print(
            "Last Update Error:",
            e
        )

        return jsonify({

            "last_update": None

        })

@app.route(
    "/api/fetch-now",
    methods=["POST"]
)
def fetch_now():

    global refresh_running

    if refresh_running:

        return jsonify({
            "success": False,
            "message": "Refresh already running"
        })

    def run_refresh():

        global refresh_running

        try:

            refresh_running = True

            success = manual_refresh()

            print(
                "Refresh Result:",
                success
            )

        finally:

            refresh_running = False

    threading.Thread(
        target=run_refresh,
        daemon=True
    ).start()

    return jsonify({
        "success": True,
        "message": "Refresh Started"
    })
@app.route("/test-db")
def test_db():

    try:

        conn = get_connection()

        cur = conn.cursor()

        cur.execute(
            "SHOW TABLES"
        )

        tables = cur.fetchall()

        cur.close()
        conn.close()

        return jsonify(
            tables
        )

    except Exception as e:

        return jsonify({

            "error": str(e)

        })


if __name__ == "__main__":

    print("=" * 60)
    print("DRP PROJECT SERVER STARTED")
    print("=" * 60)

    threading.Thread(
        target=background_scheduler,
        daemon=True
    ).start()

    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True,
        use_reloader=False
    )