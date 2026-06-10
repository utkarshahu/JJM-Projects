# %%
import os
import time
import requests
from datetime import datetime
from bs4 import BeautifulSoup
import mysql.connector
import json
from dotenv import load_dotenv

load_dotenv()

USE_ONLINE_SOURCE = False
LOCAL_HTML_FILE = "jjm_citywise_discharge_stp_capacity_gap_analysis.html"
JSON_FILE = "drains_stp_hierarchical.json"
# Data Sanitization Layer
def clean(value):
    return None if value in ("", None, "--", "N/A") else value

def save_json_snapshot(data):

    with open(
        JSON_FILE,
        "w",
        encoding="utf-8"
    ) as f:

        json.dump(
            data,
            f,
            indent=4,
            ensure_ascii=False
        )

    print(
        f"JSON Updated -> {JSON_FILE}"
    )

def load_json_snapshot():
    if not os.path.exists(JSON_FILE):
        print("JSON File Not Found")

        return None

    with open(
            JSON_FILE,
            "r",
            encoding="utf-8"
    ) as f:
        return json.load(f)

def generate_json():
    data = get_data_source(
        from_online=USE_ONLINE_SOURCE,
        local_file_path=LOCAL_HTML_FILE
    )

    if not data:
        print("No Data Found")

        return False

    save_json_snapshot(data)

    return True
