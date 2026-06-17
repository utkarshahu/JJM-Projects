import time
import pandas as pd
import mysql.connector
from dotenv import load_dotenv
import os
from datetime import datetime



load_dotenv()

conn = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    autocommit=False
)

cursor = conn.cursor()


# =====================================
# HTML -> CSV
# =====================================

def generate_csv_from_html():

    from bs4 import BeautifulSoup
    import pandas as pd
    import requests

    # =====================================
    # TRUE  = Real Website
    # FALSE = Local Testing HTML
    # =====================================

    USE_REAL_WEBSITE = False

    if USE_REAL_WEBSITE:

        print("Reading from LIVE Website...")

        url = "https://jjm.up.gov.in/NamamiGange/DistrictwiseDrainsStatus"

        headers = {
            "User-Agent": "Mozilla/5.0"
        }

        response = requests.get(
            url,
            headers=headers,
            timeout=30
        )

        soup = BeautifulSoup(
            response.text,
            "lxml"
        )

    else:

        print("Reading from LOCAL HTML...")

        with open(
            "jjm_page.html",
            "r",
            encoding="utf-8"
        ) as f:

            html = f.read()

        soup = BeautifulSoup(
            html,
            "lxml"
        )

    table = soup.find(
        "table",
        id="tableReportTable"
    )

    rows = table.find_all("tr")

    data = []

    current_srno = ""
    current_district = ""

    for row in rows:

        cols = row.find_all("td")

        if not cols:
            continue

        values = [
            c.get_text(strip=True)
            for c in cols
        ]

        if not values:
            continue

        if values[0].lower() == "total":
            continue

        if len(values) == 13:

            current_srno = values[0]
            current_district = values[1]

            data.append({
                "SrNo": values[0],
                "District": values[1],
                "River": values[2],
                "TotalDrains": values[3],
                "TotalDischargeMLD": values[4],
                "TappedDrains": values[5],
                "TappedDischargeMLD": values[6],
                "UntappedDrains": values[7],
                "UntappedDischargeMLD": values[8],
                "PartialTappedDrains": values[9],
                "PartialTappedDischargeMLD": values[10],
                "NotToBeTappedDrains": values[11],
                "NotToBeTappedDischargeMLD": values[12]
            })

        elif len(values) == 11:

            data.append({
                "SrNo": current_srno,
                "District": current_district,
                "River": values[0],
                "TotalDrains": values[1],
                "TotalDischargeMLD": values[2],
                "TappedDrains": values[3],
                "TappedDischargeMLD": values[4],
                "UntappedDrains": values[5],
                "UntappedDischargeMLD": values[6],
                "PartialTappedDrains": values[7],
                "PartialTappedDischargeMLD": values[8],
                "NotToBeTappedDrains": values[9],
                "NotToBeTappedDischargeMLD": values[10]
            })

    df = pd.DataFrame(data)

    df.to_csv(
        "district_wise_drains.csv",
        index=False
    )

    print("CSV Regenerated")
    print("Rows =", len(df))
    print("First District =", df.iloc[0]["District"])

def clear_current():

    cursor.execute("SET FOREIGN_KEY_CHECKS=0")

    cursor.execute("TRUNCATE TABLE district_wise_drains.not_to_be_tapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains.partial_tapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains.untapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains.tapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains.drain_master")
    cursor.execute("TRUNCATE TABLE district_wise_drains.rivers")
    cursor.execute("TRUNCATE TABLE district_wise_drains.districts")

    cursor.execute("SET FOREIGN_KEY_CHECKS=1")
    cursor.execute("""
                   SELECT COUNT(*)
                   FROM district_wise_drains.partial_tapped_drains
                   """)

    print(
        "PARTIAL COUNT AFTER CLEAR =",
        cursor.fetchone()[0]
    )
    conn.commit()  # <-- ADD THIS
    print("Current DB Cleared")

