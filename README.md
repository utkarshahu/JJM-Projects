# Jal Jeevan Mission / Namami Gange Unified Scraping System

## Overview

This repository contains multiple independent web scraping projects.

Each project maintains two databases:

### 1. Current Database

* Stores latest scraped data.
* Always contains current snapshot.

### 2. Audit Database

* Stores historical snapshots.
* Used for change tracking and audit history.

---

# Database Architecture

## 1. Weekly Progress of Namami Gange Undertendering Projects

### Current Database

```text
weekly_progress_of_namami_gange_undertendering_projects
```

### Audit Database

```text
audit_weekly_progress_of_namami_gange_undertendering_projects
```

### Main Tables

Current:

```text
districts
cities
undertendering_projects
```

Audit:

```text
audit_districts
audit_cities
audit_undertendering_projects
```

---

## 2. Weekly Progress of Namami Gange Ongoing Projects

### Current Database

```text
weekly_progress_of_namami_gange_ongoingprojects
```

### Audit Database

```text
audit_weekly_progress_of_namami_gange_ongoingprojects
```

### Main Tables

Current:

```text
districts
cities
agencies
sewerage_projects
project_components
```

Audit:

```text
audit_districts
audit_cities
audit_agencies
audit_sewerage_projects
audit_project_components
```

---

## 3. Weekly Progress of Namami Gange Completed Projects

### Current Database

```text
weekly_progress_of_namami_gange_completed_projects
```

### Audit Database

```text
audit_weekly_progress_of_namami_gange_completed_projects
```

### Main Tables

Current:

```text
districts
cities
completed_projects
project_components
```

Audit:

```text
audit_districts
audit_cities
audit_completed_projects
audit_project_components
```

---

## 4. Weekly Progress of Namami Gange DPR Projects

### Current Database

```text
weekly_progress_of_namami_gange_drp_projects
```

### Audit Database

```text
weekly_progress_of_namami_gange_drp_projects_audit
```

### Main Tables

Current:

```text
districts
cities
dpr_projects
```

Audit:

```text
audit_districts
audit_cities
audit_dpr_projects
```

---

## 5. STP Monitoring

### Current Database

```text
stp_monitoring
```

### Audit Database

```text
stp_monitoring_audit
```

### Main Tables

Current:

```text
stp_categories
stp_capacity_summary
stp_details
stp_utilization
```

Audit:

```text
audit_stp_categories
audit_stp_capacity_summary
audit_stp_details
audit_stp_utilization
```

---

## 6. CETP Monitoring

### Current Database

```text
cetp_monitoring
```

### Audit Database

```text
cetp_monitoring_audit
```

### Main Tables

Current:

```text
nodal_agencies
cetp_projects
project_components
```

Audit:

```text
audit_nodal_agencies
audit_cetp_projects
audit_project_components
```

---

## 7. Status of CETP UP

### Current Database

```text
status_of_cetp_up
```

### Audit Database

```text
audit_status_of_cetp_up
```

### Main Tables

Current:

```text
nodal_agencies
cetp_projects
project_components
```

Audit:

```text
audit_nodal_agencies
audit_cetp_projects
audit_project_components
```

---

## 8. District Wise Drains

### Current Database

```text
district_wise_drains
```

### Audit Database

```text
district_wise_drains_audit
```

### Main Tables

```text
districts
district_totals
rivers
drain_master
tapped_drains
untapped_drains
partial_tapped_drains
not_to_be_tapped_drains
```

Audit tables use the same structure with `audit_` prefix.

---

## 9. River Wise Drains

### Current Database

```text
river_wise_drains
```

### Audit Database

```text
river_wise_drains_audit
```

### Main Tables

```text
rivers
districts
drain_master
tapped_drains
untapped_drains
partial_tapped_drains
not_to_be_tapped_drains
```

Audit tables use the same structure with `audit_` prefix.

---

## 10. Citywise Discharge, STP Capacity and Gap Analysis

### Current Database

```text
citywise_discharge_stp_capacity_and_gap_analysis
```

### Audit Database

```text
citywise_discharge_stp_capacity_and_gap_analysis_audit
```

### Main Tables

```text
districts
cities
stp_capacity
gap_analysis
discharge_data
```

Audit tables use the same structure with `audit_` prefix.

---

# Universal Scraping Workflow

```text
Current Database
       │
       ▼
Copy Current Data to Audit
       │
       ▼
Truncate Current Tables
       │
       ▼
Scrape Latest Data
       │
       ▼
Transform Data
       │
       ▼
Load into Current Database
       │
       ▼
Validation
       │
       ▼
Success
```

---

# Audit Rules

Before every scrape:

1. Copy Current → Audit
2. Preserve historical data
3. Never delete audit data
4. Append new snapshots
5. Store scrape timestamp

---

# Unified Project Execution

The system should support a single command:

```bash
python scrap.py
and for frontend
python app.py
```

Execution Order:

```text
1. Undertendering Projects
2. Ongoing Projects
3. Completed Projects
4. DPR Projects
5. STP Monitoring
6. CETP Monitoring
7. Status of CETP UP
8. District Wise Drains
9. River Wise Drains
10. Citywise Discharge, STP Capacity and Gap Analysis
```

For each project:

```text
Backup Current → Audit
Clear Current
Scrape Fresh Data
Load Current Database
Validate Data
Generate Logs
```

---

# Environment Strategy

Single .env file:

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password

