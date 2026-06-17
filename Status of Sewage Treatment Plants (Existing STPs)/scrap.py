# scrap.py

import requests
from bs4 import BeautifulSoup
import mysql.connector
from dotenv import load_dotenv
from datetime import datetime
import json
import csv
import os
import time
load_dotenv()

URL = "https://jjm.up.gov.in/NamamiGange/Details_of_existing_STPs_in_Uttar_Pradesh_maintained_by_UPJN_Rural"
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



# ====================================================
# SCRAPE HTML
# ====================================================
ONLINE_MODE = False
LOCAL_HTML_FILE = "upjn_rural.html"
def scrape_data():
    # =====================================
    # ONLINE / OFFLINE MODE
    # =====================================

    if ONLINE_MODE:

        print("Downloading page...")

        response = requests.get(
            URL,
            timeout=60,
            headers={
                "User-Agent": "Mozilla/5.0"
            }
        )

        response.raise_for_status()

        html = response.text

    else:

        print("Reading local HTML file...")

        with open(
                LOCAL_HTML_FILE,
                "r",
                encoding="utf-8"
        ) as f:

            html = f.read()

    # =====================================
    # PARSE HTML
    # =====================================

    soup = BeautifulSoup(
        html,
        "html.parser"
    )

    report_date = ""

    label = soup.select_one(".lastTstamp")

    if label:
        report_date = (
            label.get_text(strip=True)
            .replace("Last Update Date :", "")
            .strip()
        )

    tables = soup.select(
        "table.tableReportTable_my"
    )

    if len(tables) < 2:
        raise Exception(
            f"Required tables not found. Found {len(tables)} tables"
        )

    # =================================================
    # TABLE 1
    # =================================================

    status_summary = []

    rows = tables[0].select("tbody tr")

    for row in rows:

        cols = row.find_all("td")

        if len(cols) != 5:
            continue

        maintainer = cols[0].get_text(strip=True)

        if maintainer.lower() == "total":
            continue

        status_summary.append({

            "maintainer": maintainer,

            "total": int(
                cols[1].get_text(strip=True) or 0
            ),

            "compliant": int(
                cols[2].get_text(strip=True) or 0
            ),

            "non_compliant": int(
                cols[3].get_text(strip=True) or 0
            ),

            "non_operational": int(
                cols[4].get_text(strip=True) or 0
            )
        })

    # =================================================
    # TABLE 2
    # =================================================

    capacity_summary = []

    rows = tables[1].select("tbody tr")

    for row in rows:

        cols = row.find_all("td")

        if len(cols) != 6:
            continue

        category = cols[1].get_text(strip=True)

        if category.lower() == "total":
            continue

        capacity_summary.append({

            "category": category,

            "total": int(
                cols[2].get_text(strip=True) or 0
            ),

            "capacity_mld": float(
                cols[3].get_text(strip=True)
                .replace(",", "") or 0
            ),

            "utilization_capacity_mld": float(
                cols[4].get_text(strip=True)
                .replace(",", "") or 0
            ),

            "utilization_percent": float(
                cols[5].get_text(strip=True)
                .replace("%", "") or 0
            )
        })

    data = {

        "report_date": report_date,

        "scrape_time":
            datetime.now().isoformat(),

        "status_summary":
            status_summary,

        "capacity_summary":
            capacity_summary
    }

    return data


# ====================================================
# JSON EXPORT
# ====================================================

def save_json(data):

    with open(
        "stp_status_up.json",
        "w",
        encoding="utf-8"
    ) as f:

        json.dump(
            data,
            f,
            indent=4,
            ensure_ascii=False
        )

    print("JSON saved")


# ====================================================
# CSV EXPORT
# ====================================================

def save_csv(data):

    with open(
        "status_summary.csv",
        "w",
        newline="",
        encoding="utf-8"
    ) as f:

        writer = csv.DictWriter(
            f,
            fieldnames=[
                "maintainer",
                "total",
                "compliant",
                "non_compliant",
                "non_operational"
            ]
        )

        writer.writeheader()

        writer.writerows(
            data["status_summary"]
        )

    with open(
        "capacity_summary.csv",
        "w",
        newline="",
        encoding="utf-8"
    ) as f:

        writer = csv.DictWriter(
            f,
            fieldnames=[
                "category",
                "total",
                "capacity_mld",
                "utilization_capacity_mld",
                "utilization_percent"
            ]
        )

        writer.writeheader()

        writer.writerows(
            data["capacity_summary"]
        )

    print("CSV saved")


# ====================================================
# MAIN DB LOAD
# ====================================================

