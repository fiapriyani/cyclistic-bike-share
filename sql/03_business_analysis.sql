-- Cyclistic Bike-Share Analysis
-- File: 03_business_analysis.sql
-- Purpose:
-- - Translate behavioral insights into business-relevant metrics
-- - Identify patterns that support membership conversion strategies
-- - Provide data-backed inputs for marketing recommendations
/* =========================================================
   Bike Type Usage per User Type
   ========================================================= */

SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.2024_fullyear_clean`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;
/* =========================================================
   Most Popular Start Stations per User Type
   ========================================================= */

SELECT
  member_casual,
  start_station_name,
  COUNT(*) AS total_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.2024_fullyear_clean`
WHERE start_station_name IS NOT NULL
GROUP BY member_casual, start_station_name
ORDER BY member_casual, total_rides DESC;
/* =========================================================
   Most Popular Routes per User Type
   ========================================================= */

SELECT
  member_casual,
  start_station_name,
  end_station_name,
  COUNT(*) AS total_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.2024_fullyear_clean`
WHERE start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
GROUP BY member_casual, start_station_name, end_station_name
ORDER BY member_casual, total_rides DESC;
