# Jal Jeevan Mission – Drains STP Capacity Gap Analysis Dashboard

## Project Overview

This project scrapes **City Wise Discharge & STP Capacity Gap Analysis** data from the Jal Jeevan Mission Namami Gange portal and stores it in a structured MySQL database.

The system automatically:

* Scrapes data from the website or local HTML
* Converts raw HTML into hierarchical JSON
* Stores cleaned data in MySQL
* Maintains an Audit Snapshot database
* Supports automatic scheduled refresh
* Supports offline testing using local HTML
* Provides data for dashboard visualization

---

# Project Architecture

```text
Jal Jeevan Mission Website
            |
            v
      HTML Source
            |
            v
      JSON Generator
            |
            v
   drains_stp_hierarchical.json
            |
            v
      Main Database
            |
            v
      Audit Database
            |
            v
      Flask Dashboard
```

---

# Data Hierarchy

```text
District
    |
    v
Town / City
    |
    v
River
    |
    v
Drainage & STP Statistics
```

---

# Database Structure

```text
districts
    |
    | 1:M
    |
towns_cities
    |
    | M:M
    |
rivers
    |
    v
town_rivers
    |
    +--------------------+
    |                    |
    v                    v
population_statistics   drainage_stp_statistics
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

drains_stp_hierarchical.json

jjm_citywise_discharge_stp_capacity_gap_analysis.html
```

---

# Environment Variables

Create a .env file:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password

MAIN_DB_NAME=drains_stp_analysis
```

Audit Database Name is generated automatically:

```text
drains_stp_analysis_audit
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

Inside scrap.py

## Production Mode

```python
USE_ONLINE_SOURCE = True
```

Reads directly from:

```text
https://jjm.up.gov.in/NamamiGange/Drains_STPs_Comparison
```

---

## Testing Mode

```python
USE_ONLINE_SOURCE = False
```

Reads data from:

```text
jjm_citywise_discharge_stp_capacity_gap_analysis.html
```

Useful for local development and HTML testing.

---

# JSON Pipeline

The scraper first creates a hierarchical JSON snapshot:

```text
District
   |
   +---- Town
              |
              +---- Population Statistics
              |
              +---- River
                         |
                         +---- Drainage & STP Statistics
```

Generated File:

```text
drains_stp_hierarchical.json
```

---

# Database Sync Flow

Every cycle:

```text
Website / HTML
       |
       v
Generate JSON
       |
       v
Backup Main DB -> Audit DB
       |
       v
Clear Main DB
       |
       v
Insert Fresh Records
       |
       v
Wait 10 Seconds
```

---

# First Cycle Logic

If Main Database is empty:

```text
Load Fresh Data
```

Audit Snapshot is skipped.

---

# Normal Cycle Logic

```text
Current Data
      |
      v
Copy To Audit
      |
      v
Clear Main
      |
      v
Insert Fresh Data
```

Result:

```text
Main DB  = Latest Snapshot

Audit DB = Previous Snapshot
```

---

# Scheduler

Default refresh interval:

```python
time.sleep(10)
```

Change to:

```python
time.sleep(60)
```

for 1 minute refresh.

---

# Running Scraper

```bash
python scrap.py
```

The scraper will:

1. Generate JSON
2. Update Audit DB
3. Refresh Main DB
4. Repeat every 10 seconds

---

# Manual Refresh

Run:

```bash
python manual_refresh.py
```

Workflow:

```text
Generate JSON
      |
      v
Backup Audit
      |
      v
Refresh Main DB
```

Used when scheduled scraper is not running.

---

# Flask Dashboard

Run:

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

# Features

* HTML Scraping
* JSON Snapshot Generation
* Hierarchical Data Structure
* MySQL Storage
* Audit Snapshot System
* Automatic Scheduler
* Manual Refresh
* Local Testing Mode
* Online Production Mode
* Dashboard Integration
* Environment Based Configuration

---

# Production Deployment

Recommended Setup:

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

to auto-restart the scraper if it stops unexpectedly.

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

# Future Improvements

* Historical Trend Analysis
* Change Detection Reports
* Dashboard Charts
* District Comparison Analytics
* JSON Versioning
* Email Alerts
* Scheduled Exports
* REST API Authentication
* Docker Deployment
