.headers on
.mode column

WITH fleet_summary AS (
    SELECT
        branch_id,
        COUNT(*) AS fleet_size
    FROM fleet
    GROUP BY branch_id
),
booking_summary AS (
    SELECT
        branch_id,
        COUNT(DISTINCT booking_id) AS bookings,
        SUM(rental_days) AS rental_days,
        ROUND(SUM(total_revenue), 2) AS total_revenue
    FROM bookings
    WHERE booking_status = 'Completed'
    GROUP BY branch_id
)
SELECT
    br.branch_name,
    br.city,
    br.state,
    fs.fleet_size,
    COALESCE(bs.bookings, 0) AS bookings,
    COALESCE(bs.rental_days, 0) AS rental_days,
    COALESCE(bs.total_revenue, 0) AS total_revenue,
    ROUND(
        COALESCE(bs.rental_days, 0) * 1.0
        / NULLIF(fs.fleet_size, 0),
        2
    ) AS rental_days_per_vehicle,
    ROUND(
        COALESCE(bs.total_revenue, 0) * 1.0
        / NULLIF(fs.fleet_size, 0),
        2
    ) AS revenue_per_vehicle
FROM branches br
LEFT JOIN fleet_summary fs
    ON br.branch_id = fs.branch_id
LEFT JOIN booking_summary bs
    ON br.branch_id = bs.branch_id
ORDER BY revenue_per_vehicle DESC;
