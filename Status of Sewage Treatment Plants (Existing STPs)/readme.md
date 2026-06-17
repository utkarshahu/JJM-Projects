# Web Scraping Jal Jeevan Mission STP Status Dashboard (UPJN Rural)

## Project Overview

This project scrapes **Details of Existing STPs in Uttar Pradesh Maintained by UPJN Rural** from the Jal Jeevan Mission Namami Gange portal and stores the data in MySQL.

The system maintains:

- Current Database (Latest Data)
- Audit Database (Previous Snapshot)
- JSON Export
- CSV Export
- Flask Dashboard
- Automatic Scheduler
- Local HTML Testing Mode

---

# Project Architecture

```text
Jal Jeevan Mission Website
            |
            v
      Scraper (scrap.py)
            |
            +------ JSON Export
            |
            +------ CSV Export
            |
            v
      Current Database
            |
            v
      Audit Database
            |
            v
       Flask APIs
            |
            v
      Frontend Dashboard
````

---

# Database Structure

## Flow

```text
STP Maintainer
      |
      v
Status Summary
      |
      +---- Compliant
      |
      +---- Non-Compliant
      |
      +---- Non-Operational


STP Category
      |
      v
Capacity Summary
      |
      +---- Capacity (MLD)
      |
      +---- Utilization Capacity (MLD)
      |
      +---- Utilization Percentage
```

---

# ER Diagram

```text
stp_maintainers
      |
      | 1:M
      |
stp_status_summary


stp_categories
      |
      | 1:M
      |
stp_capacity_summary
```

---

# Project Files

```text
app.py
scrap.py
manual_refresh.py

templates/
    index.html

.env

upjn_rural.html

stp_status_up.json

status_summary.csv

capacity_summary.csv
```

---

# Environment Variables

Create a `.env` file

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password

MAIN_DB_NAME=stp_status_up
AUDIT_DB_NAME=audit_stp_status_up
```

---

# Installation

## Create Virtual Environment

```bash
python -m venv .venv
```

Activate:

```bash
.venv\Scripts\activate
```

---

## Install Packages

```bash
pip install requests
pip install beautifulsoup4
pip install mysql-connector-python
pip install python-dotenv
pip install flask
```

Or

```bash
pip install -r requirements.txt
```

---

# Scraper Configuration

Inside `scrap.py`

## Production Mode

```python
ONLINE_MODE = True
```

Reads directly from:

```text
https://jjm.up.gov.in/NamamiGange/Details_of_existing_STPs_in_Uttar_Pradesh_maintained_by_UPJN_Rural
```

---

## Testing Mode

```python
ONLINE_MODE = False
```

Reads data from:

```text
upjn_rural.html
```

Useful for testing modified HTML locally.

---

# Data Extracted

## Status Summary Table

For each STP Maintainer:

* Maintainer Name
* Total STPs
* Compliant STPs
* Non-Compliant STPs
* Non-Operational STPs

---

## Capacity Summary Table

For each Category:

* Category Name
* Total STPs
* Capacity (MLD)
* Utilization Capacity (MLD)
* Utilization Percentage

---

# Generated Files

## JSON

Generated:

```text
stp_status_up.json
```

Structure:

```json
{
  "report_date": "",
  "scrape_time": "",
  "status_summary": [],
  "capacity_summary": []
}
```

---

## CSV Files

Generated:

```text
status_summary.csv
capacity_summary.csv
```

---

# Scheduler Flow

Every cycle:

```text
Scrape Website
      |
      v
Generate JSON
      |
      v
Generate CSV
      |
      v
Update Current DB
      |
      v
Update Audit DB
      |
      v
Wait 10 Seconds
```

---

# Current Database

Stores latest snapshot data.

Tables:

```text
stp_maintainers

stp_status_summary

stp_categories

stp_capacity_summary
```

---

# Audit Database

Stores previous snapshot data.

Tables:

```text
stp_maintainers

stp_status_summary

stp_categories

stp_capacity_summary
```

---

# Flask APIs

## Home Page

```http
GET /
```

Loads Dashboard.

---

## Current Data API

```http
GET /api/current
```

Returns latest data.

---

## Audit Data API

```http
GET /api/audit
```

Returns previous snapshot.

---

## Manual Refresh API

```http
POST /api/fetch-now
```

Runs manual refresh process.

---

## Test Database API

```http
GET /test-db
```

Returns database tables.

---

# Running Scraper

```bash
python scrap.py
```

Runs continuously.

Default refresh interval:

```python
time.sleep(10)
```

For 1 minute refresh:

```python
time.sleep(60)
```

---

# Running Flask Dashboard

```bash
python app.py
```

Default URL:

```text
http://127.0.0.1:5000
```

LAN Access:

```text
http://YOUR_IP:5000
```

Example:

```text
http://192.168.1.56:5000
```

---

# Production Deployment

Recommended:

Run scraper separately:

```bash
python scrap.py
```

Run dashboard separately:

```bash
python app.py
```

Use:

* Windows Task Scheduler
* NSSM
* PM2
* Supervisor

to automatically restart services if they stop unexpectedly.

---

# Git Setup

```bash
git init

git add .

git commit -m "Initial Commit"

git remote add origin <repository-url>

git push -u origin main
```

---

# Features

* Automatic Website Scraping
* Local HTML Testing Mode
* JSON Export
* CSV Export
* MySQL Storage
* Audit Snapshot System
* Flask Dashboard
* Automatic Scheduler
* Current vs Audit Comparison
* Environment Based Configuration
* STP Status Monitoring
* Capacity Utilization Analytics

