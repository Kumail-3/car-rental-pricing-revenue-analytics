.headers on
.mode column

SELECT
    br.branch_name,
    br.city,
    br.state,
    COUNT(DISTINCT f.vehicle_id) AS fleet_size,
    COUNT(DISTINCT b.booking_id) AS bookings,
    COALESCE(SUM(b.rental_days), 0) AS rental_days,
    ROUND(COALESCE(SUM(b.total_revenue), 0), 2) AS total_revenue,
    ROUND(
        COALESCE(SUM(b.rental_days), 0) * 1.0
        / NULLIF(COUNT(DISTINCT f.vehicle_id), 0),
        2
    ) AS rental_days_per_vehicle,
    ROUND(
        COALESCE(SUM(b.total_revenue), 0) * 1.0
        / NULLIF(COUNT(DISTINCT f.vehicle_id), 0),
        2
    ) AS revenue_per_vehicle
FROM branches br
LEFT JOIN fleet f
    ON br.branch_id = f.branch_id
LEFT JOIN bookings b
    ON br.branch_id = b.branch_id
    AND b.booking_status = 'Completed'
GROUP BY
    br.branch_id,
    br.branch_name,
    br.city,
    br.state
ORDER BY revenue_per_vehicle DESC;
