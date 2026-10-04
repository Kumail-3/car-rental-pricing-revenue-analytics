-- 22_branch_category_demand.sql
-- Demand analysis by branch and vehicle category
--
-- Calculation Method:
-- Bookings = COUNT(booking_id)
-- Rental Days = SUM(rental_days)
-- Average Rental Days =
--     Total Rental Days / Completed Bookings
--
-- The analysis uses completed bookings only.
-- This identifies where demand is concentrated across
-- individual branch and vehicle-category combinations.

SELECT
    b.branch_name,
    b.city,
    b.state,
    b.location_type,
    bk.vehicle_category,
    COUNT(bk.booking_id) AS bookings,
    SUM(bk.rental_days) AS rental_days,
    ROUND(
        SUM(bk.rental_days) * 1.0 /
        COUNT(bk.booking_id),
        2
    ) AS average_rental_days
FROM bookings bk
JOIN branches b
    ON bk.branch_id = b.branch_id
WHERE bk.booking_status = 'Completed'
GROUP BY
    b.branch_name,
    b.city,
    b.state,
    b.location_type,
    bk.vehicle_category
ORDER BY
    b.branch_name,
    bookings DESC;

