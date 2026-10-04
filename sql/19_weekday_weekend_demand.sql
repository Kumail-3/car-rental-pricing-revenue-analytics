-- 19_weekday_weekend_demand.sql
-- Weekday vs weekend demand analysis
--
-- Calculation Method:
-- Weekday = Monday to Friday
-- Weekend = Saturday and Sunday
--
-- Bookings = COUNT(booking_id)
-- Rental Days = SUM(rental_days)
-- Demand Share =
--     Bookings / Total Completed Bookings × 100
-- Average Rental Days =
--     Total Rental Days / Completed Bookings
--
-- SQLite strftime('%w') returns:
-- 0 = Sunday
-- 1 = Monday
-- 2 = Tuesday
-- 3 = Wednesday
-- 4 = Thursday
-- 5 = Friday
-- 6 = Saturday
--
-- The analysis uses completed bookings only.

WITH demand_type AS (
    SELECT
        booking_id,
        rental_days,
        CASE
            WHEN CAST(strftime('%w', pickup_date) AS INTEGER)
                 IN (0, 6)
            THEN 'Weekend'
            ELSE 'Weekday'
        END AS day_type
    FROM bookings
    WHERE booking_status = 'Completed'
)

SELECT
    day_type,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(
        COUNT(booking_id) * 100.0 /
        (SELECT COUNT(booking_id) FROM demand_type),
        2
    ) AS demand_share_pct,
    ROUND(
        SUM(rental_days) * 1.0 / COUNT(booking_id),
        2
    ) AS average_rental_days
FROM demand_type
GROUP BY day_type
ORDER BY bookings DESC;

