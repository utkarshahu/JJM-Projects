# Web Scrapping Jal Jeevan Mission Dashboard

## Project Overview

This project scrapes District Wise Drain Status data from the Jal Jeevan Mission portal and stores it in MySQL.

The system maintains:

* Current Database (Latest Data)
* Audit Database (Previous Snapshot)
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
River
    |
    v
Drain Master
    |
    +---- Tapped Drains
    |
    +---- Untapped Drains
    |
    +---- Partial Tapped Drains
    |
    +---- Not To Be Tapped Drains
```

---

# ER Diagram

<img width="4500" height="8000" alt="District Wise Drains Status_page-0002" src="https://github.com/user-attachments/assets/bfc1fc5a-2abe-4c5b-a966-bdafaffabe52" />


```text
districts
    |
    | 1:M
    |
rivers
    |
    | 1:M
    |
drain_master
    |
    +---- tapped_drains
    |
    +---- untapped_drains
    |
    +---- partial_tapped_drains
    |
    +---- not_to_be_tapped_drains
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

district_wise_drains.csv
jjm_page.html
```

---

# Environment Variables

Create a .env file

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password

MAIN_DB_NAME=district_wise_drains
AUDIT_DB_NAME=district_wise_drains_audit
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

Inside scrap.py

```python
USE_REAL_WEBSITE = True
```

## Production Mode

```python
USE_REAL_WEBSITE = True
```

Reads directly from:

https://jjm.up.gov.in/NamamiGange/DistrictwiseDrainsStatus

---

## Testing Mode

```python
USE_REAL_WEBSITE = False
```

Reads data from:

```text
jjm_page.html
```

Useful for testing modified HTML.

---

# Scraper Flow

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

---

# First Cycle Logic

If Audit DB is empty:

```text
Load Current Data
        |
        v
Copy Current -> Audit
```

Result:

Current DB = Latest Data

Audit DB = Same Data

---

# Normal Cycle Logic

```text
Current Data
      |
      v
Copy to Audit
      |
      v
Load New Data
```

Result:

Current DB = Latest Data

Audit DB = Previous Snapshot

---

# Flask APIs

## Home Page

```http
GET /
```

Loads Dashboard

---

## Current Data API

```http
GET /api/current
```

Returns latest data from Current Database.

---

## Audit Data API

```http
GET /api/audit
```

Returns previous snapshot data from Audit Database.

---

## Manual Refresh API

```http
POST /api/fetch-now
```

Runs:

```text
manual_refresh.py
```

Used when automatic scraper fails.

---

## Python Environment API

```http
GET /test-python
```

Returns active Python executable.

---

# Manual Refresh

manual_refresh.py

```text
Generate CSV
      |
      v
Clear Current DB
      |
      v
Load New Data
```

This script executes only once.

Used through dashboard button.

---

# Running Scraper

```bash
python scrap.py
```

Runs continuously.

Default interval:

```python
time.sleep(10)
```

Change according to requirement.

Example:

```python
time.sleep(60)
```

for 1 minute refresh.

---

# Running Flask

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

1. Run scraper separately

```bash
python scrap.py
```

2. Run Flask separately

```bash
python app.py
```

3. Use Windows Task Scheduler or Process Manager to restart scraper automatically if it crashes.

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
* MySQL Storage
* Audit Snapshot System
* Flask Dashboard
* Manual Refresh Button
* Testing Mode Support
* Production Mode Support
* Current vs Audit Comparison
* REST APIs
* Environment Based Configuration

```
```
