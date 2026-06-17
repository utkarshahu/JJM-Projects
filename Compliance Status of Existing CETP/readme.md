# Web Scraping Jal Jeevan Mission CETP Compliance Dashboard

## Project Overview

This project scrapes **Compliance Status of Existing CETPs** from the Jal Jeevan Mission Namami Gange portal and stores the data in MySQL.

The system maintains:

* Current Database (Latest Snapshot)
* Audit Database (Previous Snapshot)
* CSV Export Layer
* Flask Dashboard
* Manual Refresh Support
* Automatic Scheduler

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
CETP
   |
   +---- Executing Agency
   |
   +---- Department
   |
   +---- Master Information
   |
   +---- Compliance Statistics
```

---

# ER Diagram

```text
cetps
   |
   | 1:M
   |
cetp_master
   |
   +------------------+
   |                  |
   v                  v
executing_agencies   departments
          |
          |
          v
cetp_compliance_statistics
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

cetp_compliance.csv

cetp_compliance.html
```

---

# Environment Variables

Create a .env file

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password

MAIN_DB_NAME=cetp_compliance
AUDIT_DB_NAME=cetp_compliance_audit
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
pip install flask
pip install mysql-connector-python
pip install python-dotenv
pip install pandas
```

Or

```bash
pip install -r requirements.txt
```

---

# Scraper Configuration

Inside scrap.py

```python
ONLINE_MODE = True
```

## Production Mode

```python
ONLINE_MODE = True
```

Reads directly from:

```text
https://jjm.up.gov.in/NamamiGange/jjm_Compliance_Status_of_Existing_CETP
```

---

## Testing Mode

```python
ONLINE_MODE = False
```

Reads data from:

```text
cetp_compliance.html
```

Useful for testing modified HTML without making requests to the live website.

---

# CSV Pipeline

Every cycle:

```text
Website / HTML
      |
      v
Generate CSV
      |
      v
Backup Current DB -> Audit DB
      |
      v
Clear Current DB
      |
      v
Load CSV Into Current DB
      |
      v
Wait 10 Seconds
```

Generated File:

```text
cetp_compliance.csv
```

---

# First Cycle Logic

If Audit Database is empty:

```text
Current Data
      |
      v
Audit Snapshot Created
```

Result:

```text
Current DB = Latest Data

Audit DB = Same Data
```

---

# Normal Cycle Logic

```text
Current Data
      |
      v
Copy To Audit
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

# Data Fields Captured

Each CETP record contains:

* CETP Name
* Total Industries
* Capacity (MLD)
* Executing Agency
* Department
* Compliance Status
* BOD Actual
* BOD Design
* COD Actual
* COD Design
* TSS Actual
* TSS Design
* pH Actual
* pH Design
* Remarks

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

Change if required:

```python
time.sleep(60)
```

for 1 minute refresh.

---

# Manual Refresh

Run:

```bash
python manual_refresh.py
```

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

Used when automatic scheduler is not running.

---

# Flask APIs

## Home Page

```http
GET /
```

Loads dashboard.

---

## Current Data

```http
GET /api/current
```

Returns latest snapshot.

---

## Audit Data

```http
GET /api/audit
```

Returns previous snapshot.

---

## Manual Refresh

```http
POST /api/fetch-now
```

Runs manual refresh process.

---

## Test Database

```http
GET /test-db
```

Returns database table list.

---

# Running Flask Dashboard

```bash
python app.py
```

Default:

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

Run Flask separately:

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
* CSV Generation
* MySQL Storage
* Audit Snapshot System
* Current vs Audit Tracking
* Flask Dashboard
* Manual Refresh Button
* Environment Based Configuration
* Scheduler Based Refresh
* Compliance Monitoring

---
