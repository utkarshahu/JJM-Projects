import scrap

def main():
    try:
        print("===== Starting Manual Refresh =====")

        scrap.scheduler()

        print("===== Refresh Completed Successfully =====")
        return True

    except Exception as e:
        print(f"ERROR: {e}")
        return False


if __name__ == "__main__":
    main()