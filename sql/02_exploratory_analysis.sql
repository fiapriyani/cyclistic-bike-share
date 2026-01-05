sql/02_exploratory_analysis.sql
-- Cyclistic Bike-Share Analysis
-- File: 02_exploratory_analysis.sql
-- Purpose:
-- - Explore usage patterns between members and casual riders
-- - Analyze ride frequency and ride duration
-- - Identify temporal trends (day of week, month)
/* =========================================================
   Total Rides per User Type
   ========================================================= */

SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.2024_fullyear_clean`
GROUP BY member_casual;
/* =========================================================
   Average Ride Length per User Type
   ========================================================= */

SELECT
  member_casual,
  AVG(ride_length) AS avg_ride_length_minutes
FROM `totemic-fulcrum-425209-m7.cyclistic_project.2024_fullyear_clean`
GROUP BY member_casual;
/* =========================================================
   Rides by Day of Week per User Type
   ========================================================= */

SELECT
  member_casual,
  day_of_week_name,
  COUNT(*) AS total_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.2024_fullyear_clean`
GROUP BY member_casual, day_of_week_name
ORDER BY member_casual, total_rides DESC;
/* =========================================================
   Rides by Month per User Type
   ========================================================= */

SELECT
  FORMAT_TIMESTAMP('%b', started_at) AS month_name,
  member_casual,
  COUNT(*) AS total_rides
FROM `totemic-fulcrum-425209-m7.cyclistic_project.2024_fullyear_clean`
GROUP BY month_name, member_casual
ORDER BY member_casual, total_rides DESC;
