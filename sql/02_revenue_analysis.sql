-- ============================================================
-- Car Rental Pricing & Revenue Analytics
-- Revenue Analysis
-- ============================================================

-- 1. Overall revenue KPIs
SELECT
    COUNT(*) AS total_bookings,
    SUM(rental_days) AS total_rental_days,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(SUM(total_revenue) / SUM(rental_days), 2) AS average_daily_rate
FROM bookings
WHERE booking_status = 'Completed';


-- 2. Revenue by vehicle category
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


-- 3. Revenue by branch
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


-- 4. Revenue by location type
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


-- 5. Daily revenue
SELECT
    pickup_date,
    COUNT(*) AS bookings,
    SUM(rental_days) AS rental_days,
    ROUND(SUM(total_revenue), 2) AS daily_revenue
FROM bookings
WHERE booking_status = 'Completed'
GROUP BY pickup_date
ORDER BY pickup_date;