import scrap

def main():

    print("=" * 60)
    print("MANUAL REFRESH STARTED")
    print("=" * 60)

    data = scrap.scrape_projects()
    scrap.backup_current_to_audit()
    scrap.clear_current()

    scrap.save_to_mysql(data)



    print("=" * 60)
    print("MANUAL REFRESH COMPLETED")
    print("=" * 60)

    return True


if __name__ == "__main__":
    main()