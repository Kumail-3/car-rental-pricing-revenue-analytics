-- ============================================================
-- Car Rental Pricing & Revenue Analytics
-- Data Quality Checks
-- ============================================================

-- 1. Check total number of bookings
SELECT COUNT(*) AS total_bookings
FROM bookings;


-- 2. Check for duplicate booking IDs
SELECT booking_id, COUNT(*) AS duplicate_count
FROM bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;


-- 3. Check that total revenue equals daily rate × rental days
SELECT
    booking_id,
    daily_rate,
    rental_days,
    total_revenue
FROM bookings
WHERE total_revenue != daily_rate * rental_days;


-- 4. Check for invalid rental dates
SELECT
    booking_id,
    pickup_date,
    return_date,
    rental_days
FROM bookings
WHERE return_date <= pickup_date;


-- 5. Check that rental days match the pickup and return dates
SELECT
    booking_id,
    pickup_date,
    return_date,
    rental_days
FROM bookings
WHERE rental_days !=
      CAST(julianday(return_date) - julianday(pickup_date) AS INTEGER);


-- 6. Check for bookings referencing vehicles that do not exist
SELECT
    b.booking_id,
    b.vehicle_id
FROM bookings b
LEFT JOIN fleet f
    ON b.vehicle_id = f.vehicle_id
WHERE f.vehicle_id IS NULL;


-- 7. Check for bookings referencing branches that do not exist
SELECT
    b.booking_id,
    b.branch_id
FROM bookings b
LEFT JOIN branches br
    ON b.branch_id = br.branch_id
WHERE br.branch_id IS NULL;


-- 8. Check pricing boundaries
-- Minimum rate should be <= base rate <= maximum rate
SELECT
    pricing_id,
    vehicle_category,
    min_daily_rate,
    base_daily_rate,
    max_daily_rate
FROM pricing
WHERE min_daily_rate > base_daily_rate
   OR base_daily_rate > max_daily_rate;