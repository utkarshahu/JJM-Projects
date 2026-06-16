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
    "Weekly_Progress_of_Namami_Gange_Projects?mode=U"
)

HTML_FILE = (
    "undertendering_projects.html"
)

CSV_FILE = (
    "undertendering_projects.csv"
)

USE_LOCAL_HTML = False
DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

MAIN_DB_NAME = os.getenv("MAIN_DB_NAME")
AUDIT_DB_NAME = os.getenv("AUDIT_DB_NAME")

USE_LOCAL_HTML = (
    os.getenv(
        "USE_LOCAL_HTML",
        "True"
    ).lower() == "true"
)

HTML_FILE = os.getenv(
    "HTML_FILE",
    "undertendering_projects.html"
)

CSV_FILE = os.getenv(
    "CSV_FILE",
    "undertendering_projects.csv")

def save_html():

    print("Downloading HTML...")

    response = requests.get(
        URL,
        headers={
            "User-Agent": "Mozilla/5.0"
        },
        timeout=60
    )

    response.raise_for_status()

    with open(
        HTML_FILE,
        "w",
        encoding="utf-8"
    ) as f:

        f.write(
            response.text
        )

    print(
        f"HTML Saved -> {HTML_FILE}"
    )
def get_html():

    if (
        USE_LOCAL_HTML
        and
        os.path.exists(
            HTML_FILE
        )
    ):

        print(
            "Using Local HTML"
        )

        with open(
            HTML_FILE,
            "r",
            encoding="utf-8"
        ) as f:

            return f.read()

    print(
        "Downloading HTML..."
    )

    response = requests.get(
        URL,
        headers={
            "User-Agent":
            "Mozilla/5.0"
        },
        timeout=60
    )

    response.raise_for_status()

    html = response.text

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

