-- 25_booking_lead_time_summary.sql
-- Booking lead-time summary
--
-- Calculation Method:
-- Booking Lead Time = Pickup Date - Booking Date
--
-- Lead-time buckets:
-- 0-3 days   = Short lead time
-- 4-7 days   = Near-term booking
-- 8-14 days  = Advance booking
-- 15+ days   = Long advance booking
--
-- Booking Share =
--     Bookings in Bucket / Total Completed Bookings × 100
--
-- Average Daily Rate = AVG(daily_rate)
-- Total Revenue = SUM(total_revenue)
--
-- The analysis uses completed bookings only.

WITH lead_time AS (
    SELECT
        booking_id,
        daily_rate,
        total_revenue,
        CASE
            WHEN CAST(
                julianday(pickup_date) - julianday(booking_date)
                AS INTEGER
            ) BETWEEN 0 AND 3
                THEN '0-3 days'

            WHEN CAST(
                julianday(pickup_date) - julianday(booking_date)
                AS INTEGER
            ) BETWEEN 4 AND 7
                THEN '4-7 days'

            WHEN CAST(
                julianday(pickup_date) - julianday(booking_date)
                AS INTEGER
            ) BETWEEN 8 AND 14
                THEN '8-14 days'

            ELSE '15+ days'
        END AS lead_time_bucket
    FROM bookings
    WHERE booking_status = 'Completed'
)

SELECT
    lead_time_bucket,
    COUNT(booking_id) AS bookings,
    ROUND(
        COUNT(booking_id) * 100.0 /
        (SELECT COUNT(booking_id) FROM lead_time),
        2
    ) AS booking_share_pct,
    ROUND(AVG(daily_rate), 2) AS average_daily_rate,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM lead_time
GROUP BY lead_time_bucket
ORDER BY
    CASE lead_time_bucket
        WHEN '0-3 days' THEN 1
        WHEN '4-7 days' THEN 2
        WHEN '8-14 days' THEN 3
        WHEN '15+ days' THEN 4
    END;
