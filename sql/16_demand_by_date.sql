-- 16_demand_by_date.sql
-- Daily booking demand analysis
--
-- Calculation Method:
-- Daily Bookings = COUNT(booking_id)
-- Daily Rental Days = SUM(rental_days)
--
-- The analysis uses completed bookings only.
-- Pickup date is used as the demand date because it represents
-- when the rental begins and therefore captures booking activity
-- by operating day.

SELECT
    pickup_date,
    COUNT(booking_id) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(
        SUM(rental_days) * 1.0 / COUNT(booking_id),
        2
    ) AS average_rental_days
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY pickup_date
ORDER BY pickup_date;
