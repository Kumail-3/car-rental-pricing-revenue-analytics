-- 03_utilisation.sql
-- Fleet utilisation analysis

SELECT
    vehicle_category,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(
        SUM(rental_days) * 1.0 / COUNT(booking_id),
        2
    ) AS average_rental_days
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_category
ORDER BY rental_days DESC;