def load_csv():
    cursor.execute("USE district_wise_drains")
    scrape_time = datetime.now()
    df = pd.read_csv("district_wise_drains.csv")

    df = df.fillna("")

    df["District"] = df["District"].astype(str).str.strip()
    df["River"] = df["River"].astype(str).str.strip()

    df = df[
        (df["District"] != "")
        &
        (df["River"] != "")
    ]

    district_map = {}

    for _, row in df.iterrows():

        district = row["District"]
        river = row["River"]

        if district not in district_map:

            cursor.execute("""
                INSERT INTO district_wise_drains.districts
                (district_name)
                VALUES (%s)
            """, (district,))


            district_map[district] = cursor.lastrowid

        district_id = district_map[district]

        cursor.execute("""
            INSERT INTO district_wise_drains.rivers
            (district_id, river_name)
            VALUES (%s,%s)
        """, (district_id, river))

        river_id = cursor.lastrowid

        cursor.execute("""
    INSERT INTO district_wise_drains.drain_master
    (
        river_id,
        total_drains,
        total_discharge,
        scrape_time
    )
    VALUES (%s,%s,%s,%s)
""", (
    river_id,
    int(float(row["TotalDrains"])),
    float(row["TotalDischargeMLD"]),
    scrape_time
))

        drain_id = cursor.lastrowid

        cursor.execute("""
            INSERT INTO district_wise_drains.tapped_drains
            (drain_id,tapped_drains,tapped_discharge)
            VALUES (%s,%s,%s)
        """, (
            drain_id,
            int(float(row["TappedDrains"])),
            float(row["TappedDischargeMLD"])
        ))

        cursor.execute("""
            INSERT INTO district_wise_drains.untapped_drains
            (drain_id,untapped_drains,untapped_discharge)
            VALUES (%s,%s,%s)
        """, (
            drain_id,
            int(float(row["UntappedDrains"])),
            float(row["UntappedDischargeMLD"])
        ))

        cursor.execute("""
            INSERT INTO district_wise_drains.partial_tapped_drains
            (drain_id,partial_tapped_drains,partial_tapped_discharge)
            VALUES (%s,%s,%s)
        """, (
            drain_id,
            int(float(row["PartialTappedDrains"])),
            float(row["PartialTappedDischargeMLD"])
        ))

        cursor.execute("""
            INSERT INTO district_wise_drains.not_to_be_tapped_drains
            (drain_id,not_to_be_tapped_drains,not_to_be_tapped_discharge)
            VALUES (%s,%s,%s)
        """, (
            drain_id,
            int(float(row["NotToBeTappedDrains"])),
            float(row["NotToBeTappedDischargeMLD"])
        ))
        conn.commit()
    print(f"Loaded {len(df)} rows")

def clear_audit():

    cursor.execute("SET FOREIGN_KEY_CHECKS=0")

    cursor.execute("TRUNCATE TABLE district_wise_drains_audit.not_to_be_tapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains_audit.partial_tapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains_audit.untapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains_audit.tapped_drains")
    cursor.execute("TRUNCATE TABLE district_wise_drains_audit.drain_master")
    cursor.execute("TRUNCATE TABLE district_wise_drains_audit.rivers")
    cursor.execute("TRUNCATE TABLE district_wise_drains_audit.districts")
    cursor.execute("SET FOREIGN_KEY_CHECKS=1")
    conn.commit()

    print("Audit Cleared")
def backup_current_to_audit():

    clear_audit()

    cursor.execute("""
        INSERT INTO district_wise_drains_audit.districts
        SELECT * FROM district_wise_drains.districts
    """)

    cursor.execute("""
        INSERT INTO district_wise_drains_audit.rivers
        SELECT * FROM district_wise_drains.rivers
    """)

    cursor.execute("""
        INSERT INTO district_wise_drains_audit.drain_master
        SELECT * FROM district_wise_drains.drain_master
    """)

    cursor.execute("""
        INSERT INTO district_wise_drains_audit.tapped_drains
        SELECT * FROM district_wise_drains.tapped_drains
    """)

    cursor.execute("""
        INSERT INTO district_wise_drains_audit.untapped_drains
        SELECT * FROM district_wise_drains.untapped_drains
    """)

    cursor.execute("""
        INSERT INTO district_wise_drains_audit.partial_tapped_drains
        SELECT * FROM district_wise_drains.partial_tapped_drains
    """)

    cursor.execute("""
        INSERT INTO district_wise_drains_audit.not_to_be_tapped_drains
        SELECT * FROM district_wise_drains.not_to_be_tapped_drains
    """)

    cursor.execute("""
        SELECT district_name
        FROM district_wise_drains_audit.districts
        ORDER BY district_id
        LIMIT 1
    """)

    print("AUDIT FIRST DISTRICT =", cursor.fetchone())
    conn.commit()
    print("Current copied to Audit")

if __name__ == "__main__":
    while True:

        try:

            conn.ping(reconnect=True)

            print("\n===== STARTED =====")

            generate_csv_from_html()

            cursor.execute("""
                           SELECT COUNT(*)
                           FROM district_wise_drains_audit.districts
                           """)

            audit_count = cursor.fetchone()[0]

            if audit_count == 0:

                print("FIRST CYCLE")

                clear_current()

                load_csv()

                backup_current_to_audit()

            else:

                print("NORMAL CYCLE")

                backup_current_to_audit()

                clear_current()

                load_csv()

            cursor.execute("""
                           SELECT district_name
                           FROM district_wise_drains.districts
                           ORDER BY district_id LIMIT 1
                           """)

            print("CURRENT FIRST DISTRICT =", cursor.fetchone())

            cursor.execute("""
                           SELECT district_name
                           FROM district_wise_drains_audit.districts
                           ORDER BY district_id LIMIT 1
                           """)

            print("AUDIT FIRST DISTRICT =", cursor.fetchone())

            print("Waiting 10 seconds...\n")

            time.sleep(10)

        except Exception as e:
            conn.rollback()
            import traceback

            traceback.print_exc()

            time.sleep(10)