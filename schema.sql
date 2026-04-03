-- NYC CITIBIKE ETL PIPELINE - DATABASE SCHEMA

-- Weather table
CREATE TABLE IF NOT EXISTS weather (
    date DATE PRIMARY KEY,
    temp_max_c FLOAT,
    temp_min_c FLOAT,
    precipitation_mm FLOAT
);

-- Stations table
CREATE TABLE IF NOT EXISTS stations (
    station_id TEXT PRIMARY KEY,
    station_name TEXT,
    lat FLOAT,
    lng FLOAT
);

-- Trips table
CREATE TABLE IF NOT EXISTS trips (
    ride_id TEXT,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT REFERENCES stations(station_id),
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual TEXT,
    trip_duration_mins FLOAT,
    hour INTEGER,
    day_of_week TEXT,
    month TEXT,
    date DATE REFERENCES weather(date),
    temp_max_c FLOAT,
    temp_min_c FLOAT,
    precipitation_mm FLOAT
);