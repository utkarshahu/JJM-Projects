````md
# Web Scraping Jal Jeevan Mission River Wise Drains Dashboard

## Project Overview

This project scrapes **River Wise Drains Status** data from the Jal Jeevan Mission Namami Gange portal and stores it in MySQL.

The system maintains:

- Current Database (Latest Data)
- Audit Database (Previous Snapshot)
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
River
   |
   v
District
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

```text
rivers
   |
   | 1:M
   |
districts
   |
   | 1:1
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

river_wise_drains.csv
river_wise_drains_page.html
```

---

# Environment Variables

Create a `.env` file:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
```

Database Names:

```text
River_Wise_Drains
River_Wise_Drains_Audit
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

Or:

```bash
pip install -r requirements.txt
```

---

# Scraper Configuration

Inside `scrap.py`

## Production Mode

```python
USE_REAL_WEBSITE = True
```

Reads directly from:

```text
https://jjm.up.gov.in/NamamiGange/RiverwiseDrainsStatus
```

---

## Testing Mode

```python
USE_REAL_WEBSITE = False
```

Reads data from:

```text
river_wise_drains_page.html
```

Useful for testing modified HTML locally.

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
Copy to Audit
      |
      v
Load New Data
```

Result:

```text
Current DB = Latest Data

Audit DB = Previous Snapshot
```

---

# Data Captured

For each River-District combination:

* River Name
* District Name
* Total Drains
* Total Discharge (MLD)
* Tapped Drains
* Tapped Discharge (MLD)
* Untapped Drains
* Untapped Discharge (MLD)
* Partial Tapped Drains
* Partial Tapped Discharge (MLD)
* Not To Be Tapped Drains
* Not To Be Tapped Discharge (MLD)
* Scrape Time

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

Returns latest data from Current Database.

---

## Audit Data API

```http
GET /api/audit
```

Returns previous snapshot from Audit Database.

---

## Manual Refresh API

```http
POST /api/fetch-now
```

Runs:

```text
manual_refresh.py
```

Used when automatic scraper is not running.

---

## Test Database API

```http
GET /test-db
```

Returns available database tables.

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

This script executes only once.

Used through Dashboard Refresh Button.

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

# Running Flask

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

Run Flask separately:

```bash
python app.py
```

Use Windows Task Scheduler, NSSM, PM2, or Supervisor to automatically restart services if they stop unexpectedly.

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
* Flask Dashboard
* Manual Refresh Button
* Automatic Scheduler
* Current vs Audit Data Tracking
* Environment Based Configuration
* River Wise Drain Analytics

