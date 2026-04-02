# 🚲 NYC Citi Bike Winter Ridership Analytics
## ETL Pipeline | Dec 2025 – Feb 2026

## 👥 Team Members
- Tariq Ibrahim
- Cohen Lesalon

## 📌 Project Overview
A production-style ETL pipeline analyzing NYC Citi Bike winter ridership patterns across 3 months (Dec 2025 – Feb 2026). We extracted 5 million trip records, enriched them with real NYC weather data, and loaded everything into a cloud PostgreSQL database to uncover how winter weather affects urban ridership.

## 🗂️ Project Structure
citibike-pipeline/
├── dags/
│   └── citibike_dag.py        # Airflow DAG
├── citibike_extract.ipynb     # Extract notebook
├── citibike_transform.ipynb   # Transform notebook
├── citibike_load.ipynb        # Load notebook
├── citibike_visualizations.ipynb  # Charts notebook
├── docker-compose.yml         # Airflow setup
└── README.md

## 📦 Data Sources
| Source | Format | Volume |
|--------|--------|--------|
| NYC Citi Bike (s3.amazonaws.com/tripdata) | CSV | ~5M rows |
| Open-Meteo Weather API (open-meteo.com) | JSON | 90 days |

## 🔧 Technology Stack
| Category | Tool |
|----------|------|
| Scripting | Python, pandas, requests |
| Database | PostgreSQL (Neon cloud) |
| Orchestration | Apache Airflow (Docker) |
| Visualization | Matplotlib, Seaborn |

## 📊 Key Findings
1. **Peak riding hour is 5PM** — 44,959 trips at evening commute
2. **W 21 St & 6 Ave** is the busiest station with 2,133 trips
3. **Members outnumber casual riders 8:1** in winter
4. **Cold weather directly reduces ridership** — trips drop near 0 below -5°C

## 🚀 How To Run
1. Clone this repository
2. Run `citibike_extract.ipynb` in Google Colab
3. Run `citibike_transform.ipynb` in Google Colab
4. Run `citibike_load.ipynb` in Google Colab
5. Start Airflow: `docker-compose up -d`
6. Open http://localhost:8080 and trigger `citibike_etl_pipeline`
7. Run `citibike_visualizations.ipynb` for charts

## 🏗️ Architecture
Data Sources → Extract → Transform → Load → Airflow → Visualize → Insights