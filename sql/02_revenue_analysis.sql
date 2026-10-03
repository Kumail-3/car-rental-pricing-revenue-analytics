-- ============================================================
-- Car Rental Pricing & Revenue Analytics
-- 02 - Revenue Analysis
-- ============================================================
--
-- Purpose:
-- Measure completed booking revenue, rental activity and
-- revenue efficiency across categories, branches and dates.
--
-- Primary KPIs:
-- - Total bookings
-- - Total rental days
-- - Total revenue
-- - Revenue per rental day
-- - Average daily rate
--
-- Scope:
-- Primary revenue analysis uses completed bookings only.
-- ============================================================


-- ------------------------------------------------------------
-- 1. Overall revenue performance
-- ------------------------------------------------------------
--
-- Method:
-- Filter to completed bookings and aggregate:
--
-- Total Bookings = COUNT(*)
-- Total Rental Days = SUM(rental_days)
-- Total Revenue = SUM(total_revenue)
--
-- Revenue per Rental Day =
-- Total Revenue / Total Rental Days
--
-- This provides the overall commercial performance baseline.
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_bookings,
    SUM(rental_days) AS total_rental_days,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(
        SUM(total_revenue) / SUM(rental_days),
        2
    ) AS average_daily_rate
FROM bookings
WHERE booking_status = 'Completed';


-- ------------------------------------------------------------
-- 2. Revenue by vehicle category
-- ------------------------------------------------------------
--
-- Method:
-- Group completed bookings by vehicle_category.
--
-- Measures:
-- - Booking volume
-- - Rental days
-- - Average daily rate
-- - Total revenue
--
-- This helps identify which vehicle categories generate the
-- greatest revenue and rental activity.
-- ------------------------------------------------------------

SELECT
    vehicle_category,
    COUNT(*) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(AVG(daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_category
ORDER BY total_revenue DESC;


-- ------------------------------------------------------------
-- 3. Revenue by branch
-- ------------------------------------------------------------
--
-- Method:
-- Join bookings to the branches table using branch_id.
--
-- Group by branch and calculate:
-- - Booking volume
-- - Rental days
-- - Average daily rate
-- - Total revenue
--
-- This supports branch-level pricing and revenue comparisons.
-- ------------------------------------------------------------

SELECT
    br.branch_name,
    br.city,
    br.state,
    COUNT(b.booking_id) AS bookings,
    SUM(b.rental_days) AS rental_days,
    ROUND(AVG(b.daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(b.total_revenue), 2) AS total_revenue
FROM bookings b
JOIN branches br
    ON b.branch_id = br.branch_id
WHERE b.booking_status = 'Completed'
GROUP BY
    br.branch_id,
    br.branch_name,
    br.city,
    br.state
ORDER BY total_revenue DESC;


-- ------------------------------------------------------------
-- 4. Revenue by location type
-- ------------------------------------------------------------
--
-- Method:
-- Group completed bookings according to the branch location
-- type, such as Airport or City.
--
-- This allows comparison of pricing and revenue between
-- different branch location formats.
-- ------------------------------------------------------------

SELECT
    br.location_type,
    COUNT(b.booking_id) AS bookings,
    SUM(b.rental_days) AS rental_days,
    ROUND(AVG(b.daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(b.total_revenue), 2) AS total_revenue
FROM bookings b
JOIN branches br
    ON b.branch_id = br.branch_id
WHERE b.booking_status = 'Completed'
GROUP BY br.location_type
ORDER BY total_revenue DESC;


-- ------------------------------------------------------------
-- 5. Daily revenue performance
-- ------------------------------------------------------------
--
-- Method:
-- Group completed bookings by pickup_date.
--
-- Measures:
-- - Number of bookings
-- - Total rental days
-- - Total revenue
--
-- This creates a daily revenue series that can be used to
-- identify demand patterns and support future pricing analysis.
-- ------------------------------------------------------------

SELECT
    pickup_date,
    COUNT(*) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(SUM(total_revenue), 2) AS daily_revenue
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY pickup_date
ORDER BY pickup_date;
