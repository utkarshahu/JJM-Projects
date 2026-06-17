# Web Scraping Jal Jeevan Mission Under Tendering Projects Dashboard

## Project Overview

This project scrapes **Weekly Progress of Namami Gange – Under Tendering Projects** data from the Jal Jeevan Mission portal and stores it in MySQL.

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
Under Tendering Project
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
undertendering_projects
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

undertendering_projects.csv
undertendering_projects.html
README.md
```

---

# Environment Variables

Create a `.env` file

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password

MAIN_DB_NAME=weekly_progress_of_namami_gange_undertendering_projects

AUDIT_DB_NAME=audit_weekly_progress_of_namami_gange_undertendering_projects

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

Reads directly from:

```text
https://jjm.up.gov.in/NamamiGange/Weekly_Progress_of_Namami_Gange_Projects?mode=U
```

---

## Testing Mode

```env
USE_LOCAL_HTML=True
```

Reads data from:

```text
undertendering_projects.html
```

Useful for testing modified HTML locally.

---

# Data Captured

Each Under Tendering Project contains:

* Sr No
* District
* Town
* Project Name
* Scheme Type
* Project Mode
* Date Of Sanction
* Sanction Cost
* Work Cost
* Centage
* O&M Cost
* Number Of STP
* STP Capacity
* Number Of Drains
* Date Of Updation
* Remarks

---

# CSV Generation

Generated File:

```text
undertendering_projects.csv
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

# First Run Logic

```text
Create CSV
      |
      v
Clear Current DB
      |
      v
Load Fresh Data
```

Result:

```text
Current DB = Latest Data
```

---

# Normal Cycle Logic

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
Create CSV
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

Default Interval:

```python
time.sleep(10)
```

---

# Current Database Tables

```text
districts

cities

undertendering_projects
```

---

# Audit Database Tables

```text
audit_districts

audit_cities

audit_undertendering_projects
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

Returns latest Under Tendering Project data.

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

## Statistics

```http
GET /api/stats
```

Returns:

* Total Projects
* Total Districts

---

## Database Test

```http
GET /test-db
```

Returns available database tables.

---

# Manual Refresh

`manual_refresh.py`

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

Use:

* Windows Task Scheduler
* NSSM
* PM2
* Supervisor

to restart services automatically if they stop.

---

