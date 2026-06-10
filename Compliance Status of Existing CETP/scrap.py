import requests
from bs4 import BeautifulSoup
import os
import time
from datetime import datetime
import mysql.connector
from dotenv import load_dotenv


load_dotenv()

URL = "https://jjm.up.gov.in/NamamiGange/jjm_Compliance_Status_of_Existing_CETP"


MAIN_DB = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("MAIN_DB_NAME")
}

AUDIT_DB = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("AUDIT_DB_NAME")
}


ONLINE_MODE = False
LOCAL_HTML_FILE = "cetp_compliance.html"


def get_html():

    if ONLINE_MODE:

        print("Downloading page...")

        response = requests.get(
            URL,
            headers={
                "User-Agent": "Mozilla/5.0"
            },
            timeout=60
        )

        response.raise_for_status()

        html = response.text

        with open(
            LOCAL_HTML_FILE,
            "w",
            encoding="utf-8"
        ) as f:
            f.write(html)

        print("HTML Saved")

        return html

    else:

        print("Reading Local HTML...")

        with open(
            LOCAL_HTML_FILE,
            "r",
            encoding="utf-8"
        ) as f:

            return f.read()


def split_actual_design(td):

    up = td.find("b", class_="up")
    down = td.find("b", class_="down")

    actual = (
        up.get_text(strip=True)
        if up else ""
    )

    design = (
        down.get_text(strip=True)
        if down else ""
    )

    return actual, design


def scrape_data():

    html = get_html()

    soup = BeautifulSoup(
        html,
        "html.parser"
    )

    table = soup.find(
        "table",
        id="tableReportTable"
    )

    if table is None:
        raise Exception(
            "tableReportTable not found"
        )

    rows = table.find_all("tr")

    print(
        f"Rows Found = {len(rows)}"
    )

    records = []

    for row in rows:

        cols = row.find_all(
            "td",
            recursive=False
        )

        if len(cols) != 12:
            continue

        bod_actual, bod_design = split_actual_design(
            cols[7]
        )

        cod_actual, cod_design = split_actual_design(
            cols[8]
        )

        tss_actual, tss_design = split_actual_design(
            cols[9]
        )

        ph_actual, ph_design = split_actual_design(
            cols[10]
        )

        record = {

            "sr_no":
            cols[0].get_text(strip=True),

            "cetp_name":
            cols[1].get_text(strip=True),

            "total_industries":
            cols[2].get_text(strip=True),

            "capacity_mld":
            cols[3].get_text(strip=True),

            "executing_agency":
            cols[4].get_text(strip=True),

            "compliance_status":
            cols[5].get_text(strip=True),

            "department":
            cols[6].get_text(strip=True),

            "bod_actual":
            bod_actual,

            "bod_design":
            bod_design,

            "cod_actual":
            cod_actual,

            "cod_design":
            cod_design,

            "tss_actual":
            tss_actual,

            "tss_design":
            tss_design,

            "ph_actual":
            ph_actual,

            "ph_design":
            ph_design,

            "remarks":
            cols[11].get_text(
                " ",
                strip=True
            )
        }

        records.append(record)

    return records


def save_csv(records):

    if not records:

        print(
            "No Records Found"
        )

        return

    with open(
        "cetp_compliance.csv",
        "w",
        newline="",
        encoding="utf-8-sig"
    ) as f:

        writer = csv.DictWriter(
            f,
            fieldnames=records[0].keys()
        )

        writer.writeheader()

        writer.writerows(records)

    print(
        f"CSV Saved. Records = {len(records)}"
    )
