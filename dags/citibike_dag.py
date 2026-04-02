# CITIBIKE ETL PIPELINE - AIRFLOW DAG

from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

# Default settings for the DAG
default_args = {
    'owner': 'citibike-team',
    'retries': 2,
    'retry_delay': timedelta(minutes=5),
    'start_date': datetime(2026, 1, 1),
}

# Define the DAG
dag = DAG(
    'citibike_etl_pipeline',
    default_args=default_args,
    description='NYC Citibike ETL Pipeline',
    schedule_interval='@monthly',
    catchup=False
)

def extract():
    print("✅ EXTRACT: Pulling Citibike CSV files and Weather API data...")

def transform():
    print("✅ TRANSFORM: Cleaning data, calculating duration, joining weather...")

def load():
    print("✅ LOAD: Loading clean data into PostgreSQL...")

# Define tasks
extract_task = PythonOperator(task_id='extract', python_callable=extract, dag=dag)
transform_task = PythonOperator(task_id='transform', python_callable=transform, dag=dag)
load_task = PythonOperator(task_id='load', python_callable=load, dag=dag)

# Set order: Extract → Transform → Load
extract_task >> transform_task >> load_task