# =========================================================================
# 1. FIXED CORE DATA EXTRACTION FUNCTION
# =========================================================================
def get_data_source(from_online=False, local_file_path="jjm_citywise_discharge_stp_capacity_gap_analysis.html"):
    url = "https://jjm.up.gov.in/NamamiGange/Drains_STPs_Comparison"
    headers = {"User-Agent": "Mozilla/5.0"}

    if from_online:
        try:
            response = requests.get(url, headers=headers, timeout=30)
            response.raise_for_status()
            html_content = response.text
        except Exception as e:
            print(f"CRITICAL ERROR: Online connection failed: {e}")
            return None
    else:
        if not os.path.exists(local_file_path):
            print(f"CRITICAL ERROR: '{local_file_path}' Not Found.")
            return None
        with open(local_file_path, "r", encoding="utf-8") as f:
            html_content = f.read()

    soup = BeautifulSoup(html_content, "lxml")
    table = soup.find("table", id="tableReportTable")
    if not table: return None

    rows = table.find_all("tr")
    data = {}
    current_district = None
    current_town = None

    for row in rows[3:]:
        cols = row.find_all("td")
        values = [td.get_text(" ", strip=True) for td in cols]
        if not values: continue

        # 34 Columns Parsing
        if len(values) == 34:
            current_district = values[1]
            current_town = values[2]
            district, town, river = current_district, current_town, values[3]
            population_statistics = {
                "present_population_2024": values[4], "sewage_generation_2024": values[5],
                "sewer_network_length_km": values[11], "households": values[12],
                "connected_households": values[13], "projected_population_2037": values[30],
                "sewage_generation_2037": values[31], "sewage_gap_2037": values[32]
            }
            river_stats = {
                "tapped_partial_untapped_drains": values[6], "not_to_be_tapped_drains": values[7],
                "total_drains": values[8], "discharge_through_drains": values[9],
                "discharge_through_sewer_network": values[10], "total_discharge": values[14],
                "existing_stp_count": values[15], "existing_stp_capacity": values[16],
                "utilized_stp_capacity": values[17], "gap_installed_vs_population": values[18],
                "gap_utilized_vs_population": values[19], "gap_installed_vs_actual": values[20],
                "gap_utilized_vs_actual": values[21], "stp_under_construction_count": values[22],
                "stp_under_construction_capacity": values[23], "stp_under_tender_count": values[24],
                "stp_under_tender_capacity": values[25], "proposed_capacity": values[26],
                "total_capacity": values[27], "sewage_gap": values[28], "population_gap": values[29],
                "remark": values[33]
            }
        # 32 Columns Parsing
        elif len(values) == 32:
            district = current_district
            current_town = values[0]
            town, river = current_town, values[1]
            population_statistics = {
                "present_population_2024": values[2], "sewage_generation_2024": values[3],
                "sewer_network_length_km": values[9], "households": values[10],
                "connected_households": values[11], "projected_population_2037": values[28],
                "sewage_generation_2037": values[29], "sewage_gap_2037": values[30]
            }
            river_stats = {
                "tapped_partial_untapped_drains": values[4], "not_to_be_tapped_drains": values[5],
                "total_drains": values[6], "discharge_through_drains": values[7],
                "discharge_through_sewer_network": values[8], "total_discharge": values[12],
                "existing_stp_count": values[13], "existing_stp_capacity": values[14],
                "utilized_stp_capacity": values[15], "gap_installed_vs_population": values[16],
                "gap_utilized_vs_population": values[17], "gap_installed_vs_actual": values[18],
                "gap_utilized_vs_actual": values[19], "stp_under_construction_count": values[20],
                "stp_under_construction_capacity": values[21], "stp_under_tender_count": values[22],
                "stp_under_tender_capacity": values[23], "proposed_capacity": values[24],
                "total_capacity": values[25], "sewage_gap": values[26], "population_gap": values[27],
                "remark": values[31]
            }
        # 23 Columns Parsing (Only River / Drain Logs)
        elif len(values) == 23:
            district, town, river = current_district, current_town, values[0]
            population_statistics = {}
            river_stats = {
                "tapped_partial_untapped_drains": values[1], "not_to_be_tapped_drains": values[2],
                "total_drains": values[3], "discharge_through_drains": values[4],
                "discharge_through_sewer_network": values[5], "total_discharge": values[6],
                "existing_stp_count": values[7], "existing_stp_capacity": values[8],
                "utilized_stp_capacity": values[9], "gap_installed_vs_population": values[10],
                "gap_utilized_vs_population": values[11], "gap_installed_vs_actual": values[12],
                "gap_utilized_vs_actual": values[13], "stp_under_construction_count": values[14],
                "stp_under_construction_capacity": values[15], "stp_under_tender_count": values[16],
                "stp_under_tender_capacity": values[17], "proposed_capacity": values[18],
                "total_capacity": values[19], "sewage_gap": values[20], "population_gap": values[21],
                "remark": values[22]
            }
        else:
            continue

        if district not in data:
            data[district] = {"district": district, "towns": {}}

        if town not in data[district]["towns"]:
            data[district]["towns"][town] = {"town_city": town, "population_statistics": population_statistics,
                                             "rivers": []}

        # Avoid duplicate rivers entries
        town_rivers_list = data[district]["towns"][town]["rivers"]
        if not any(r["river_name"] == river for r in town_rivers_list):
            town_rivers_list.append({"river_name": river, "drainage_stp_statistics": river_stats})

    # Clean Dictionary Conversion for iteration safety
    final_list = []
    for d_name, d_content in data.items():
        d_content["towns"] = list(d_content["towns"].values())
        final_list.append(d_content)

    return final_list

def execute_database_migration(from_online=False):
    data = load_json_snapshot()

    if not data:
        print("JSON Empty")

        return