def backup_current_to_audit():

    main_conn = mysql.connector.connect(
        **MAIN_DB
    )

    audit_conn = mysql.connector.connect(
        **AUDIT_DB
    )

    main_cur = main_conn.cursor(dictionary=True)
    audit_cur = audit_conn.cursor()

    audit_cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    audit_cur.execute(
        "TRUNCATE TABLE audit_cetp_compliance_statistics"
    )

    audit_cur.execute(
        "TRUNCATE TABLE audit_cetp_master"
    )

    audit_cur.execute(
        "TRUNCATE TABLE audit_cetps"
    )

    audit_cur.execute(
        "TRUNCATE TABLE audit_executing_agencies"
    )

    audit_cur.execute(
        "TRUNCATE TABLE audit_departments"
    )

    audit_cur.execute(
        "SET FOREIGN_KEY_CHECKS=1"
    )

    main_cur.execute("""
        SELECT *
        FROM cetps
    """)

    cetps = main_cur.fetchall()

    cetp_map = {}

    for row in cetps:

        audit_cur.execute("""
            INSERT INTO audit_cetps
            (
                cetp_name
            )
            VALUES (%s)
        """, (
            row["cetp_name"],
        ))

        cetp_map[
            row["cetp_id"]
        ] = audit_cur.lastrowid

    main_cur.execute("""
        SELECT *
        FROM executing_agencies
    """)

    agency_map = {}

    for row in main_cur.fetchall():

        audit_cur.execute("""
            INSERT INTO
            audit_executing_agencies
            (
                agency_name
            )
            VALUES (%s)
        """, (
            row["agency_name"],
        ))

        agency_map[
            row["agency_id"]
        ] = audit_cur.lastrowid

    main_cur.execute("""
        SELECT *
        FROM departments
    """)

    dept_map = {}

    for row in main_cur.fetchall():

        audit_cur.execute("""
            INSERT INTO
            audit_departments
            (
                department_name
            )
            VALUES (%s)
        """, (
            row["department_name"],
        ))

        dept_map[
            row["department_id"]
        ] = audit_cur.lastrowid

    master_map = {}

    main_cur.execute("""
        SELECT *
        FROM cetp_master
    """)

    for row in main_cur.fetchall():

        audit_cur.execute("""
            INSERT INTO
            audit_cetp_master
            (
                audit_cetp_id,
                audit_agency_id,
                audit_department_id,
                total_industries,
                capacity_mld
            )
            VALUES
            (%s,%s,%s,%s,%s)
        """, (

            cetp_map[
                row["cetp_id"]
            ],

            agency_map[
                row["agency_id"]
            ],

            dept_map[
                row["department_id"]
            ],

            row["total_industries"],
            row["capacity_mld"]
        ))

        master_map[
            row["cetp_master_id"]
        ] = audit_cur.lastrowid

    main_cur.execute("""
        SELECT *
        FROM cetp_compliance_statistics
    """)

    for row in main_cur.fetchall():

        audit_cur.execute("""
            INSERT INTO
            audit_cetp_compliance_statistics
            (
                audit_master_id,
                compliance_status,
                bod_actual,
                bod_design,
                cod_actual,
                cod_design,
                tss_actual,
                tss_design,
                ph_actual,
                ph_design,
                remarks,
                report_date
            )
            VALUES
            (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        """, (

            master_map[
                row["cetp_master_id"]
            ],

            row["compliance_status"],
            row["bod_actual"],
            row["bod_design"],
            row["cod_actual"],
            row["cod_design"],
            row["tss_actual"],
            row["tss_design"],
            row["ph_actual"],
            row["ph_design"],
            row["remarks"],
            row["report_date"]
        ))

    audit_conn.commit()

    main_cur.close()
    audit_cur.close()

    main_conn.close()
    audit_conn.close()

    print("CURRENT To AUDIT DONE")

import csv
import mysql.connector


import csv
import mysql.connector


