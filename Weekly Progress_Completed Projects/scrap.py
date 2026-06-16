

import os
import csv
import requests
from bs4 import BeautifulSoup
import pandas as pd
import mysql.connector
from datetime import datetime
import time

def get_current_connection():

    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="Utkarshahu@18",
        database="Weekly_Progress_of_Namami_Gange_Completed_Projects"
    )


def get_audit_connection():

    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="Utkarshahu@18",
        database="Audit_Weekly_Progress_of_Namami_Gange_Completed_Projects"
    )
URL = "https://jjm.up.gov.in/NamamiGange/Weekly_Progress_of_Namami_Gange_Projects?mode=C"
USE_LOCAL_HTML = True
HTML_FILE = "weekly_progress_completed_projects.html"


def get_html():

    # Use Local HTML
    if USE_LOCAL_HTML:

        if not os.path.exists(HTML_FILE):

            raise FileNotFoundError(
                f"{HTML_FILE} not found"
            )

        print("=" * 60)
        print("SOURCE : LOCAL HTML")
        print("FILE   :", os.path.abspath(HTML_FILE))
        print("=" * 60)

        with open(
            HTML_FILE,
            "r",
            encoding="utf-8"
        ) as f:

            html = f.read()

        print(
            f"HTML Length : {len(html)}"
        )

        return html

    # Download Fresh HTML
    print("=" * 60)
    print("SOURCE : WEBSITE")
    print("Downloading HTML...")
    print("=" * 60)

    response = requests.get(
        URL,
        headers={
            "User-Agent": "Mozilla/5.0"
        },
        timeout=60
    )

    response.raise_for_status()

    html = response.text

    print(
        f"Downloaded HTML Length : {len(html)}"
    )

    # Always overwrite local file
    with open(
        HTML_FILE,
        "w",
        encoding="utf-8"
    ) as f:

        f.write(html)

    print(
        f"HTML Saved -> {HTML_FILE}"
    )

    return html


# True  -> Use Saved HTML
# False -> Download Fresh HTML
CSV_FILE = "completed_projects.csv"



def clean(value):

    if pd.isna(value):
        return None

    if isinstance(value, str):
        value = value.strip()

        if value == "":
            return None

    return value


def parse_date(value):

    if pd.isna(value):
        return None

    try:
        return datetime.strptime(
            str(value).strip(),
            "%d-%b-%Y"
        ).date()
    except:
        return None

def load_csv_to_current():

    print("Loading CSV")

    df = pd.read_csv(
        "completed_projects.csv"
    )

    conn = get_current_connection()
    cur = conn.cursor()

    district_map = {}
    city_map = {}
    agency_map = {}

    for _, row in df.iterrows():

        district = clean(
            row["District"]
        )

        city = clean(
            row["Town"]
        )

        agency = clean(
            row["Agency Name"]
        )

        remark = clean(
            row["Remark"]
        )

        sanction_date = parse_date(
            row["Date of Sanction"]
        )

        # District
        if district not in district_map:

            cur.execute(
                """
                INSERT INTO districts
                (
                    district_name
                )
                VALUES
                (%s)
                """,
                (district,)
            )

            district_map[district] = (
                cur.lastrowid
            )

        district_id = (
            district_map[district]
        )

        # City
        city_key = (
            district,
            city
        )

        if city_key not in city_map:

            cur.execute(
                """
                INSERT INTO cities
                (
                    district_id,
                    city_name
                )
                VALUES
                (%s,%s)
                """,
                (
                    district_id,
                    city
                )
            )

            city_map[city_key] = (
                cur.lastrowid
            )

        city_id = city_map[
            city_key
        ]

        # Agency
        if agency not in agency_map:

            cur.execute(
                """
                INSERT INTO agencies
                (
                    agency_name
                )
                VALUES
                (%s)
                """,
                (agency,)
            )

            agency_map[agency] = (
                cur.lastrowid
            )

        agency_id = agency_map[
            agency
        ]

        cur.execute(
            """
            INSERT INTO sewerage_projects
            (
                sr_no,
                district_id,
                city_id,
                agency_id,
                project_name,
                scheme_type,
                project_mode,
                sanction_date,
                sanction_cost,
                work_cost,
                centage,
                om_cost,
                stp_count,
                stp_capacity,
                drain_count,
                agreement_cost,
                remarks
            )
            VALUES
            (
                %s,%s,%s,%s,%s,%s,%s,%s,
                %s,%s,%s,%s,%s,%s,%s,%s,%s
            )
            """,
            (
                clean(row["Sr.No"]),
                district_id,
                city_id,
                agency_id,
                clean(row["Name of Sewerage Project"]),
                clean(row["Scheeme Type"]),
                clean(row["Mode of Project"]),
                sanction_date,
                clean(row["Sanction cost (In Cr.)"]),
                clean(row["work Cost (In Cr.)"]),
                clean(row["Centage (In Cr.)"]),
                clean(row["O & M Cost (In Cr.)"]),
                clean(row["No. of STP"]),
                clean(row["STP Capacity"]),
                clean(row["No.Of Drains"]),
                clean(row["Agreement Cost"]),
                remark
            )
        )

    conn.commit()

    cur.close()
    conn.close()

    print(
        f"{len(df)} Projects Saved Successfully"
    )

def clean_text(tag):

    if tag is None:
        return ""

    return tag.get_text(
        " ",
        strip=True
    )
