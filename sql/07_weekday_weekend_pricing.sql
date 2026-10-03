-- 07_weekday_weekend_pricing.sql
-- Weekday vs weekend pricing and revenue analysis

SELECT
    CASE
        WHEN CAST(strftime('%w', pickup_date) AS INTEGER) IN (0, 6)
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(AVG(daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY day_type
ORDER BY average_daily_rate DESC;