def sync_main_db(data):

    conn = mysql.connector.connect(
        **MAIN_DB
    )

    cursor = conn.cursor()

    cursor.execute(
        "DELETE FROM stp_status_summary"
    )

    cursor.execute(
        "DELETE FROM stp_capacity_summary"
    )

    cursor.execute(
        "DELETE FROM stp_maintainers"
    )

    cursor.execute(
        "DELETE FROM stp_categories"
    )

    maintainer_map = {}

    for row in data["status_summary"]:

        cursor.execute("""
        INSERT INTO stp_maintainers
        (maintainer_name)
        VALUES (%s)
        """, (
            row["maintainer"],
        ))

        maintainer_map[
            row["maintainer"]
        ] = cursor.lastrowid

    for row in data["status_summary"]:

        cursor.execute("""
        INSERT INTO
        stp_status_summary
        (
            maintainer_id,
            total_stp,
            compliant,
            non_compliant,
            non_operational,
            report_date
        )
        VALUES
        (%s,%s,%s,%s,%s,%s)
        """, (

            maintainer_map[
                row["maintainer"]
            ],

            row["total"],
            row["compliant"],
            row["non_compliant"],
            row["non_operational"],

            datetime.strptime(
                data["report_date"],
                "%d-%b-%Y"
            ).date()
        ))

    category_map = {}

    for row in data[
        "capacity_summary"
    ]:

        cursor.execute("""
        INSERT INTO stp_categories
        (category_name)
        VALUES (%s)
        """, (
            row["category"],
        ))

        category_map[
            row["category"]
        ] = cursor.lastrowid

    for row in data[
        "capacity_summary"
    ]:

        cursor.execute("""
        INSERT INTO
        stp_capacity_summary
        (
            category_id,
            total_stp,
            capacity_mld,
            utilization_capacity_mld,
            utilization_percent,
            report_date
        )
        VALUES
        (%s,%s,%s,%s,%s,%s)
        """, (

            category_map[
                row["category"]
            ],

            row["total"],
            row["capacity_mld"],
            row["utilization_capacity_mld"],
            row["utilization_percent"],

            datetime.strptime(
                data["report_date"],
                "%d-%b-%Y"
            ).date()
        ))

    conn.commit()

    cursor.close()
    conn.close()

    print("Main DB Updated")


# ====================================================
# AUDIT SNAPSHOT
# ====================================================

def save_audit(data):

    conn = mysql.connector.connect(**AUDIT_DB)
    cursor = conn.cursor()

    report_date = datetime.strptime(
        data["report_date"],
        "%d-%b-%Y"
    ).date()

    # Maintainers
    cursor.execute("DELETE FROM stp_status_summary")
    cursor.execute("DELETE FROM stp_maintainers")

    maintainer_map = {}

    for row in data["status_summary"]:

        cursor.execute("""
            INSERT INTO stp_maintainers
            (maintainer_name)
            VALUES (%s)
        """, (row["maintainer"],))

        maintainer_map[row["maintainer"]] = cursor.lastrowid

    for row in data["status_summary"]:

        cursor.execute("""
            INSERT INTO stp_status_summary
            (
                maintainer_id,
                total_stp,
                compliant,
                non_compliant,
                non_operational,
                report_date
            )
            VALUES (%s,%s,%s,%s,%s,%s)
        """, (
            maintainer_map[row["maintainer"]],
            row["total"],
            row["compliant"],
            row["non_compliant"],
            row["non_operational"],
            report_date
        ))

    # Categories
    cursor.execute("DELETE FROM stp_capacity_summary")
    cursor.execute("DELETE FROM stp_categories")

    category_map = {}

    for row in data["capacity_summary"]:

        cursor.execute("""
            INSERT INTO stp_categories
            (category_name)
            VALUES (%s)
        """, (row["category"],))

        category_map[row["category"]] = cursor.lastrowid

    for row in data["capacity_summary"]:

        cursor.execute("""
            INSERT INTO stp_capacity_summary
            (
                category_id,
                total_stp,
                capacity_mld,
                utilization_capacity_mld,
                utilization_percent,
                report_date
            )
            VALUES (%s,%s,%s,%s,%s,%s)
        """, (
            category_map[row["category"]],
            row["total"],
            row["capacity_mld"],
            row["utilization_capacity_mld"],
            row["utilization_percent"],
            report_date
        ))

    conn.commit()

    cursor.close()
    conn.close()

    print("Audit DB Updated")


# ====================================================
# MASTER SCHEDULER
# ====================================================

def scheduler():

    print("=" * 60)

    print("STEP 1 : SCRAPING")

    data = scrape_data()

    print(
        f"Maintainers: {len(data['status_summary'])}"
    )

    print(
        f"Categories: {len(data['capacity_summary'])}"
    )

    print("=" * 60)

    print("STEP 2 : JSON")

    save_json(data)

    print("=" * 60)

    print("STEP 3 : CSV")

    save_csv(data)

    print("=" * 60)

    print("STEP 4 : MAIN DB")

    sync_main_db(data)

    print("=" * 60)

    print("STEP 5 : AUDIT DB")

    save_audit(data)

    print("=" * 60)

    print("DONE")

def run_forever():

    while True:

        try:

            print("\n" + "=" * 80)
            print("START :", datetime.now())
            print("=" * 80)

            scheduler()

            print("\nNEXT RUN AFTER 10 SECONDS")

        except Exception as e:

            print("\nERROR :", e)

        time.sleep(10)


if __name__ == "__main__":

    run_forever()