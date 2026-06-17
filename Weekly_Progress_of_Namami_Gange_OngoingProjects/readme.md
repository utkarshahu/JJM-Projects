# Web Scraping Jal Jeevan Mission DPR Projects Dashboard

## Project Overview

This project scrapes **Weekly Progress of Namami Gange – DPR Projects** data from the Jal Jeevan Mission portal and stores it in MySQL.

The system maintains:

* Current Database (Latest Data)
* Audit Database (Previous Snapshot)
* CSV Export
* Flask Dashboard
* Manual Refresh Button
* Automatic Scraper Scheduler

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
```

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
DPR Project
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
DRP_Projects
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

DRP_Projects.csv
DRP_Projects.html
README.md
```

---

# Environment Variables

Create a `.env` file

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password

MAIN_DB_NAME=weekly_progress_of_namami_gange_drp_projects

AUDIT_DB_NAME=audit_weekly_progress_of_namami_gange_drp_projects

USE_LOCAL_HTML=True
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

## Install Dependencies

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

## Production Mode

```env
USE_LOCAL_HTML=False
```

Reads data directly from:

```text
https://jjm.up.gov.in/NamamiGange/Weekly_Progress_of_Namami_Gange_Projects?mode=D
```

---

## Testing Mode

```env
USE_LOCAL_HTML=True
```

Reads data from:

```text
DRP_Projects.html
```

Useful when testing modified HTML locally without hitting the live website.

---

# Data Captured

Each DPR Project record contains:

* Sr No
* District
* Town
* Project Name
* STP Count
* STP Capacity
* Drain Count
* Update Date
* Remarks

---

# CSV Generation

Generated File:

```text
DRP_Projects.csv
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

# Audit Snapshot Logic

## First Run

```text
Generate CSV
      |
      v
Load Current Database
```

Result:

```text
Current DB = Latest Data
```

---

## Normal Scheduler Cycle

```text
Current Data
      |
      v
Backup Current -> Audit
      |
      v
Generate Fresh CSV
      |
      v
Clear Current DB
      |
      v
Load New Data
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
Generate CSV
      |
      v
Backup Current DB -> Audit DB
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

Default Refresh Interval:

```python
time.sleep(10)
```

---

# Database Tables

## Current Database

```text
districts

cities

DRP_Projects
```

## Audit Database

```text
audit_districts

audit_cities

audit_DRP_Projects
```

---

# Flask APIs

## Home Page

```http
GET /
```

Loads Dashboard UI.

---

## Current Data

```http
GET /api/current
```

Returns latest DPR Project data.

---

## Audit Data

```http
GET /api/audit
```

Returns previous snapshot data.

---

## Manual Refresh

```http
POST /api/fetch-now
```

Triggers:

```text
manual_refresh.py
```

---

## Database Test

```http
GET /test-db
```

Returns available database tables.

---

# Manual Refresh

File:

```text
manual_refresh.py
```

Workflow:

```text
Create CSV
      |
      v
Backup Current -> Audit
      |
      v
Clear Current DB
      |
      v
Load CSV Into Current DB
```

Used through Dashboard Refresh Button.

---

# Running Scraper

```bash
python scrap.py
```

Runs continuously and refreshes data every 10 seconds.

---

# Running Flask Dashboard

```bash
python app.py
```

Default URL:

```text
http://127.0.0.1:5000
```

LAN Access Example:

```text
http://192.168.1.56:5000
```

---

# Production Deployment

Run scraper:

```bash
python scrap.py
```

Run dashboard:

```bash
python app.py
```

Recommended Process Managers:

* Windows Task Scheduler
* NSSM
* PM2
* Supervisor

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
