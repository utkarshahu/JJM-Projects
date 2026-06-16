from flask import Flask, jsonify, render_template
import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()
import manual_refresh
app = Flask(__name__)
refresh_running = False
DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("MAIN_DB_NAME")
}


def get_connection():
    return mysql.connector.connect(**DB_CONFIG)


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/api/current")
def current_data():

    conn = get_connection()
    cur = conn.cursor(dictionary=True)

    cur.execute("""
        SELECT
            p.project_id,
            p.sr_no,
            d.district_name,
            c.city_name,
            a.agency_name,

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

            p.agreement_cost,

            p.start_date,
            p.agreement_completion_date,

            p.revised_date,

            p.physical_progress,
            p.financial_progress,

            p.update_date,

            p.remarks,
            p.reason_for_delay,
            p.action_taken,

            p.tentative_inauguration_date,
            p.tentative_zero_discharge_date

        FROM sewerage_projects p

        LEFT JOIN districts d
            ON p.district_id = d.district_id

        LEFT JOIN cities c
            ON p.city_id = c.city_id

        LEFT JOIN agencies a
            ON p.agency_id = a.agency_id

        ORDER BY p.sr_no
    """)

    projects = cur.fetchall()

    result = []

    for project in projects:

        cur.execute("""
            SELECT
                work_component,
                component_count,
                capacity_length_no,
                physical_progress,
                photos
            FROM project_components
            WHERE project_id = %s
        """, (project["project_id"],))

        components = cur.fetchall()

        project["components"] = components

        result.append(project)

    cur.close()
    conn.close()

    return jsonify(result)

@app.route("/api/fetch-now", methods=["POST"])
def fetch_now():

    global refresh_running

    if refresh_running:

        return jsonify({
            "success": False,
            "message": "Refresh already running"
        })

    try:

        refresh_running = True

        manual_refresh.main()

        return jsonify({
            "success": True,
            "message": "Data Refreshed Successfully"
        })

    except Exception as e:

        return jsonify({
            "success": False,
            "message": str(e)
        }), 500

    finally:

        refresh_running = False

@app.route("/api/stats")
def stats():

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT COUNT(*)
        FROM sewerage_projects
    """)

    total_projects = cur.fetchone()[0]

    cur.execute("""
        SELECT COUNT(*)
        FROM districts
    """)

    total_districts = cur.fetchone()[0]

    cur.execute("""
        SELECT MAX(update_date)
        FROM sewerage_projects
    """)

    last_update = cur.fetchone()[0]

    cur.close()
    conn.close()

    return jsonify({
        "total_projects": total_projects,
        "total_districts": total_districts,
        "last_update": str(last_update)
    })


@app.route("/test-db")
def test_db():

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SHOW TABLES")

    data = cur.fetchall()

    cur.close()
    conn.close()

    return jsonify(data)


if __name__ == "__main__":

    print("Starting Flask Server...")
    print("DB :", DB_CONFIG["database"])

    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True,

    )