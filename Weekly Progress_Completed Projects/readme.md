# Web Scraping Jal Jeevan Mission Completed Projects Dashboard

## Project Overview

This project scrapes **Weekly Progress of Namami Gange – Completed Projects** data from the Jal Jeevan Mission portal and stores it in MySQL.

The system maintains:

- Current Database (Latest Data)
- Audit Database (Previous Snapshot)
- CSV Export
- Flask Dashboard
- Manual Refresh Button
- Automatic Scraper Scheduler

---

# Project Architecture

```text
Jal Jeevan Mission Website
            |
            v
      Scraper (scrap.py)
            |
            v
          CSV
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
District
    |
    v
City
    |
    v
Agency
    |
    v
Completed Sewerage Project
```

---

# ER Diagram

```text
districts
    |
    | 1:M
    |
cities
    |
    | 1:M
    |
sewerage_projects
    |
    | M:1
    |
agencies
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

completed_projects.csv

weekly_progress_completed_projects.html
```

---

# Environment Variables

Create a `.env` file

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password

MAIN_DB_NAME=Weekly_Progress_of_Namami_Gange_Completed_Projects

AUDIT_DB_NAME=Audit_Weekly_Progress_of_Namami_Gange_Completed_Projects
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
pip install pandas
pip install requests
pip install beautifulsoup4
pip install lxml
pip install flask
pip install mysql-connector-python
pip install python-dotenv
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
USE_LOCAL_HTML = False
```

Reads directly from:

```text
https://jjm.up.gov.in/NamamiGange/Weekly_Progress_of_Namami_Gange_Projects?mode=C
```

---

## Testing Mode

```python
USE_LOCAL_HTML = True
```

Reads data from:

```text
weekly_progress_completed_projects.html
```

Useful for testing modified HTML locally.

---

# Data Captured

Each Completed Project contains:

* Sr No
* District
* Town
* Project Name
* Scheme Type
* Project Mode
* Date of Sanction
* Sanction Cost
* Work Cost
* Centage Cost
* O&M Cost
* Number of STPs
* STP Capacity
* Number of Drains
* Agency Name
* Agreement Cost
* Remarks

---

# CSV Generation

Generated File:

```text
completed_projects.csv
```

Workflow:

```text
Website / HTML
       |
       v
Generate CSV
       |
       v
Load Into Database
```

---

# Audit Snapshot System

The project automatically keeps previous data snapshots.

### First Run

```text
Load Current Data
        |
        v
Copy Current -> Audit
```

Result:

```text
Current DB = Latest Data

Audit DB = Same Data
```

---

### Normal Cycle

```text
Current Data
      |
      v
Backup To Audit
      |
      v
Clear Current DB
      |
      v
Load Fresh Data
```

Result:

```text
Current DB = Latest Snapshot

Audit DB = Previous Snapshot
```

---

# Scheduler Flow

Every cycle:

```text
Backup Current DB -> Audit DB
          |
          v
Generate CSV
          |
          v
Clear Current DB
          |
          v
Load New CSV Data
          |
          v
Wait 10 Seconds
```

Default Interval:

```python
time.sleep(10)
```

---

# Current Database Tables

```text
districts

cities

agencies

sewerage_projects
```

---

# Audit Database Tables

```text
audit_districts

audit_cities

audit_agencies

audit_sewerage_projects
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

Returns latest completed projects.

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

Triggers:

```text
manual_refresh.py
```

Used when automatic scheduler is not running.

---

## Database Test API

```http
GET /test-db
```

Returns database tables.

---

# Manual Refresh

`manual_refresh.py`

Workflow:

```text
Generate CSV
      |
      v
Backup Current DB
      |
      v
Reload Current DB
```

Used through Dashboard Refresh Button.

---

# Running Scraper

```bash
python scrap.py
```

Runs continuously.

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
