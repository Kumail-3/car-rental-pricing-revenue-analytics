-- 20_monthly_demand.sql
-- Monthly booking demand analysis
--
-- Calculation Method:
-- Monthly Bookings = COUNT(booking_id)
-- Monthly Rental Days = SUM(rental_days)
-- Average Rental Days =
--     Total Rental Days / Completed Bookings
--
-- Pickup month is used as the demand period.
-- The analysis uses completed bookings only.

SELECT
    strftime('%Y-%m', pickup_date) AS month,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(
        SUM(rental_days) * 1.0 / COUNT(booking_id),
        2
    ) AS average_rental_days
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY strftime('%Y-%m', pickup_date)
ORDER BY month;

