import sys

from scrap import (
    scrape_data,
    save_csv,
    backup_current_to_audit,
    load_csv_to_current
)
sys.stdout.reconfigure(encoding="utf-8")

def manual_refresh():

    print("\n===== MANUAL REFRESH =====")

    records = scrape_data()

    save_csv(records)

    backup_current_to_audit()

    load_csv_to_current()

    print("Manual Refresh Completed")


if __name__ == "__main__":

    manual_refresh()