def generate_csv():

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

    rows = table.select("tbody tr")

    print(
        f"Total Rows Found: {len(rows)}"
    )

    csv_rows = []

    for row in rows:

        cols = row.find_all("td")

        if len(cols) < 15:
            continue

        csv_rows.append({

            "Sr.No":
                clean_text(cols[0]),

            "District":
                clean_text(cols[1]),

            "Town":
                clean_text(cols[2]),

            "Name of Sewerage Project":
                clean_text(cols[3]),

            "Scheeme Type":
                clean_text(cols[4]),

            "Mode of Project":
                clean_text(cols[5]),

            "Date of Sanction":
                clean_text(cols[6]),

            "Sanction cost (In Cr.)":
                clean_text(cols[7]),

            "work Cost (In Cr.)":
                clean_text(cols[8]),

            "Centage (In Cr.)":
                clean_text(cols[9]),

            "O & M Cost (In Cr.)":
                clean_text(cols[10]),

            "No. of STP":
                clean_text(cols[11]),

            "STP Capacity":
                clean_text(cols[12]),

            "No.Of Drains":
                clean_text(cols[13]),

            "Agency Name":
                clean_text(cols[14]),

            "Agreement Cost":
                clean_text(cols[15]),

            "Remark":
                clean_text(cols[16])
                if len(cols) > 16
                else ""
        })

    headers = [

        "Sr.No",
        "District",
        "Town",
        "Name of Sewerage Project",
        "Scheeme Type",
        "Mode of Project",
        "Date of Sanction",
        "Sanction cost (In Cr.)",
        "work Cost (In Cr.)",
        "Centage (In Cr.)",
        "O & M Cost (In Cr.)",
        "No. of STP",
        "STP Capacity",
        "No.Of Drains",
        "Agency Name",
        "Agreement Cost",
        "Remark"
    ]

    with open(
        CSV_FILE,
        "w",
        newline="",
        encoding="utf-8-sig"
    ) as f:

        writer = csv.DictWriter(
            f,
            fieldnames=headers
        )

        writer.writeheader()

        writer.writerows(
            csv_rows
        )

    print(
        f"CSV Saved -> {CSV_FILE}"
    )

    print(
        f"Total Projects -> {len(csv_rows)}"
    )
def clear_current():

    conn = get_current_connection()
    cur = conn.cursor()

    cur.execute("DELETE FROM sewerage_projects")
    cur.execute("DELETE FROM agencies")
    cur.execute("DELETE FROM cities")
    cur.execute("DELETE FROM districts")

    conn.commit()

    cur.close()
    conn.close()

    print("Current DB Cleared")
def backup_current_to_audit():

    print("Backing Up Current -> Audit")

    current_conn = get_current_connection()
    audit_conn = get_audit_connection()

    current_cur = current_conn.cursor(dictionary=True)
    audit_cur = audit_conn.cursor()

    # Clear old audit
    audit_cur.execute(
        "DELETE FROM audit_sewerage_projects"
    )

    audit_cur.execute(
        "DELETE FROM audit_cities"
    )

    audit_cur.execute(
        "DELETE FROM audit_districts"
    )

    audit_cur.execute(
        "DELETE FROM audit_agencies"
    )

    audit_conn.commit()

    # Districts
    current_cur.execute(
        "SELECT * FROM districts"
    )

    for row in current_cur.fetchall():

        audit_cur.execute(
            """
            INSERT INTO audit_districts
            (
                district_id,
                district_name
            )
            VALUES
            (%s,%s)
            """,
            (
                row["district_id"],
                row["district_name"]
            )
        )

    # Cities
    current_cur.execute(
        "SELECT * FROM cities"
    )

    for row in current_cur.fetchall():

        audit_cur.execute(
            """
            INSERT INTO audit_cities
            (
                city_id,
                district_id,
                city_name
            )
            VALUES
            (%s,%s,%s)
            """,
            (
                row["city_id"],
                row["district_id"],
                row["city_name"]
            )
        )

    # Agencies
    current_cur.execute(
        "SELECT * FROM agencies"
    )

    for row in current_cur.fetchall():

        audit_cur.execute(
            """
            INSERT INTO audit_agencies
            (
                agency_id,
                agency_name
            )
            VALUES
            (%s,%s)
            """,
            (
                row["agency_id"],
                row["agency_name"]
            )
        )

    # Projects
    current_cur.execute(
        "SELECT * FROM sewerage_projects"
    )

    for row in current_cur.fetchall():

        audit_cur.execute(
            """
            INSERT INTO audit_sewerage_projects
            (
                project_id,
                district_id,
                city_id,
                agency_id,
                project_name,
                scheme_type,
                project_mode,
                sanction_date,
                sanction_cost,
                work_cost,
                centage,
                om_cost,
                stp_count,
                stp_capacity,
                drain_count,
                agreement_cost,
                remarks,
                snapshot_time
            )
            VALUES
            (
                %s,%s,%s,%s,%s,%s,%s,%s,
                %s,%s,%s,%s,%s,%s,%s,%s,%s,%s
            )
            """,
            (
                row["project_id"],
                row["district_id"],
                row["city_id"],
                row["agency_id"],
                row["project_name"],
                row["scheme_type"],
                row["project_mode"],
                row["sanction_date"],
                row["sanction_cost"],
                row["work_cost"],
                row["centage"],
                row["om_cost"],
                row["stp_count"],
                row["stp_capacity"],
                row["drain_count"],
                row["agreement_cost"],
                row["remarks"],
                datetime.now()
            )
        )

    audit_conn.commit()

    current_cur.close()
    audit_cur.close()

    current_conn.close()
    audit_conn.close()

    print("Audit Updated Successfully")
import time

def scheduler():

    while True:

        try:

            print("=" * 60)
            print("Scheduler Running")
            print("=" * 60)

            # Save current state in audit
            backup_current_to_audit()

            # Create fresh CSV
            generate_csv()

            # Replace current data
            clear_current()

            load_csv_to_current()

            print("Cycle Completed")

        except Exception as e:

            print("ERROR :", e)

        time.sleep(10)
if __name__ == "__main__":
    scheduler()

