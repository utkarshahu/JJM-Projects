# Web Scraping Jal Jeevan Mission Under Construction CETP Dashboard

## Project Overview

This project scrapes **Under Construction CETP (Common Effluent Treatment Plant)** data from the Jal Jeevan Mission Namami Gange portal and stores it in MySQL.

The system maintains:

- Current Database (Latest Data)
- Audit Database (Previous Snapshot)
- JSON Data Pipeline
- Flask Dashboard
- Manual Refresh Support
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
          JSON
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
Nodal Agency
      |
      v
CETP Project
      |
      v
Project Components
```

---

# ER Diagram

```text
nodal_agencies
      |
      | 1:M
      |
cetp_projects
      |
      | 1:M
      |
project_components
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

under_construction_cetp.json
under_construction_cetp.html
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
status_of_cetp_up
audit_status_of_cetp_up
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
USE_LOCAL_HTML = False
```

Reads directly from:

```text
https://jjm.up.gov.in/NamamiGange/UnderConstruction_CETP
```

---

## Testing Mode

```python
USE_LOCAL_HTML = True
```

Reads data from:

```text
under_construction_cetp.html
```

Useful for testing modified HTML locally.

---

# JSON Pipeline

The scraper converts the HTML table into a hierarchical JSON structure.

Generated File:

```text
under_construction_cetp.json
```

Structure:

```text
Project
   |
   +---- Project Information
   |
   +---- Nodal Agency
   |
   +---- Executive Agency
   |
   +---- Contractor
   |
   +---- Components
             |
             +---- Work Component
             +---- Technology
             +---- Capacity
             +---- Progress
```

---

# Scheduler Flow

Every cycle:

```text
Generate JSON
      |
      v
Backup Current DB -> Audit DB
      |
      v
Clear Current DB
      |
      v
Load New JSON Data
      |
      v
Wait 10 Seconds
```

---

# First Cycle Logic

```text
Generate JSON
      |
      v
Load Current Database
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

# Data Captured

Each CETP Project contains:

### Project Information

* Project Name
* Nodal Agency
* Executive Agency
* Contractor Name
* Date of Sanction
* Date of Start
* Date of Completion
* Sanction Cost (Cr)
* Agreement Cost (Cr)
* Physical Progress (%)
* Financial Progress (Cr)
* Date of Updation
* Remarks

### Project Components

* Work Component
* Technology
* Capacity / Length / Number
* Physical Progress (%)
* Photos

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

Used when automatic scheduler is not running.

---

## Database Test API

```http
GET /test-db
```

Returns database connectivity and table information.

---

# Manual Refresh

`manual_refresh.py`

Workflow:

```text
Generate JSON
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
* JSON Generation
* Hierarchical Data Storage
* MySQL Storage
* Audit Snapshot System
* Flask Dashboard
* Manual Refresh Support
* Automatic Scheduler
* Current vs Audit Data Tracking
* Environment Based Configuration
* CETP Project Monitoring


