-- 06_rental_duration.sql
-- Rental duration and pricing analysis

SELECT
    rental_days,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS total_rental_days,
    ROUND(AVG(daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY rental_days
ORDER BY rental_days;