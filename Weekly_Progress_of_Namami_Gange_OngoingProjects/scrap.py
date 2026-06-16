import requests
from bs4 import BeautifulSoup
import os
import mysql.connector
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()
URL = "https://jjm.up.gov.in/NamamiGange/Weekly_Progress_of_Namami_Gange_OngoingProjects?mode=O"

DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

MAIN_DB_NAME = os.getenv("MAIN_DB_NAME")
AUDIT_DB_NAME = os.getenv("AUDIT_DB_NAME")

USE_LOCAL_HTML = (
    os.getenv("USE_LOCAL_HTML", "True")
    .lower() == "true"
)

HTML_FILE = os.getenv(
    "HTML_FILE",
    "ongoing_projects.html"
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

def parse_date(date_str):

    if not date_str:
        return None

    try:
        return datetime.strptime(
            date_str.strip(),
            "%d-%b-%Y"
        ).date()

    except:
        return None
def to_float(value):

    if value is None:
        return None

    try:
        value = (
            str(value)
            .replace(",", "")
            .replace("%", "")
            .replace("₹", "")
            .strip()
        )

        if value in ("", "-", "NA", "N/A"):
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
def save_to_mysql(projects):
    conn = get_current_connection()

    cur = conn.cursor()

    try:
        for project in projects:

            # =====================
            # DISTRICT
            # =====================

            district = project["district"]

            cur.execute(
                """
                INSERT
                IGNORE INTO districts
                (
                    district_name
                )
                VALUES
                (
                %s
                )
                """,
                (district,)
            )

            cur.execute(
                """
                SELECT district_id
                FROM districts
                WHERE district_name = %s
                """,
                (district,)
            )

            district_id = cur.fetchone()[0]

            # =====================
            # CITY
            # =====================

            city = project["city"]

            city_id = None

            if city:
                cur.execute(
                    """
                    INSERT
                    IGNORE INTO cities
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

                cur.execute(
                    """
                    SELECT city_id
                    FROM cities
                    WHERE district_id = %s
                      AND city_name = %s
                    """,
                    (
                        district_id,
                        city
                    )
                )

                city_id = cur.fetchone()[0]

            # =====================
            # AGENCY
            # =====================

            agency = project["agency_name"]

            agency_id = None

            if agency:
                cur.execute(
                    """
                    INSERT
                    IGNORE INTO agencies
                    (
                        agency_name
                    )
                    VALUES
                    (
                    %s
                    )
                    """,
                    (agency,)
                )

                cur.execute(
                    """
                    SELECT agency_id
                    FROM agencies
                    WHERE agency_name = %s
                    """,
                    (agency,)
                )

                agency_id = cur.fetchone()[0]

            # =====================
            # PROJECT
            # =====================

            cur.execute(
                """
                INSERT INTO sewerage_projects
                (sr_no,
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
                 start_date,
                 agreement_completion_date,
                 revised_date,
                 physical_progress,
                 financial_progress,
                 update_date,
                 remarks,
                 reason_for_delay,
                 action_taken,
                 tentative_inauguration_date,
                 tentative_zero_discharge_date,
                 scrape_time)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                        %s, %s, %s, %s, %s, %s, %s,%s)
                """,
                (
                    project["sr_no"],
                    district_id,
                    city_id,
                    agency_id,
                    project["project_name"],
                    project["scheme_type"],
                    project["project_mode"],
                    parse_date(project["sanction_date"]),
                    to_float(project["sanction_cost"]),
                    to_float(project["work_cost"]),
                    to_float(project["centage"]),
                    to_float(project["om_cost"]),
                    to_int(project["stp_count"]),
                    to_float(project["stp_capacity"]),
                    to_int(project["drain_count"]),
                    to_float(project["agreement_cost"]),
                    parse_date(project["start_date"]),
                    parse_date(
                        project["agreement_completion_date"]
                    ),
                    project["revised_date"],
                    project["physical_progress"],
                    project["financial_progress"],
                    parse_date(project["update_date"]),
                    project["remarks"],
                    project["reason_for_delay"],
                    project["action_taken"],
                    parse_date(
                        project["tentative_inauguration_date"]
                    ),
                    parse_date(
                        project["tentative_zero_discharge_date"]
                    ),
                    datetime.now()
                )
            )

            project_id = cur.lastrowid

            # =====================
            # COMPONENTS
            # =====================

            for component in project["components"]:
                cur.execute(
                    """
                    INSERT INTO project_components
                    (project_id,
                     work_component,
                     component_count,
                     capacity_length_no,
                     physical_progress,
                     photos)
                    VALUES (%s, %s, %s, %s, %s, %s)
                    """,
                    (
                        project_id,
                        component["work_component"],
                        to_int(
                            component["component_count"]
                        ),
                        component["capacity_length_no"],
                        to_float(
                            component["physical_progress"]
                        ),
                        component["photos"]
                    )
                )

        conn.commit()
        cur.close()
        conn.close()
    except Exception as e:

        conn.rollback()
        raise e


    print(
        f"{len(projects)} Projects Saved Successfully"
    )

def backup_current_to_audit():

    print("Current -> Audit Sync")

    current_conn = get_current_connection()
    audit_conn = get_audit_connection()

    current_cur = current_conn.cursor(dictionary=True)
    audit_cur = audit_conn.cursor()

    try:

        audit_cur.execute("SET FOREIGN_KEY_CHECKS=0")

        audit_cur.execute("TRUNCATE audit_project_components")
        audit_cur.execute("TRUNCATE audit_sewerage_projects")
        audit_cur.execute("TRUNCATE audit_cities")
        audit_cur.execute("TRUNCATE audit_districts")
        audit_cur.execute("TRUNCATE audit_agencies")

        audit_cur.execute("SET FOREIGN_KEY_CHECKS=1")

        district_map = {}
        city_map = {}
        agency_map = {}
        project_map = {}

        # Districts
        current_cur.execute(
            "SELECT district_id,district_name FROM districts"
        )

        for row in current_cur.fetchall():

            audit_cur.execute(
                """
                INSERT INTO audit_districts
                (district_name)
                VALUES (%s)
                """,
                (row["district_name"],)
            )

            district_map[
                row["district_id"]
            ] = audit_cur.lastrowid

        # Cities
        current_cur.execute(
            """
            SELECT city_id,
                   district_id,
                   city_name
            FROM cities
            """
        )

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

        # Agencies
        current_cur.execute(
            """
            SELECT agency_id,
                   agency_name
            FROM agencies
            """
        )

        for row in current_cur.fetchall():

            audit_cur.execute(
                """
                INSERT INTO audit_agencies
                (
                    agency_name
                )
                VALUES
                (
                    %s
                )
                """,
                (
                    row["agency_name"],
                )
            )

            agency_map[
                row["agency_id"]
            ] = audit_cur.lastrowid

        # Projects
        current_cur.execute(
            "SELECT * FROM sewerage_projects"
        )

        for row in current_cur.fetchall():

            audit_cur.execute(
                """
                INSERT INTO audit_sewerage_projects
                (
                    sr_no,
                    audit_district_id,
                    audit_city_id,
                    audit_agency_id,
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
                    start_date,
                    agreement_completion_date,
                    revised_date,
                    physical_progress,
                    financial_progress,
                    update_date,
                    remarks,
                    reason_for_delay,
                    action_taken,
                    tentative_inauguration_date,
                    tentative_zero_discharge_date,
                    scrape_time
                )
                VALUES
                (
                    %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,
                    %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,
                    %s,%s,%s,%s,%s,%s,%s,%s
                )
                """,
                (
                    row["sr_no"],
                    district_map.get(
                        row["district_id"]
                    ),
                    city_map.get(
                        row["city_id"]
                    ),
                    agency_map.get(
                        row["agency_id"]
                    ),
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
                    row["start_date"],
                    row["agreement_completion_date"],
                    row["revised_date"],
                    row["physical_progress"],
                    row["financial_progress"],
                    row["update_date"],
                    row["remarks"],
                    row["reason_for_delay"],
                    row["action_taken"],
                    row["tentative_inauguration_date"],
                    row["tentative_zero_discharge_date"],
                    row["scrape_time"]
                )
            )

            project_map[
                row["project_id"]
            ] = audit_cur.lastrowid

        # Components
        current_cur.execute(
            """
            SELECT *
            FROM project_components
            """
        )

        for row in current_cur.fetchall():

            audit_cur.execute(
                """
                INSERT INTO audit_project_components
                (
                    audit_project_id,
                    work_component,
                    component_count,
                    capacity_length_no,
                    physical_progress,
                    photos
                )
                VALUES
                (
                    %s,%s,%s,%s,%s,%s
                )
                """,
                (
                    project_map[
                        row["project_id"]
                    ],
                    row["work_component"],
                    row["component_count"],
                    row["capacity_length_no"],
                    row["physical_progress"],
                    row["photos"]
                )
            )

        audit_conn.commit()

        print(
            "Audit Updated Successfully"
        )

    except Exception as e:

        audit_conn.rollback()
        raise e

    finally:

        current_cur.close()
        audit_cur.close()

        current_conn.close()
        audit_conn.close()
def clear_current():
    conn = get_current_connection()

    cur = conn.cursor()

    cur.execute("SET FOREIGN_KEY_CHECKS=0")

    cur.execute("TRUNCATE project_components")
    cur.execute("TRUNCATE sewerage_projects")
    cur.execute("TRUNCATE cities")
    cur.execute("TRUNCATE districts")
    cur.execute("TRUNCATE agencies")

    cur.execute("SET FOREIGN_KEY_CHECKS=1")

    conn.commit()

    cur.close()
    conn.close()

    print("Current DB Cleared")
def scrape_projects():

    # =========================
    # GET HTML
    # =========================

    if USE_LOCAL_HTML and os.path.exists(HTML_FILE):

        print("Using Local HTML")

        with open(
            HTML_FILE,
            "r",
            encoding="utf-8"
        ) as f:

            html = f.read()

    else:

        print("Downloading HTML...")

        response = requests.get(
            URL,
            headers={
                "User-Agent": "Mozilla/5.0"
            },
            timeout=60
        )

        response.raise_for_status()

        html = response.text

        # Save only once
        if not os.path.exists(HTML_FILE):

            with open(
                HTML_FILE,
                "w",
                encoding="utf-8"
            ) as f:

                f.write(html)

            print(
                f"HTML Saved -> {HTML_FILE}"
            )

    # =========================
    # PARSE HTML
    # =========================

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

    rows = table.select(
        "tbody tr"
    )

    print(
        f"Total Rows Found: {len(rows)}"
    )

    projects = []



    i = 0

    while i < len(rows):

        cols = rows[i].find_all("td")

        # Skip total row or invalid rows
        if len(cols) < 32:
            i += 1
            continue

        rowspan = int(
            cols[0].get("rowspan", 1)
        )

        project = {
            "sr_no": cols[0].get_text(strip=True),
            "district": cols[1].get_text(" ", strip=True),
            "city": cols[2].get_text(" ", strip=True),
            "project_name": cols[3].get_text(" ", strip=True),
            "scheme_type": cols[4].get_text(" ", strip=True),
            "project_mode": cols[5].get_text(" ", strip=True),

            "sanction_date": cols[6].get_text(" ", strip=True),
            "sanction_cost": cols[7].get_text(" ", strip=True),
            "work_cost": cols[8].get_text(" ", strip=True),
            "centage": cols[9].get_text(" ", strip=True),
            "om_cost": cols[10].get_text(" ", strip=True),

            "stp_count": cols[11].get_text(" ", strip=True),
            "stp_capacity": cols[12].get_text(" ", strip=True),
            "drain_count": cols[13].get_text(" ", strip=True),

            "agency_name": cols[14].get_text(" ", strip=True),

            "agreement_cost": cols[15].get_text(" ", strip=True),

            "start_date": cols[16].get_text(" ", strip=True),

            "agreement_completion_date":
                cols[17].get_text(" ", strip=True),

            "revised_date":
                cols[18].get_text(" ", strip=True),

            "physical_progress":
                cols[19].get_text(" ", strip=True),

            "financial_progress":
                cols[20].get_text(" ", strip=True),

            "update_date":
                cols[26].get_text(" ", strip=True),

            "remarks":
                cols[27].get_text(" ", strip=True),

            "reason_for_delay":
                cols[28].get_text(" ", strip=True),

            "action_taken":
                cols[29].get_text(" ", strip=True),

            "tentative_inauguration_date":
                cols[30].get_text(" ", strip=True),

            "tentative_zero_discharge_date":
                cols[31].get_text(" ", strip=True),

            "components": []
        }

        # First component row
        project["components"].append({
            "work_component":
                cols[21].get_text(" ", strip=True),

            "component_count":
                cols[22].get_text(" ", strip=True),

            "capacity_length_no":
                cols[23].get_text(" ", strip=True),

            "physical_progress":
                cols[24].get_text(" ", strip=True),

            "photos":
                cols[25].get_text(" ", strip=True)
        })

        # Remaining component rows
        for j in range(1, rowspan):

            if i + j >= len(rows):
                break

            sub_cols = rows[i + j].find_all("td")

            if len(sub_cols) < 5:
                continue

            project["components"].append({
                "work_component":
                    sub_cols[0].get_text(" ", strip=True),

                "component_count":
                    sub_cols[1].get_text(" ", strip=True),

                "capacity_length_no":
                    sub_cols[2].get_text(" ", strip=True),

                "physical_progress":
                    sub_cols[3].get_text(" ", strip=True),

                "photos":
                    sub_cols[4].get_text(" ", strip=True)
            })

        projects.append(project)

        i += rowspan

    return projects
def clear_audit():

    conn = get_audit_connection()

    cur = conn.cursor()

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=0"
    )

    cur.execute(
        "TRUNCATE audit_project_components"
    )

    cur.execute(
        "TRUNCATE audit_sewerage_projects"
    )

    cur.execute(
        "TRUNCATE audit_cities"
    )

    cur.execute(
        "TRUNCATE audit_districts"
    )

    cur.execute(
        "TRUNCATE audit_agencies"
    )

    cur.execute(
        "SET FOREIGN_KEY_CHECKS=1"
    )

    conn.commit()

    cur.close()

    conn.close()

    print("Audit Cleared")
import time
def scheduler():

    while True:

        try:

            data = scrape_projects()

            backup_current_to_audit()

            clear_current()

            save_to_mysql(data)

            print(
                f"Projects: {len(data)}"
            )

        except Exception as e:

            print(e)

        time.sleep(10)


if __name__ == "__main__":

    scheduler()