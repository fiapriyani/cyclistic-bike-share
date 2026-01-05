sql/01_data_cleaning.sql
-- Cyclistic Bike-Share Analysis
-- File: 01_data_cleaning.sql
-- Purpose:
-- - Clean raw trip data
-- - Create derived columns (ride_length, day_of_week)
-- - Filter invalid records
/* =========================================================
   Data Validation
   ========================================================= */

-- Check total number of rides
SELECT 
  COUNT(ride_id) AS total_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.012024_tripdata`;

-- Check unique ride IDs
SELECT 
  COUNT(DISTINCT ride_id) AS distinct_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.012024_tripdata`;

-- Validate member_casual values
SELECT 
  DISTINCT member_casual
FROM `totemic-fulcrum-425209-m7.cyclistic_project.012024_tripdata`;


/* =========================================================
   Data Cleaning
   ========================================================= */

CREATE OR REPLACE TABLE 
  `totemic-fulcrum-425209-m7.cyclistic_project.012024_tripdata_clean` AS
SELECT
  *,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week_name
FROM `totemic-fulcrum-425209-m7.cyclistic_project.012024_tripdata`
WHERE started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0
  AND TIMESTAMP_DIFF(ended_at, started_at, HOUR) < 24;
