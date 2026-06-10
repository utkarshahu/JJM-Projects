from flask import Flask, render_template, jsonify
import mysql.connector
import threading
import os
from dotenv import load_dotenv
import manual_refresh
import subprocess
import sys
load_dotenv()


app = Flask(__name__)

# =====================================================
# DATABASE CONFIG
# =====================================================

MAIN_DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("MAIN_DB_NAME")
}

AUDIT_DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("AUDIT_DB_NAME")
}

refresh_running = False


# =====================================================
# CONNECTIONS
# =====================================================

def get_connection():
    return mysql.connector.connect(
        **MAIN_DB_CONFIG
    )


def get_audit_connection():
    return mysql.connector.connect(
        **AUDIT_DB_CONFIG
    )


# =====================================================
# HOME
# =====================================================

@app.route("/")
def home():

    return render_template(
        "index.html"
    )


# =====================================================
# REFRESH STATUS
# =====================================================

@app.route("/api/refresh-status")
def refresh_status():

    return jsonify({
        "running": refresh_running
    })


# =====================================================
# CURRENT DATA
# =====================================================

@app.route("/api/current")
def current_data():

    try:

        conn = get_connection()

        cursor = conn.cursor(
            dictionary=True
        )

        cursor.execute("""

            SELECT

                c.cetp_name,

                cm.total_industries,
                cm.capacity_mld,

                ea.agency_name,

                d.department_name,

                cs.compliance_status,

                cs.bod_actual,
                cs.bod_design,

                cs.cod_actual,
                cs.cod_design,

                cs.tss_actual,
                cs.tss_design,

                cs.ph_actual,
                cs.ph_design,

                cs.remarks,

                cs.report_date,
                cs.scrape_time

            FROM cetp_compliance_statistics cs

            INNER JOIN cetp_master cm
                ON cs.cetp_master_id =
                   cm.cetp_master_id

            INNER JOIN cetps c
                ON cm.cetp_id =
                   c.cetp_id

            INNER JOIN executing_agencies ea
                ON cm.agency_id =
                   ea.agency_id

            INNER JOIN departments d
                ON cm.department_id =
                   d.department_id

            ORDER BY c.cetp_name

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
# AUDIT DATA
# =====================================================

@app.route("/api/audit")
def audit_data():

    try:

        conn = get_audit_connection()

        cursor = conn.cursor(
            dictionary=True
        )

        cursor.execute("""

            SELECT

                c.cetp_name,

                cm.total_industries,
                cm.capacity_mld,

                ea.agency_name,

                d.department_name,

                cs.compliance_status,

                cs.bod_actual,
                cs.bod_design,

                cs.cod_actual,
                cs.cod_design,

                cs.tss_actual,
                cs.tss_design,

                cs.ph_actual,
                cs.ph_design,

                cs.remarks,

                cs.report_date

            FROM cetp_compliance_statistics cs

            INNER JOIN cetp_master cm
                ON cs.cetp_master_id =
                   cm.cetp_master_id

            INNER JOIN cetps c
                ON cm.cetp_id =
                   c.cetp_id

            INNER JOIN executing_agencies ea
                ON cm.agency_id =
                   ea.agency_id

            INNER JOIN departments d
                ON cm.department_id =
                   d.department_id

            ORDER BY c.cetp_name

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

@app.route("/api/fetch-now", methods=["POST"])
def fetch_now():

    try:

        result = subprocess.run(
            [
                sys.executable,
                r"A:\JalJeevanMission\Compliance Status of Existing CETP\manual_refresh.py"
            ],
            capture_output=True,
            text=True
        )

        print("RETURN CODE =", result.returncode)
        print("STDOUT =", result.stdout)
        print("STDERR =", result.stderr)

        if result.returncode != 0:

            return jsonify({
                "success": False,
                "message": result.stderr
            }), 500

        return jsonify({
            "success": True,
            "message": "Data Updated Successfully"
        })

    except Exception as e:

        return jsonify({
            "success": False,
            "message": str(e)
        }), 500
# =====================================================
# STATS
# =====================================================

@app.route("/api/stats")
def stats():

    try:

        conn = get_connection()

        cursor = conn.cursor()

        cursor.execute("""
            SELECT COUNT(*)
            FROM cetps
        """)
        cetps = cursor.fetchone()[0]

        cursor.execute("""
            SELECT COUNT(*)
            FROM executing_agencies
        """)
        agencies = cursor.fetchone()[0]

        cursor.execute("""
            SELECT COUNT(*)
            FROM departments
        """)
        departments = cursor.fetchone()[0]

        cursor.execute("""
            SELECT MAX(report_date)
            FROM cetp_compliance_statistics
        """)
        report_date = cursor.fetchone()[0]

        cursor.close()
        conn.close()

        return jsonify({
            "cetps": cetps,
            "agencies": agencies,
            "departments": departments,
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

    print(
        "ERROR:",
        str(error)
    )

    return jsonify({
        "status": "error",
        "message": str(error)
    }), 500


# =====================================================
# START SERVER
# =====================================================

if __name__ == "__main__":

    print(
        "Starting Flask Server..."
    )

    print(
        "MAIN DB :",
        MAIN_DB_CONFIG["database"]
    )

    print(
        "AUDIT DB :",
        AUDIT_DB_CONFIG["database"]
    )

    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True
    )