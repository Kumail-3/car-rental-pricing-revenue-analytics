-- 17_demand_by_category.sql
-- Demand analysis by vehicle category
--
-- Calculation Method:
-- Bookings = COUNT(booking_id)
-- Rental Days = SUM(rental_days)
-- Booking Demand Share =
--     Category Bookings / Total Completed Bookings × 100
-- Average Rental Days =
--     Total Rental Days / Completed Bookings
--
-- The analysis uses completed bookings only.
-- Booking demand share shows the proportion of total completed
-- bookings represented by each vehicle category.

SELECT
    vehicle_category,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(
        COUNT(booking_id) * 100.0 /
        (SELECT COUNT(booking_id)
         FROM bookings
         WHERE booking_status = 'Completed'),
        2
    ) AS booking_demand_share_pct,
    ROUND(
        SUM(rental_days) * 1.0 / COUNT(booking_id),
        2
    ) AS average_rental_days
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_category
ORDER BY bookings DESC;
