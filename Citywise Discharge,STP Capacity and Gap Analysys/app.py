from flask import Flask, render_template, jsonify
import mysql.connector
import threading
import scrap
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("MAIN_DB_NAME")
}

print("DB CONFIG:", DB_CONFIG)


def get_connection():
    return mysql.connector.connect(**DB_CONFIG)


@app.route("/")
def home():
    return render_template("index.html")


# ==========================
# MANUAL REFRESH
# ==========================

refresh_running = False


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

            print("===== MANUAL REFRESH STARTED =====")

            scrap.scheduler()

            print("===== MANUAL REFRESH COMPLETED =====")

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


# ==========================
# DATA API
# ==========================

@app.route("/api/current")
@app.route("/api/hierarchy")
def current_data():

    try:

        conn = get_connection()
        cursor = conn.cursor(dictionary=True)

        query = """
        SELECT

            d.district_name,
            t.town_city_name,
            r.river_name,

            ps.present_population_2024,
            ps.present_population_based_sewage_generation_2024,
            ps.length_of_sewerage_network_km,
            ps.no_of_house_holds,
            ps.no_of_hh_connected_to_sewerage_network,
            ps.projected_population_2037,
            ps.population_based_sewage_generation_2037,
            ps.sewage_gap_based_on_projected_population_2037,

            ds.tapped_partial_untapped_drains,
            ds.not_to_be_tapped_drains,
            ds.total_drains,

            ds.discharge_through_drains_mld,
            ds.discharge_through_sewer_network_mld,
            ds.total_discharge_mld,

            ds.no_of_existing_stp,
            ds.capacity_of_existing_stp,
            ds.utilization_capacity_of_existing_stp,

            ds.gap_installed_capacity_population_flow,
            ds.gap_utilization_capacity_population_flow,

            ds.gap_installed_capacity_actual_discharge,
            ds.gap_utilization_capacity_actual_discharge,

            ds.no_of_stp_under_construction,
            ds.capacity_of_stp_under_construction,

            ds.no_of_stp_under_tendering,
            ds.capacity_of_stp_under_tendering,

            ds.capacity_proposed,

            ds.total_capacity_mld,
            ds.sewage_gap_mld,
            ds.gap_based_on_population_mld,

            ds.remark,
            ds.scrape_time

        FROM districts d

        INNER JOIN towns_cities t
            ON d.district_id = t.district_id

        INNER JOIN population_statistics ps
            ON t.town_city_id = ps.town_city_id

        INNER JOIN town_rivers tr
            ON t.town_city_id = tr.town_city_id

        INNER JOIN rivers r
            ON tr.river_id = r.river_id

        INNER JOIN drainage_stp_statistics ds
            ON tr.town_river_id = ds.town_river_id

        ORDER BY
            d.district_name,
            t.town_city_name,
            r.river_name
        """

        cursor.execute(query)

        rows = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify(rows)

    except Exception as e:

        print("CURRENT API ERROR:", e)

        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500


# ==========================
# STATS
# ==========================

@app.route("/api/stats")
def stats():

    try:

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT COUNT(*) FROM districts")
        districts = cursor.fetchone()[0]

        cursor.execute("SELECT COUNT(*) FROM towns_cities")
        towns = cursor.fetchone()[0]

        cursor.execute("SELECT COUNT(*) FROM rivers")
        rivers = cursor.fetchone()[0]

        cursor.execute("""
            SELECT MAX(scrape_time)
            FROM drainage_stp_statistics
        """)
        last_update = cursor.fetchone()[0]

        cursor.close()
        conn.close()

        return jsonify({
            "districts": districts,
            "towns": towns,
            "rivers": rivers,
            "last_update": str(last_update)
        })

    except Exception as e:

        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500


@app.route("/favicon.ico")
def favicon():
    return "", 204


if __name__ == "__main__":

    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True
    )