# =========================================================================
# 2. FIXED RELATIONAL AUDIT & MIRROR ENGINE
# =========================================================================
def execute_database_migration(from_online=False):
    data = get_data_source(from_online=from_online)
    if not data:
        print("Ingestion Pipeline Aborted: Failed to fetch valid data source.")
        return

    MAIN_DB = os.getenv("MAIN_DB_NAME")
    AUDIT_DB = f"{MAIN_DB}_audit"

    conn = mysql.connector.connect(
        host=os.getenv("DB_HOST"), user=os.getenv("DB_USER"), password=os.getenv("DB_PASSWORD"), database=MAIN_DB
    )
    cursor = conn.cursor()
    scrape_time = datetime.now()

    # ==========================================
    # SINGLE SNAPSHOT AUDIT LOGIC
    # ==========================================

    cursor.execute(f"""
    SELECT COUNT(*)
    FROM `{MAIN_DB}`.districts
    """)

    main_count = cursor.fetchone()[0]

    if main_count > 0:

        print("Replacing Audit Snapshot...")

        cursor.execute("SET FOREIGN_KEY_CHECKS=0")

        cursor.execute(f"TRUNCATE TABLE `{AUDIT_DB}`.drainage_stp_statistics")
        cursor.execute(f"TRUNCATE TABLE `{AUDIT_DB}`.population_statistics")
        cursor.execute(f"TRUNCATE TABLE `{AUDIT_DB}`.town_rivers")
        cursor.execute(f"TRUNCATE TABLE `{AUDIT_DB}`.rivers")
        cursor.execute(f"TRUNCATE TABLE `{AUDIT_DB}`.towns_cities")
        cursor.execute(f"TRUNCATE TABLE `{AUDIT_DB}`.districts")

        cursor.execute("SET FOREIGN_KEY_CHECKS=1")

        cursor.execute(f"""
        INSERT INTO `{AUDIT_DB}`.districts
        SELECT *
        FROM `{MAIN_DB}`.districts
        """)

        cursor.execute(f"""
        INSERT INTO `{AUDIT_DB}`.towns_cities
        SELECT *
        FROM `{MAIN_DB}`.towns_cities
        """)

        cursor.execute(f"""
        INSERT INTO `{AUDIT_DB}`.rivers
        SELECT *
        FROM `{MAIN_DB}`.rivers
        """)

        cursor.execute(f"""
        INSERT INTO `{AUDIT_DB}`.town_rivers
        SELECT *
        FROM `{MAIN_DB}`.town_rivers
        """)

        cursor.execute(f"""
        INSERT INTO `{AUDIT_DB}`.population_statistics
        SELECT *
        FROM `{MAIN_DB}`.population_statistics
        """)

        cursor.execute(f"""
        INSERT INTO `{AUDIT_DB}`.drainage_stp_statistics
        SELECT *
        FROM `{MAIN_DB}`.drainage_stp_statistics
        """)

        conn.commit()

    else:

        print("First Cycle Detected - Audit Snapshot Skip")

    # -------------------------------------------------------------------------
    # PART B: WIPING PRODUCTION DATA (TRUNCATE IN SAFE REVERSE ORDER)
    # -------------------------------------------------------------------------
    print("Flushing production tables to mirror the active web state...")
    cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")
    cursor.execute(f"TRUNCATE TABLE `{MAIN_DB}`.drainage_stp_statistics;")
    cursor.execute(f"TRUNCATE TABLE `{MAIN_DB}`.population_statistics;")
    cursor.execute(f"TRUNCATE TABLE `{MAIN_DB}`.town_rivers;")
    cursor.execute(f"TRUNCATE TABLE `{MAIN_DB}`.rivers;")
    cursor.execute(f"TRUNCATE TABLE `{MAIN_DB}`.towns_cities;")
    cursor.execute(f"TRUNCATE TABLE `{MAIN_DB}`.districts;")
    cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")
    conn.commit()

    # -------------------------------------------------------------------------
    # PART C: FRESH LIVE INGESTION
    # -------------------------------------------------------------------------
    print("Writing fresh clean layout into Main DB...")
    for district_data in data:
        district_name = district_data["district"]
        cursor.execute(f"INSERT INTO `{MAIN_DB}`.districts (district_name) VALUES (%s)", (district_name,))
        district_id = cursor.lastrowid

        for town_data in district_data["towns"]:
            town_name = town_data["town_city"]
            cursor.execute(f"INSERT INTO `{MAIN_DB}`.towns_cities (district_id, town_city_name) VALUES (%s, %s)",
                           (district_id, town_name))
            town_city_id = cursor.lastrowid

            pop = town_data.get("population_statistics", {})
            if pop:  # Check if population metrics exist
                cursor.execute(f"""
                    INSERT INTO `{MAIN_DB}`.population_statistics
                    (town_city_id, present_population_2024, present_population_based_sewage_generation_2024,
                     length_of_sewerage_network_km, no_of_house_holds, no_of_hh_connected_to_sewerage_network,
                     projected_population_2037, population_based_sewage_generation_2037, sewage_gap_based_on_projected_population_2037, scrape_time)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """, (town_city_id, clean(pop.get("present_population_2024")), clean(pop.get("sewage_generation_2024")),
                      clean(pop.get("sewer_network_length_km")), clean(pop.get("households")),
                      clean(pop.get("connected_households")),
                      clean(pop.get("projected_population_2037")), clean(pop.get("sewage_generation_2037")),
                      clean(pop.get("sewage_gap_2037")), scrape_time))

            for river_data in town_data.get("rivers", []):
                river_name = river_data["river_name"]
                cursor.execute(
                    f"INSERT INTO `{MAIN_DB}`.rivers (river_name) VALUES (%s) ON DUPLICATE KEY UPDATE river_id = LAST_INSERT_ID(river_id)",
                    (river_name,))
                river_id = cursor.lastrowid

                cursor.execute(
                    f"INSERT INTO `{MAIN_DB}`.town_rivers (town_city_id, river_id) VALUES (%s, %s) ON DUPLICATE KEY UPDATE town_river_id = LAST_INSERT_ID(town_river_id)",
                    (town_city_id, river_id))
                town_river_id = cursor.lastrowid

                stats = river_data.get("drainage_stp_statistics", {})
                cursor.execute(f"""
                    INSERT INTO `{MAIN_DB}`.drainage_stp_statistics
                    (town_river_id, tapped_partial_untapped_drains, not_to_be_tapped_drains, total_drains, discharge_through_drains_mld,
                     discharge_through_sewer_network_mld, total_discharge_mld, no_of_existing_stp, capacity_of_existing_stp, utilization_capacity_of_existing_stp,
                     gap_installed_capacity_population_flow, gap_utilization_capacity_population_flow, gap_installed_capacity_actual_discharge, gap_utilization_capacity_actual_discharge,
                     no_of_stp_under_construction, capacity_of_stp_under_construction, no_of_stp_under_tendering, capacity_of_stp_under_tendering,
                     capacity_proposed, total_capacity_mld, sewage_gap_mld, gap_based_on_population_mld, remark, scrape_time)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """, (town_river_id, clean(stats.get("tapped_partial_untapped_drains")),
                      clean(stats.get("not_to_be_tapped_drains")), clean(stats.get("total_drains")),
                      clean(stats.get("discharge_through_drains")), clean(stats.get("discharge_through_sewer_network")),
                      clean(stats.get("total_discharge")),
                      clean(stats.get("existing_stp_count")), clean(stats.get("existing_stp_capacity")),
                      clean(stats.get("utilized_stp_capacity")),
                      clean(stats.get("gap_installed_vs_population")), clean(stats.get("gap_utilized_vs_population")),
                      clean(stats.get("gap_installed_vs_actual")),
                      clean(stats.get("gap_utilized_vs_actual")), clean(stats.get("stp_under_construction_count")),
                      clean(stats.get("stp_under_construction_capacity")),
                      clean(stats.get("stp_under_tender_count")), clean(stats.get("stp_under_tender_capacity")),
                      clean(stats.get("proposed_capacity")),
                      clean(stats.get("total_capacity")), clean(stats.get("sewage_gap")),
                      clean(stats.get("population_gap")), clean(stats.get("remark")), scrape_time))

    conn.commit()



    cursor.execute(f"SELECT COUNT(*) FROM `{MAIN_DB}`.districts")
    print("Sync Done! Main DB District Count =", cursor.fetchone()[0])
    cursor.close()
    conn.close()


def scheduler():

    while True:

        try:

            print(
                "\n===== STEP 1 : HTML/WEB -> JSON ====="
            )

            generate_json()

            print(
                "\n===== STEP 2 : JSON -> MYSQL ====="
            )

            execute_database_migration()

        except Exception as e:

            print(
                f"CRITICAL CODE EXCEPTION: {e}"
            )

        print(
            "Waiting 10 seconds..."
        )

        time.sleep(10)


if __name__ == "__main__":
    scheduler()