def load_csv_to_current(csv_file="cetp_compliance.csv"):

    conn = mysql.connector.connect(**MAIN_DB)

    cursor = conn.cursor()

    cursor.execute("SET FOREIGN_KEY_CHECKS=0")

    cursor.execute(
        "TRUNCATE TABLE cetp_compliance_statistics"
    )

    cursor.execute(
        "TRUNCATE TABLE cetp_master"
    )

    cursor.execute(
        "TRUNCATE TABLE cetps"
    )

    cursor.execute(
        "TRUNCATE TABLE executing_agencies"
    )

    cursor.execute(
        "TRUNCATE TABLE departments"
    )

    cursor.execute("SET FOREIGN_KEY_CHECKS=1")

    conn.commit()

    with open(
        csv_file,
        "r",
        encoding="utf-8-sig"
    ) as f:

        reader = csv.DictReader(f)

        cetp_cache = {}
        agency_cache = {}
        dept_cache = {}

        for row in reader:

            # ==================================
            # CETP
            # ==================================

            cetp_name = row["cetp_name"].strip()

            if cetp_name in cetp_cache:

                cetp_id = cetp_cache[cetp_name]

            else:

                cursor.execute("""
                    INSERT INTO cetps
                    (
                        cetp_name
                    )
                    VALUES (%s)
                """, (
                    cetp_name,
                ))

                cetp_id = cursor.lastrowid

                cetp_cache[
                    cetp_name
                ] = cetp_id

            # ==================================
            # AGENCY
            # ==================================

            agency_name = row[
                "executing_agency"
            ].strip()

            if agency_name in agency_cache:

                agency_id = agency_cache[
                    agency_name
                ]

            else:

                cursor.execute("""
                    INSERT INTO
                    executing_agencies
                    (
                        agency_name
                    )
                    VALUES (%s)
                """, (
                    agency_name,
                ))

                agency_id = cursor.lastrowid

                agency_cache[
                    agency_name
                ] = agency_id

            # ==================================
            # DEPARTMENT
            # ==================================

            department_name = row[
                "department"
            ].strip()

            if department_name in dept_cache:

                department_id = dept_cache[
                    department_name
                ]

            else:

                cursor.execute("""
                    INSERT INTO
                    departments
                    (
                        department_name
                    )
                    VALUES (%s)
                """, (
                    department_name,
                ))

                department_id = cursor.lastrowid

                dept_cache[
                    department_name
                ] = department_id

            # ==================================
            # MASTER
            # ==================================

            capacity = (
                row["capacity_mld"]
                .replace("MLD", "")
                .strip()
            )

            try:
                capacity = float(capacity)
            except:
                capacity = 0

            cursor.execute("""
                INSERT INTO
                cetp_master
                (
                    cetp_id,
                    agency_id,
                    department_id,
                    total_industries,
                    capacity_mld
                )
                VALUES
                (%s,%s,%s,%s,%s)
            """, (

                cetp_id,
                agency_id,
                department_id,

                int(
                    row[
                        "total_industries"
                    ] or 0
                ),

                capacity
            ))

            master_id = cursor.lastrowid

            # ==================================
            # COMPLIANCE STATS
            # ==================================

            def safe_float(v):

                try:
                    return float(v)
                except:
                    return None

            cursor.execute("""
                INSERT INTO
                cetp_compliance_statistics
                (
                    cetp_master_id,

                    compliance_status,

                    bod_actual,
                    bod_design,

                    cod_actual,
                    cod_design,

                    tss_actual,
                    tss_design,

                    ph_actual,
                    ph_design,

                    remarks,

                    scrape_time
                )
                VALUES
                (
                    %s,%s,
                    %s,%s,
                    %s,%s,
                    %s,%s,
                    %s,%s,
                    %s,
                    NOW()
                )
            """, (

                master_id,

                row[
                    "compliance_status"
                ],

                safe_float(
                    row["bod_actual"]
                ),
                row["bod_design"],

                safe_float(
                    row["cod_actual"]
                ),
                row["cod_design"],

                safe_float(
                    row["tss_actual"]
                ),
                row["tss_design"],

                row["ph_actual"],
                row["ph_design"],

                row["remarks"]
            ))

    conn.commit()

    cursor.close()

    conn.close()

    print(
        "CSV To CURRENT DB DONE"
    )

def scheduler():

    while True:

        try:

            print("\n" + "=" * 80)
            print("START :", datetime.now())
            print("=" * 80)

            records = scrape_data()

            print(
                f"Records Found = {len(records)}"
            )

            save_csv(records)

            backup_current_to_audit()

            load_csv_to_current(
                "cetp_compliance.csv"
            )

            print(
                "SYNC COMPLETED"
            )

        except Exception as e:

            print(
                "\nERROR :",
                str(e)
            )

        print(
            "\nWaiting 10 seconds..."
        )

        time.sleep(10)


if __name__ == "__main__":

    scheduler()