-- 04_branch_pricing.sql
-- Branch-level pricing performance analysis

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
ORDER BY average_daily_rate DESC;