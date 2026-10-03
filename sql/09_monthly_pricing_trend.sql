-- 09_monthly_pricing_trend.sql
-- Monthly pricing and revenue trend analysis

SELECT
    strftime('%Y-%m', pickup_date) AS rental_month,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(AVG(daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY rental_month
ORDER BY rental_month;
