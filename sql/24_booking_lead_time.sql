-- 24_booking_lead_time.sql
-- Booking lead-time analysis
--
-- Calculation Method:
-- Booking Lead Time = Pickup Date - Booking Date
--
-- Lead time measures the number of days between when a booking
-- was made and when the rental begins.
--
-- The analysis uses completed bookings only.
-- This metric helps identify advance-booking behaviour that can
-- support pricing and revenue-management decisions.

SELECT
    booking_id,
    booking_date,
    pickup_date,
    vehicle_category,
    branch_id,
    CAST(
        julianday(pickup_date) - julianday(booking_date)
        AS INTEGER
    ) AS booking_lead_days
FROM bookings
WHERE booking_status = 'Completed'
ORDER BY booking_lead_days DESC;
