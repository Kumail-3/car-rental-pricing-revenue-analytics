-- 21_demand_vs_pricing.sql
-- Demand vs pricing analysis by vehicle category
--
-- Calculation Method:
-- Bookings = COUNT(booking_id)
-- Rental Days = SUM(rental_days)
-- Demand Share =
--     Category Bookings / Total Completed Bookings × 100
-- Average Daily Rate = AVG(daily_rate)
-- Total Revenue = SUM(total_revenue)
-- Revenue per Rental Day =
--     Total Revenue / Total Rental Days
--
-- The analysis uses completed bookings only.
-- The purpose is to compare observed demand with realised
-- pricing and revenue performance by vehicle category.

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
    ) AS demand_share_pct,
    ROUND(AVG(daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(
        SUM(total_revenue) * 1.0 /
        NULLIF(SUM(rental_days), 0),
        2
    ) AS revenue_per_rental_day
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_category
ORDER BY bookings DESC;

