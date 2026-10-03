.headers on
.mode column

SELECT
    br.branch_name,
    br.city,
    br.state,
    COUNT(b.booking_id) AS bookings,
    SUM(b.rental_days) AS rental_days,
    ROUND(SUM(b.total_revenue), 2) AS total_revenue,
    ROUND(
        SUM(b.total_revenue) * 1.0 /
        NULLIF(SUM(b.rental_days), 0),
        2
    ) AS revenue_per_rental_day
FROM bookings b
JOIN branches br
    ON b.branch_id = br.branch_id
WHERE b.booking_status = 'Completed'
GROUP BY
    br.branch_id,
    br.branch_name,
    br.city,
    br.state
ORDER BY revenue_per_rental_day DESC;
