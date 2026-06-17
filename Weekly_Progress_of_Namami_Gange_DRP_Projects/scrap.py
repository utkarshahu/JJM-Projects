
import os
import csv
import time
import requests
import mysql.connector
import pandas as pd

from bs4 import BeautifulSoup
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()

URL = (
    "https://jjm.up.gov.in/NamamiGange/"
    "Weekly_Progress_of_Namami_Gange_Projects?mode=D"
)

HTML_FILE = "DRP_Projects.html"

CSV_FILE = "DRP_Projects.csv"

DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

MAIN_DB_NAME = os.getenv("MAIN_DB_NAME")
AUDIT_DB_NAME = os.getenv("AUDIT_DB_NAME")

USE_LOCAL_HTML = (
    os.getenv(
        "USE_LOCAL_HTML",
        "False"
    ).lower() == "true"
)


def get_current_connection():

    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=MAIN_DB_NAME
    )


def get_audit_connection():

    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=AUDIT_DB_NAME
    )




def get_html():

    if not os.path.exists(
        HTML_FILE
    ):

        raise Exception(
            f"{HTML_FILE} not found"
        )

    print(
        f"Reading {HTML_FILE}"
    )

    with open(
        HTML_FILE,
        "r",
        encoding="utf-8"
    ) as f:

        return f.read()



def create_csv():

    html = get_html()

    soup = BeautifulSoup(
        html,
        "html.parser"
    )

    dpr_div = soup.find(
        "div",
        id="DivDPRProject"
    )

    if not dpr_div:
        with open(
                "debug.html",
                "w",
                encoding="utf-8"
        ) as f:
            f.write(html)

        raise Exception(
            "DivDPRProject not found. debug.html created."
        )

    table = dpr_div.find(
        "table"
    )

    if not table:

        raise Exception(
            "DPR table not found"
        )

    tbody = table.find(
        "tbody",
        class_="tbodymain"
    )

    if not tbody:

        raise Exception(
            "tbodymain not found"
        )

    rows = tbody.find_all(
        "tr",
        recursive=False
    )

    print(
        f"DPR Rows Found : {len(rows)}"
    )

    with open(
        CSV_FILE,
        "w",
        newline="",
        encoding="utf-8-sig"
    ) as f:

        writer = csv.writer(f)

        writer.writerow([
            "Sr_No",
            "District",
            "Town",
            "Project_Name",
            "STP_Count",
            "STP_Capacity",
            "Drain_Count",
            "Update_Date",
            "Remarks"
        ])

        count = 0

        for row in rows:

            cols = row.find_all(
                "td",
                recursive=False
            )

            if len(cols) < 9:
                continue

            remarks = []

            for li in cols[8].find_all("li"):

                text = li.get_text(
                    " ",
                    strip=True
                )

                if text:

                    remarks.append(
                        text
                    )

            writer.writerow([

                cols[0].get_text(
                    strip=True
                ),

                cols[1].get_text(
                    strip=True
                ),

                cols[2].get_text(
                    strip=True
                ),

                cols[3].get_text(
                    " ",
                    strip=True
                ),

                cols[4].get_text(
                    strip=True
                ),

                cols[5].get_text(
                    strip=True
                ),

                cols[6].get_text(
                    strip=True
                ),

                cols[7].get_text(
                    strip=True
                ),

                " | ".join(
                    remarks
                )
            ])

            count += 1

    print(
        f"CSV Saved -> {CSV_FILE}"
    )

    print(
        f"Total DPR Projects -> {count}"
    )
def parse_date(value):

    if pd.isna(value):

        return None

    value = str(
        value
    ).strip()

    if not value:

        return None

    try:

        return datetime.strptime(
            value,
            "%d-%b-%Y"
        ).date()

    except:

        return None


def to_int(value):

    try:

        value = (
            str(value)
            .replace(",", "")
            .strip()
        )

        if value == "":
            return 0

        return int(
            float(value)
        )

    except:

        return 0


def to_float(value):

    try:

        value = (
            str(value)
            .replace(",", "")
            .strip()
        )

        if value == "":
            return 0.0

        return float(value)

    except:

        return 0.0


def clear_current():

    print(
        "\nClearing Current DB"
    )

    conn = get_current_connection()

    cur = conn.cursor()

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    cur.execute(
        "DELETE FROM DRP_Projects"
    )

    cur.execute(
        "DELETE FROM cities"
    )

    cur.execute(
        "DELETE FROM districts"
    )

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=1"
    )

    conn.commit()

    cur.close()
    conn.close()

    print(
        "Current DB Cleared"
    )


def clear_audit():

    print(
        "\nClearing Audit DB"
    )

    conn = get_audit_connection()

    cur = conn.cursor()

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    cur.execute(
        "TRUNCATE audit_DRP_Projects"
    )

    cur.execute(
        "TRUNCATE audit_cities"
    )

    cur.execute(
        "TRUNCATE audit_districts"
    )

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=1"
    )

    conn.commit()

    cur.close()
    conn.close()

    print(
        "Audit DB Cleared"
    )

