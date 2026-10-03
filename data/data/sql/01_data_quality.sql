```sql
-- ============================================================
-- 01 - DATA QUALITY CHECKS
-- Car Rental Pricing & Revenue Analytics
-- ============================================================

-- 1. Total bookings and unique bookings

SELECT
    COUNT(*) AS total_bookings,
    COUNT(DISTINCT booking_id) AS unique_bookings,
    COUNT(*) - COUNT(DISTINCT booking_id) AS duplicate_records
FROM bookings;


-- ============================================================
-- 2. Check for missing values
-- ============================================================

SELECT
    COUNT(*) AS total_records,

    SUM(CASE WHEN booking_id IS NULL THEN 1 ELSE 0 END)
        AS missing_booking_id,

    SUM(CASE WHEN vehicle_id IS NULL THEN 1 ELSE 0 END)
        AS missing_vehicle_id,

    SUM(CASE WHEN branch_id IS NULL THEN 1 ELSE 0 END)
        AS missing_branch_id,

    SUM(CASE WHEN booking_date IS NULL THEN 1 ELSE 0 END)
        AS missing_booking_date,

    SUM(CASE WHEN pickup_date IS NULL THEN 1 ELSE 0 END)
        AS missing_pickup_date,

    SUM(CASE WHEN rental_days IS NULL THEN 1 ELSE 0 END)
        AS missing_rental_days,

    SUM(CASE WHEN daily_rate IS NULL THEN 1 ELSE 0 END)
        AS missing_daily_rate,

    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END)
        AS missing_revenue

FROM bookings;


-- ============================================================
-- 3. Check for invalid rental durations
-- ============================================================

SELECT
    booking_id,
    rental_days
FROM bookings
WHERE rental_days <= 0;


-- ============================================================
-- 4. Check for invalid pricing
-- ============================================================

SELECT
    booking_id,
    daily_rate,
    discount_pct,
    revenue
FROM bookings
WHERE daily_rate <= 0
   OR discount_pct < 0
   OR discount_pct > 100
   OR revenue < 0;


-- ============================================================
-- 5. Check booking dates
-- ============================================================

SELECT
    booking_id,
    booking_date,
    pickup_date,
    return_date
FROM bookings
WHERE pickup_date < booking_date
   OR return_date <= pickup_date;


-- ============================================================
-- 6. Check valid vehicle categories
-- ============================================================

SELECT DISTINCT
    f.category_code
FROM fleet f
LEFT JOIN vehicle_categories vc
    ON f.category_code = vc.category_code
WHERE vc.category_code IS NULL;


-- ============================================================
-- 7. Check valid branch relationships
-- ============================================================

SELECT
    b.booking_id,
    b.branch_id
FROM bookings b
LEFT JOIN branches br
    ON b.branch_id = br.branch_id
WHERE br.branch_id IS NULL;


-- ============================================================
-- 8. Summary by booking status
-- ============================================================

SELECT
    status,
    COUNT(*) AS booking_count
FROM bookings
GROUP BY status
ORDER BY booking_count DESC;
```
