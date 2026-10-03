-- 05_category_pricing.sql
-- Vehicle category pricing performance analysis

SELECT
    vehicle_category,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(AVG(daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(
        SUM(total_revenue) * 1.0 / SUM(rental_days),
        2
    ) AS revenue_per_rental_day
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_category
ORDER BY average_daily_rate DESC;