def load_csv_to_current():

    print(
        "\nLoading CSV"
    )

    df = pd.read_csv(
        CSV_FILE
    )

    conn = get_current_connection()

    cur = conn.cursor()

    district_map = {}

    city_map = {}

    total = len(df)

    for _, row in df.iterrows():

        district = str(
            row["District"]
        ).strip()

        city = str(
            row["Town"]
        ).strip()

        # =========================
        # DISTRICT
        # =========================

        if district not in district_map:

            cur.execute(
                """
                INSERT IGNORE INTO districts
                (
                    district_name
                )
                VALUES (%s)
                """,
                (district,)
            )

            cur.execute(
                """
                SELECT district_id
                FROM districts
                WHERE district_name=%s
                """,
                (district,)
            )

            district_map[
                district
            ] = cur.fetchone()[0]

        district_id = district_map[
            district
        ]

        # =========================
        # CITY
        # =========================

        city_key = (
            district,
            city
        )

        if city_key not in city_map:

            cur.execute(
                """
                SELECT city_id
                FROM cities
                WHERE district_id=%s
                AND city_name=%s
                """,
                (
                    district_id,
                    city
                )
            )

            result = cur.fetchone()

            if result:

                city_id = result[0]

            else:

                cur.execute(
                    """
                    INSERT INTO cities
                    (
                        district_id,
                        city_name
                    )
                    VALUES
                    (
                        %s,
                        %s
                    )
                    """,
                    (
                        district_id,
                        city
                    )
                )

                city_id = (
                    cur.lastrowid
                )

            city_map[
                city_key
            ] = city_id

        city_id = city_map[
            city_key
        ]

        # =========================
        # PROJECT
        # =========================

        cur.execute(
            """
            INSERT INTO DRP_Projects
            (
                sr_no,

                district_id,
                city_id,

                project_name,

                stp_count,
                stp_capacity,
                drain_count,

                update_date,

                remarks,

                scrape_time
            )
            VALUES
            (
                %s,%s,%s,%s,
                %s,%s,%s,
                %s,%s,NOW()
            )
            """,
            (
                to_int(
                    row["Sr_No"]
                ),

                district_id,

                city_id,

                str(
                    row["Project_Name"]
                ).strip(),

                to_int(
                    row["STP_Count"]
                ),

                to_float(
                    row["STP_Capacity"]
                ),

                to_int(
                    row["Drain_Count"]
                ),

                parse_date(
                    row["Update_Date"]
                ),

                str(
                    row["Remarks"]
                ).strip()
            )
        )

    conn.commit()

    cur.close()

    conn.close()

    print(
        f"{total} DPR Projects Saved"
    )
def backup_current_to_audit():

    print(
        "\nBacking Up Current -> Audit"
    )

    current_conn = (
        get_current_connection()
    )

    audit_conn = (
        get_audit_connection()
    )

    current_cur = current_conn.cursor(
        dictionary=True
    )

    audit_cur = audit_conn.cursor()

    audit_cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    audit_cur.execute(
        "TRUNCATE audit_DRP_Projects"
    )

    audit_cur.execute(
        "TRUNCATE audit_cities"
    )

    audit_cur.execute(
        "TRUNCATE audit_districts"
    )

    audit_cur.execute(
        "SET FOREIGN_KEY_CHECKS=1"
    )

    audit_conn.commit()

    # =========================
    # DISTRICTS
    # =========================

    current_cur.execute(
        """
        SELECT *
        FROM districts
        """
    )

    district_map = {}

    for row in current_cur.fetchall():

        audit_cur.execute(
            """
            INSERT INTO audit_districts
            (
                district_name
            )
            VALUES (%s)
            """,
            (
                row["district_name"],
            )
        )

        district_map[
            row["district_id"]
        ] = audit_cur.lastrowid

    # =========================
    # CITIES
    # =========================

    current_cur.execute(
        """
        SELECT *
        FROM cities
        """
    )

    city_map = {}

    for row in current_cur.fetchall():

        audit_cur.execute(
            """
            INSERT INTO audit_cities
            (
                audit_district_id,
                city_name
            )
            VALUES
            (
                %s,
                %s
            )
            """,
            (
                district_map[
                    row["district_id"]
                ],
                row["city_name"]
            )
        )

        city_map[
            row["city_id"]
        ] = audit_cur.lastrowid

    # =========================
    # PROJECTS
    # =========================

    current_cur.execute(
        """
        SELECT *
        FROM DRP_Projects
        """
    )

    projects = current_cur.fetchall()
    print(
        "Districts:",
        len(district_map)
    )

    print(
        "Cities:",
        len(city_map)
    )

    print(
        "Projects:",
        len(projects)
    )
    print(
        f"Projects Going To Audit : {len(projects)}"
    )

    for row in projects:
        audit_cur.execute(
            """
            INSERT INTO
            audit_DRP_Projects
            (
                sr_no,

                audit_district_id,
                audit_city_id,

                project_name,

                stp_count,
                stp_capacity,
                drain_count,

                update_date,

                remarks,

                snapshot_time
            )
            VALUES
            (
                %s,%s,%s,%s,
                %s,%s,%s,
                %s,%s,%s
            )
            """,
            (
                row["sr_no"],

                district_map[
                    row["district_id"]
                ],

                city_map[
                    row["city_id"]
                ],

                row["project_name"],

                row["stp_count"],

                row["stp_capacity"],

                row["drain_count"],

                row["update_date"],

                row["remarks"],

                row["scrape_time"]
            )
        )

    audit_conn.commit()

    current_cur.close()
    audit_cur.close()

    current_conn.close()
    audit_conn.close()

    print(
        "Audit Updated Successfully"
    )



def scheduler():

    while True:

        try:

            print("\n" + "=" * 60)
            print("NEW CYCLE")
            print("=" * 60)

            create_csv()

            backup_current_to_audit()

            clear_current()

            load_csv_to_current()

            print(
                "Cycle Completed"
            )

        except Exception as e:

            print(
                "Scheduler Error:",
                e
            )

        time.sleep(10)


def first_run():

    print(
        "\nInitial Load"
    )

    create_csv()

    clear_current()

    load_csv_to_current()

    print(
        "\nInitial Load Complete"
    )
if __name__ == "__main__":

    print("=" * 60)
    print("DRP PROJECT SCRAPER")
    print("=" * 60)

    first_run()

    scheduler()