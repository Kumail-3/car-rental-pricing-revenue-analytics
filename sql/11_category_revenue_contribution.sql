.headers on
.mode column

WITH category_revenue AS (
    SELECT
        vehicle_category,
        COUNT(*) AS bookings,
        SUM(rental_days) AS rental_days,
        ROUND(SUM(total_revenue), 2) AS total_revenue,
        ROUND(AVG(total_revenue), 2) AS avg_revenue_per_booking
    FROM bookings
    WHERE booking_status = 'Completed'
    GROUP BY vehicle_category
)
SELECT
    vehicle_category,
    bookings,
    rental_days,
    total_revenue,
    ROUND(
        total_revenue * 100.0 /
        (SELECT SUM(total_revenue) FROM category_revenue),
        2
    ) AS revenue_share_pct,
    avg_revenue_per_booking
FROM category_revenue
ORDER BY total_revenue DESC;
