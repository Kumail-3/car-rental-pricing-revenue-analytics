-- Car Rental Pricing & Revenue Analytics
-- 01 - Data Quality Checks

SELECT
    COUNT(*) AS total_bookings,
    COUNT(DISTINCT booking_id) AS unique_bookings
FROM bookings;