def create_csv():

    html = get_html()

    soup = BeautifulSoup(
        html,
        "html.parser"
    )

    div = soup.find(
        "div",
        id="DivUnderTrandingProject"
    )

    if not div:
        raise Exception(
            "DivUnderTrandingProject not found"
        )

    table = div.find("table")

    if not table:
        raise Exception(
            "Under Tendering table not found"
        )

    tbody = table.find(
        "tbody",
        class_="tbodymain"
    )

    rows = tbody.find_all(
        "tr",
        recursive=False
    )

    print(
        f"Total Rows Found: {len(rows)}"
    )

    with open(
        CSV_FILE,
        "w",
        newline="",
        encoding="utf-8-sig"
    ) as f:

        writer = csv.writer(f)

        writer.writerow([
            "Sr.No",
            "District",
            "Town",
            "Name of Sewerage Project",
            "Scheme Type",
            "Mode of Project",
            "Date of Sanction",
            "Sanction Cost",
            "Work Cost",
            "Centage",
            "O&M Cost",
            "No Of STP",
            "STP Capacity",
            "No Of Drains",
            "Date Of Updation",
            "Remark"
        ])

        count = 0

        for row in rows:

            cols = row.find_all(
                "td",
                recursive=False
            )

            if len(cols) < 16:
                continue

            remarks = []

            for li in cols[15].find_all("li"):

                text = li.get_text(
                    " ",
                    strip=True
                )

                if text:
                    remarks.append(text)

            remark = " | ".join(
                remarks
            )

            writer.writerow([

                cols[0].get_text(strip=True),

                cols[1].get_text(strip=True),

                cols[2].get_text(strip=True),

                cols[3].get_text(
                    " ",
                    strip=True
                ),

                cols[4].get_text(strip=True),

                cols[5].get_text(strip=True),

                cols[6].get_text(strip=True),

                cols[7].get_text(strip=True),

                cols[8].get_text(strip=True),

                cols[9].get_text(strip=True),

                cols[10].get_text(strip=True),

                cols[11].get_text(strip=True),

                cols[12].get_text(strip=True),

                cols[13].get_text(strip=True),

                cols[14].get_text(strip=True),

                remark
            ])

            count += 1

    print(
        f"CSV Saved -> {CSV_FILE}"
    )

    print(
        f"Total Projects -> {count}"
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
def parse_date(value):

    if not value:
        return None

    try:

        return datetime.strptime(
            value.strip(),
            "%d-%b-%Y"
        ).date()

    except:

        return None


def to_float(value):

    try:

        value = (
            str(value)
            .replace(",", "")
            .strip()
        )

        if value in (
            "",
            "-",
            "NA",
            "N/A"
        ):
            return None

        return float(value)

    except:

        return None


def to_int(value):

    try:

        return int(
            str(value)
            .replace(",", "")
            .strip()
        )

    except:

        return 0







def clear_current():

    print(
        "Clearing Current DB"
    )

    conn = get_current_connection()

    cur = conn.cursor()

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    cur.execute(
        "TRUNCATE undertendering_projects"
    )

    cur.execute(
        "TRUNCATE cities"
    )

    cur.execute(
        "TRUNCATE districts"
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

    conn = get_audit_connection()

    cur = conn.cursor()

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    cur.execute(
        "TRUNCATE audit_undertendering_projects"
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


def load_csv_to_current():

    print(
        "Loading CSV"
    )

    df = pd.read_csv(
        CSV_FILE
    )

    conn = get_current_connection()

    cur = conn.cursor()

    district_map = {}

    city_map = {}

    for _, row in df.iterrows():

        district = str(
            row["District"]
        ).strip()

        city = str(
            row["Town"]
        ).strip()

        # =====================
        # DISTRICT
        # =====================

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

            district_map[
                district
            ] = cur.lastrowid

        district_id = (
            district_map[
                district
            ]
        )

        # =====================
        # CITY
        # =====================

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

            city_map[
                city_key
            ] = cur.lastrowid

        city_id = city_map[
            city_key
        ]

        # =====================
        # PROJECT
        # =====================

        cur.execute(
            """
            INSERT INTO
            undertendering_projects
            (
                sr_no,

                district_id,
                city_id,

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

                update_date,

                remarks,

                scrape_time
            )
            VALUES
            (
                %s,%s,%s,%s,%s,%s,%s,
                %s,%s,%s,%s,
                %s,%s,%s,
                %s,%s,NOW()
            )
            """,
            (
                to_int(
                    row["Sr.No"]
                ),

                district_id,

                city_id,

                row[
                    "Name of Sewerage Project"
                ],

                row[
                    "Scheme Type"
                ],

                row[
                    "Mode of Project"
                ],

                parse_date(
                    row[
                        "Date of Sanction"
                    ]
                ),

                to_float(
                    row[
                        "Sanction Cost"
                    ]
                ),

                to_float(
                    row[
                        "Work Cost"
                    ]
                ),

                to_float(
                    row[
                        "Centage"
                    ]
                ),

                to_float(
                    row[
                        "O&M Cost"
                    ]
                ),

                to_int(
                    row[
                        "No Of STP"
                    ]
                ),

                to_float(
                    row[
                        "STP Capacity"
                    ]
                ),

                to_int(
                    row[
                        "No Of Drains"
                    ]
                ),

                parse_date(
                    row[
                        "Date Of Updation"
                    ]
                ),

                row[
                    "Remark"
                ]
            )
        )

    conn.commit()

    cur.close()

    conn.close()

    print(
        f"{len(df)} Projects Saved Successfully"
    )

def backup_current_to_audit():

    print(
        "Backing Up Current -> Audit"
    )

    current_conn = (
        get_current_connection()
    )

    audit_conn = (
        get_audit_connection()
    )

    current_cur = (
        current_conn.cursor(
            dictionary=True
        )
    )

    audit_cur = (
        audit_conn.cursor()
    )

    # =====================
    # CLEAR OLD AUDIT
    # =====================

    audit_cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    audit_cur.execute(
        """
        TRUNCATE
        audit_undertendering_projects
        """
    )

    audit_cur.execute(
        """
        TRUNCATE
        audit_cities
        """
    )

    audit_cur.execute(
        """
        TRUNCATE
        audit_districts
        """
    )

    audit_cur.execute(
        "SET FOREIGN_KEY_CHECKS=1"
    )

    # =====================
    # DISTRICTS
    # =====================

    current_cur.execute(
        """
        SELECT *
        FROM districts
        """
    )

    districts = (
        current_cur.fetchall()
    )

    district_map = {}

    for d in districts:

        audit_cur.execute(
            """
            INSERT INTO
            audit_districts
            (
                district_name
            )
            VALUES
            (%s)
            """,
            (
                d[
                    "district_name"
                ],
            )
        )

        district_map[
            d["district_id"]
        ] = (
            audit_cur.lastrowid
        )

    # =====================
    # CITIES
    # =====================

    current_cur.execute(
        """
        SELECT *
        FROM cities
        """
    )

    cities = (
        current_cur.fetchall()
    )

    city_map = {}

    for c in cities:

        audit_cur.execute(
            """
            INSERT INTO
            audit_cities
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
                    c[
                        "district_id"
                    ]
                ],

                c[
                    "city_name"
                ]
            )
        )

        city_map[
            c["city_id"]
        ] = (
            audit_cur.lastrowid
        )

    # =====================
    # PROJECTS
    # =====================

    current_cur.execute(
        """
        SELECT *
        FROM undertendering_projects
        """
    )

    projects = (
        current_cur.fetchall()
    )

    for p in projects:

        audit_cur.execute(
            """
            INSERT INTO
            audit_undertendering_projects
            (
                sr_no,

                audit_district_id,
                audit_city_id,

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

                update_date,

                remarks,

                snapshot_time
            )
            VALUES
            (
                %s,%s,%s,%s,%s,%s,%s,
                %s,%s,%s,%s,
                %s,%s,%s,
                %s,%s,NOW()
            )
            """,
            (
                p["sr_no"],

                district_map[
                    p["district_id"]
                ],

                city_map[
                    p["city_id"]
                ],

                p["project_name"],

                p["scheme_type"],

                p["project_mode"],

                p["sanction_date"],

                p["sanction_cost"],

                p["work_cost"],

                p["centage"],

                p["om_cost"],

                p["stp_count"],

                p["stp_capacity"],

                p["drain_count"],

                p["update_date"],

                p["remarks"]
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

            create_csv()

            backup_current_to_audit()

            clear_current()

            load_csv_to_current()

            print(
                "Cycle Completed"
            )

        except Exception as e:

            print(
                "ERROR:",
                e
            )

        time.sleep(20)

def manual_refresh():

    try:

        print(
            "\n===== MANUAL REFRESH ====="
        )

        create_csv()

        backup_current_to_audit()

        clear_current()

        load_csv_to_current()

        print(
            "Manual Refresh Completed"
        )

        return True

    except Exception as e:

        print(
            "ERROR :",
            e
        )

        return False

def first_run():

    print(
        "Initial Data Load"
    )


    create_csv()

    clear_current()

    load_csv_to_current()
if __name__ == "__main__":

    print(
        "=" * 60
    )

    print(
        "UNDER TENDERING PROJECT SCRAPER"
    )

    print(
        "=" * 60
    )

    first_run()

    scheduler()


