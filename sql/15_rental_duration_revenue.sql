.headers on
.mode column

SELECT
    rental_days,
    COUNT(*) AS bookings,
    SUM(rental_days) AS total_rental_days,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(AVG(daily_rate), 2) AS avg_daily_rate,
    ROUND(
        SUM(total_revenue) * 1.0 /
        NULLIF(SUM(rental_days), 0),
        2
    ) AS revenue_per_rental_day
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY rental_days
ORDER BY rental_days;
