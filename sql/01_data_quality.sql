-- ============================================================
-- Car Rental Pricing & Revenue Analytics
-- 01 - Data Quality Checks
-- ============================================================
--
-- Purpose:
-- Validate the booking, fleet, branch and pricing data before
-- using the dataset for commercial pricing and revenue analysis.
--
-- Methodology:
-- 1. Count booking records.
-- 2. Identify duplicate booking IDs.
-- 3. Validate revenue = daily rate × rental days.
-- 4. Validate pickup and return dates.
-- 5. Validate rental_days against date differences.
-- 6. Validate booking-to-vehicle relationships.
-- 7. Validate booking-to-branch relationships.
-- 8. Validate pricing boundaries.
--
-- A query returning no records generally indicates that no
-- exceptions were identified for that specific validation test.
-- ============================================================


-- ------------------------------------------------------------
-- 1. Total booking count
-- ------------------------------------------------------------
-- Method:
-- COUNT(*) returns the number of booking records in the table.
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_bookings
FROM bookings;


-- ------------------------------------------------------------
-- 2. Duplicate booking IDs
-- ------------------------------------------------------------
-- Method:
-- Group records by booking_id and identify IDs appearing
-- more than once.
--
-- Expected result:
-- No rows should be returned if booking IDs are unique.
-- ------------------------------------------------------------

SELECT
    booking_id,
    COUNT(*) AS duplicate_count
FROM bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;


-- ------------------------------------------------------------
-- 3. Revenue calculation validation
-- ------------------------------------------------------------
-- Expected revenue:
--
-- Total Revenue = Daily Rate × Rental Days
--
-- The query identifies records where the stored total_revenue
-- does not equal the expected calculation.
-- ------------------------------------------------------------

SELECT
    booking_id,
    daily_rate,
    rental_days,
    total_revenue
FROM bookings
WHERE total_revenue != daily_rate * rental_days;


-- ------------------------------------------------------------
-- 4. Rental date validation
-- ------------------------------------------------------------
-- Method:
-- A valid rental should have:
--
-- Return Date > Pickup Date
--
-- Records where the return date is equal to or earlier than
-- the pickup date are flagged.
-- ------------------------------------------------------------

SELECT
    booking_id,
    pickup_date,
    return_date,
    rental_days
FROM bookings
WHERE return_date <= pickup_date;


-- ------------------------------------------------------------
-- 5. Rental duration validation
-- ------------------------------------------------------------
-- Method:
-- Calculate the expected rental duration using the difference
-- between return_date and pickup_date.
--
-- Expected:
--
-- Rental Days =
-- julianday(return_date) - julianday(pickup_date)
--
-- The result is cast to INTEGER because rental_days is stored
-- as a whole number.
-- ------------------------------------------------------------

SELECT
    booking_id,
    pickup_date,
    return_date,
    rental_days
FROM bookings
WHERE rental_days !=
      CAST(
          julianday(return_date) - julianday(pickup_date)
          AS INTEGER
      );


-- ------------------------------------------------------------
-- 6. Vehicle referential integrity
-- ------------------------------------------------------------
-- Method:
-- LEFT JOIN bookings to fleet using vehicle_id.
--
-- Any booking without a matching vehicle in the fleet table
-- indicates a broken vehicle reference.
--
-- Expected result:
-- No rows should be returned.
-- ------------------------------------------------------------

SELECT
    b.booking_id,
    b.vehicle_id
FROM bookings b
LEFT JOIN fleet f
    ON b.vehicle_id = f.vehicle_id
WHERE f.vehicle_id IS NULL;


-- ------------------------------------------------------------
-- 7. Branch referential integrity
-- ------------------------------------------------------------
-- Method:
-- LEFT JOIN bookings to branches using branch_id.
--
-- Any booking without a matching branch indicates a broken
-- branch reference.
--
-- Expected result:
-- No rows should be returned.
-- ------------------------------------------------------------

SELECT
    b.booking_id,
    b.branch_id
FROM bookings b
LEFT JOIN branches br
    ON b.branch_id = br.branch_id
WHERE br.branch_id IS NULL;


-- ------------------------------------------------------------
-- 8. Pricing boundary validation
-- ------------------------------------------------------------
-- Expected pricing relationship:
--
-- Minimum Daily Rate
--        ≤
-- Base Daily Rate
--        ≤
-- Maximum Daily Rate
--
-- Records violating either boundary are flagged.
-- ------------------------------------------------------------

SELECT
    pricing_id,
    vehicle_category,
    min_daily_rate,
    base_daily_rate,
    max_daily_rate
FROM pricing
WHERE min_daily_rate > base_daily_rate
   OR base_daily_rate > max_daily_rate;
