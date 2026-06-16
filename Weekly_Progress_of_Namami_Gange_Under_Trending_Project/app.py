from flask import Flask, jsonify, render_template
import mysql.connector
import threading
import scrap
from manual_refresh import manual_refresh
app = Flask(__name__)

refresh_running = False

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "Utkarshahu@18",
    "database": "weekly_progress_of_namami_gange_undertendering_projects"
}


def get_connection():

    return mysql.connector.connect(
        **DB_CONFIG
    )


@app.route("/")
def home():

    return render_template(
        "index.html"
    )


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

            print("=" * 60)
            print("MANUAL REFRESH STARTED")
            print("=" * 60)

            success = manual_refresh()

            print(
                "Result :",
                success
            )

            print("=" * 60)
            print("MANUAL REFRESH COMPLETED")
            print("=" * 60)

        except Exception as e:

            print(
                "REFRESH ERROR :",
                e
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


@app.route("/api/current")
def current_data():

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

            p.scheme_type,
            p.project_mode,

            p.sanction_date,

            p.sanction_cost,
            p.work_cost,
            p.centage,
            p.om_cost,

            p.stp_count,
            p.stp_capacity,
            p.drain_count,

            p.update_date,

            p.remarks,

            p.scrape_time

        FROM undertendering_projects p

        LEFT JOIN districts d
            ON p.district_id = d.district_id

        LEFT JOIN cities c
            ON p.city_id = c.city_id

        ORDER BY p.sr_no
    """)

    data = cur.fetchall()

    cur.close()
    conn.close()

    return jsonify(data)


@app.route("/api/stats")
def stats():

    conn = get_connection()

    cur = conn.cursor()

    cur.execute("""
        SELECT COUNT(*)
        FROM undertendering_projects
    """)

    total_projects = cur.fetchone()[0]

    cur.execute("""
        SELECT COUNT(*)
        FROM districts
    """)

    total_districts = cur.fetchone()[0]

    cur.close()
    conn.close()

    return jsonify({

        "total_projects":
        total_projects,

        "total_districts":
        total_districts

    })


@app.route("/test-db")
def test_db():

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


if __name__ == "__main__":

    print("=" * 60)

    print(
        "UNDER TENDERING SERVER STARTED"
    )

    print("=" * 60)

    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True
    )