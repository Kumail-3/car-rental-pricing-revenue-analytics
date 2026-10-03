.headers on
.mode column

SELECT
    f.vehicle_id,
    f.vehicle_category,
    f.vehicle_make,
    f.vehicle_model,
    br.branch_name,
    COUNT(b.booking_id) AS bookings,
    COALESCE(SUM(b.rental_days), 0) AS rental_days,
    ROUND(COALESCE(SUM(b.total_revenue), 0), 2) AS total_revenue,
    ROUND(
        COALESCE(SUM(b.total_revenue), 0) * 1.0 /
        NULLIF(SUM(b.rental_days), 0),
        2
    ) AS revenue_per_rental_day
FROM fleet f
JOIN branches br
    ON f.branch_id = br.branch_id
LEFT JOIN bookings b
    ON f.vehicle_id = b.vehicle_id
    AND b.booking_status = 'Completed'
GROUP BY
    f.vehicle_id,
    f.vehicle_category,
    f.vehicle_make,
    f.vehicle_model,
    br.branch_name
ORDER BY total_revenue DESC;
