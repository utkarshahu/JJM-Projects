from scrap import (
    create_csv,
    backup_current_to_audit,
    clear_current,
    load_csv_to_current
)


def manual_refresh():

    try:

        print("\n===== MANUAL REFRESH =====")

        create_csv()

        print("CSV Generated")

        backup_current_to_audit()

        print("Audit Updated")

        clear_current()

        print("Current DB Cleared")

        load_csv_to_current()

        print("Current DB Reloaded")

        print("===== MANUAL REFRESH COMPLETED =====")

        return True

    except Exception as e:

        print("ERROR :", e)

        return False