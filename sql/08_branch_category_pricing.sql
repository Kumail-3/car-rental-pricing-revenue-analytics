-- 08_branch_category_pricing.sql
-- Branch and vehicle category pricing analysis

SELECT
    br.branch_name,
    br.city,
    b.vehicle_category,
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
    b.vehicle_category
ORDER BY
    br.branch_name,
    average_daily_rate DESC;
