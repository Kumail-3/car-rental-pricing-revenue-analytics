.headers on
.mode column

SELECT
    booking_status,
    COUNT(*) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_booking
FROM bookings
GROUP BY booking_status
ORDER BY bookings DESC;
