-- 23_branch_demand_concentration.sql
-- Branch demand concentration analysis
--
-- Calculation Method:
-- Bookings = COUNT(booking_id)
-- Rental Days = SUM(rental_days)
-- Booking Demand Share =
--     Branch Bookings / Total Completed Bookings × 100
-- Rental-Day Demand Share =
--     Branch Rental Days / Total Completed Rental Days × 100
-- Average Rental Days =
--     Total Rental Days / Completed Bookings
--
-- The analysis uses completed bookings only.
-- Rental-day demand share measures the proportion of total
-- rental capacity consumed by each branch in the observed data.

SELECT
    b.branch_name,
    b.city,
    b.state,
    b.location_type,
    COUNT(bk.booking_id) AS bookings,
    SUM(bk.rental_days) AS rental_days,
    ROUND(
        COUNT(bk.booking_id) * 100.0 /
        (SELECT COUNT(booking_id)
         FROM bookings
         WHERE booking_status = 'Completed'),
        2
    ) AS booking_demand_share_pct,
    ROUND(
        SUM(bk.rental_days) * 100.0 /
        (SELECT SUM(rental_days)
         FROM bookings
         WHERE booking_status = 'Completed'),
        2
    ) AS rental_day_demand_share_pct,
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
    b.location_type
ORDER BY rental_day_demand_share_pct DESC;

