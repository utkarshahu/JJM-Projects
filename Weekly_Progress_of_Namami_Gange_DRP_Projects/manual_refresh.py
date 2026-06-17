from scrap import (
    create_csv,
    backup_current_to_audit,
    clear_current,
    load_csv_to_current
)


def manual_refresh():

    try:

        print("\n" + "=" * 60)
        print("MANUAL REFRESH STARTED")
        print("=" * 60)

        print(
            "\nSTEP 1 : Create CSV"
        )

        create_csv()

        print(
            "\nSTEP 2 : Backup Current -> Audit"
        )

        backup_current_to_audit()

        print(
            "\nSTEP 3 : Clear Current DB"
        )

        clear_current()

        print(
            "\nSTEP 4 : Load CSV To Current DB"
        )

        load_csv_to_current()

        print(
            "\nMANUAL REFRESH COMPLETED"
        )

        return True

    except Exception as e:

        print(
            "\nMANUAL REFRESH ERROR :",
            e
        )

        return False