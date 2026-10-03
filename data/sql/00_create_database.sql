```sql
-- ============================================================
-- CAR RENTAL PRICING & REVENUE ANALYTICS
-- Synthetic Portfolio Project
-- ============================================================
--
-- Purpose:
-- Create a synthetic car-rental database for analysing:
--   * Fleet utilisation
--   * Pricing
--   * Yield
--   * Revenue
--   * Booking behaviour
--   * Channel performance
--   * Vehicle-category performance
--
-- IMPORTANT:
-- All data in this project is synthetic and created for
-- portfolio/interview demonstration purposes.
--
-- It does NOT contain confidential or proprietary company data.
-- ============================================================


-- ============================================================
-- 1. BRANCHES
-- ============================================================

CREATE TABLE branches (
    branch_id INTEGER PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(10) NOT NULL,
    location_type VARCHAR(30) NOT NULL
);


INSERT INTO branches
(branch_id, branch_name, city, state, location_type)
VALUES
(1, 'Gold Coast Airport', 'Gold Coast', 'QLD', 'Airport'),
(2, 'Southport', 'Gold Coast', 'QLD', 'City'),
(3, 'Brisbane Airport', 'Brisbane', 'QLD', 'Airport'),
(4, 'Sydney Airport', 'Sydney', 'NSW', 'Airport'),
(5, 'Sydney CBD', 'Sydney', 'NSW', 'City'),
(6, 'Melbourne Airport', 'Melbourne', 'VIC', 'Airport'),
(7, 'Melbourne CBD', 'Melbourne', 'VIC', 'City'),
(8, 'Hobart Airport', 'Hobart', 'TAS', 'Airport'),
(9, 'Hobart City', 'Hobart', 'TAS', 'City'),
(10, 'Launceston Airport', 'Launceston', 'TAS', 'Airport'),
(11, 'Adelaide Airport', 'Adelaide', 'SA', 'Airport'),
(12, 'Perth Airport', 'Perth', 'WA', 'Airport');


-- ============================================================
-- 2. VEHICLE CATEGORY REFERENCE
-- ============================================================

CREATE TABLE vehicle_categories (
    category_code VARCHAR(10) PRIMARY KEY,
    fuel_type VARCHAR(20) NOT NULL,
    category_group VARCHAR(30) NOT NULL
);


INSERT INTO vehicle_categories
(category_code, fuel_type, category_group)
VALUES
('EDAV', 'Standard', 'Standard'),
('CDAV', 'Standard', 'Standard'),
('ICAV', 'Standard', 'Standard'),
('IFAV', 'Standard', 'Standard'),
('FFBV', 'Standard', 'Standard'),
('FFBR', 'Standard', 'Standard'),
('PVAV', 'Standard', 'Standard'),
('CDAH', 'Hybrid', 'Hybrid'),
('ICAH', 'Hybrid', 'Hybrid'),
('IFAH', 'Hybrid', 'Hybrid'),
('FFAH', 'Hybrid', 'Hybrid');


-- ============================================================
-- 3. FLEET
-- ============================================================

CREATE TABLE fleet (
    vehicle_id INTEGER PRIMARY KEY,
    branch_id INTEGER NOT NULL,
    category_code VARCHAR(10) NOT NULL,
    daily_base_rate DECIMAL(10,2) NOT NULL,
    acquisition_year INTEGER,
    active_flag INTEGER NOT NULL,

    FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id),

    FOREIGN KEY (category_code)
        REFERENCES vehicle_categories(category_code)
);


-- ------------------------------------------------------------
-- Gold Coast Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1001, 1, 'EDAV', 45.00, 2024, 1),
(1002, 1, 'CDAV', 52.00, 2024, 1),
(1003, 1, 'ICAV', 62.00, 2024, 1),
(1004, 1, 'IFAV', 72.00, 2025, 1),
(1005, 1, 'FFBV', 82.00, 2025, 1),
(1006, 1, 'FFBR', 90.00, 2025, 1),
(1007, 1, 'PVAV', 110.00, 2025, 1),
(1008, 1, 'CDAH', 60.00, 2025, 1),
(1009, 1, 'ICAH', 70.00, 2025, 1),
(1010, 1, 'IFAH', 80.00, 2025, 1),
(1011, 1, 'FFAH', 98.00, 2025, 1);


-- ------------------------------------------------------------
-- Southport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1101, 2, 'EDAV', 44.00, 2024, 1),
(1102, 2, 'CDAV', 51.00, 2024, 1),
(1103, 2, 'ICAV', 61.00, 2024, 1),
(1104, 2, 'IFAV', 71.00, 2025, 1),
(1105, 2, 'FFBV', 81.00, 2025, 1),
(1106, 2, 'FFBR', 89.00, 2025, 1),
(1107, 2, 'PVAV', 108.00, 2025, 1),
(1108, 2, 'CDAH', 59.00, 2025, 1),
(1109, 2, 'ICAH', 69.00, 2025, 1),
(1110, 2, 'IFAH', 79.00, 2025, 1),
(1111, 2, 'FFAH', 96.00, 2025, 1);


-- ------------------------------------------------------------
-- Brisbane Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1201, 3, 'EDAV', 48.00, 2024, 1),
(1202, 3, 'CDAV', 55.00, 2024, 1),
(1203, 3, 'ICAV', 65.00, 2024, 1),
(1204, 3, 'IFAV', 75.00, 2025, 1),
(1205, 3, 'FFBV', 85.00, 2025, 1),
(1206, 3, 'FFBR', 93.00, 2025, 1),
(1207, 3, 'PVAV', 112.00, 2025, 1),
(1208, 3, 'CDAH', 63.00, 2025, 1),
(1209, 3, 'ICAH', 73.00, 2025, 1),
(1210, 3, 'IFAH', 83.00, 2025, 1),
(1211, 3, 'FFAH', 101.00, 2025, 1);


-- ------------------------------------------------------------
-- Sydney Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1301, 4, 'EDAV', 55.00, 2024, 1),
(1302, 4, 'CDAV', 62.00, 2024, 1),
(1303, 4, 'ICAV', 72.00, 2024, 1),
(1304, 4, 'IFAV', 82.00, 2025, 1),
(1305, 4, 'FFBV', 92.00, 2025, 1),
(1306, 4, 'FFBR', 100.00, 2025, 1),
(1307, 4, 'PVAV', 120.00, 2025, 1),
(1308, 4, 'CDAH', 70.00, 2025, 1),
(1309, 4, 'ICAH', 80.00, 2025, 1),
(1310, 4, 'IFAH', 90.00, 2025, 1),
(1311, 4, 'FFAH', 108.00, 2025, 1);


-- ------------------------------------------------------------
-- Sydney CBD
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1401, 5, 'EDAV', 50.00, 2024, 1),
(1402, 5, 'CDAV', 58.00, 2024, 1),
(1403, 5, 'ICAV', 68.00, 2024, 1),
(1404, 5, 'IFAV', 78.00, 2025, 1),
(1405, 5, 'FFBV', 88.00, 2025, 1),
(1406, 5, 'FFBR', 96.00, 2025, 1),
(1407, 5, 'PVAV', 115.00, 2025, 1),
(1408, 5, 'CDAH', 66.00, 2025, 1),
(1409, 5, 'ICAH', 76.00, 2025, 1),
(1410, 5, 'IFAH', 86.00, 2025, 1),
(1411, 5, 'FFAH', 104.00, 2025, 1);


-- ------------------------------------------------------------
-- Melbourne Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1501, 6, 'EDAV', 52.00, 2024, 1),
(1502, 6, 'CDAV', 60.00, 2024, 1),
(1503, 6, 'ICAV', 70.00, 2024, 1),
(1504, 6, 'IFAV', 80.00, 2025, 1),
(1505, 6, 'FFBV', 90.00, 2025, 1),
(1506, 6, 'FFBR', 98.00, 2025, 1),
(1507, 6, 'PVAV', 118.00, 2025, 1),
(1508, 6, 'CDAH', 68.00, 2025, 1),
(1509, 6, 'ICAH', 78.00, 2025, 1),
(1510, 6, 'IFAH', 88.00, 2025, 1),
(1511, 6, 'FFAH', 106.00, 2025, 1);


-- ------------------------------------------------------------
-- Melbourne CBD
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1601, 7, 'EDAV', 48.00, 2024, 1),
(1602, 7, 'CDAV', 56.00, 2024, 1),
(1603, 7, 'ICAV', 66.00, 2024, 1),
(1604, 7, 'IFAV', 76.00, 2025, 1),
(1605, 7, 'FFBV', 86.00, 2025, 1),
(1606, 7, 'FFBR', 94.00, 2025, 1),
(1607, 7, 'PVAV', 114.00, 2025, 1),
(1608, 7, 'CDAH', 64.00, 2025, 1),
(1609, 7, 'ICAH', 74.00, 2025, 1),
(1610, 7, 'IFAH', 84.00, 2025, 1),
(1611, 7, 'FFAH', 102.00, 2025, 1);


-- ------------------------------------------------------------
-- Hobart Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1701, 8, 'EDAV', 46.00, 2024, 1),
(1702, 8, 'CDAV', 53.00, 2024, 1),
(1703, 8, 'ICAV', 63.00, 2024, 1),
(1704, 8, 'IFAV', 73.00, 2025, 1),
(1705, 8, 'FFBV', 83.00, 2025, 1),
(1706, 8, 'FFBR', 91.00, 2025, 1),
(1707, 8, 'PVAV', 111.00, 2025, 1),
(1708, 8, 'CDAH', 61.00, 2025, 1),
(1709, 8, 'ICAH', 71.00, 2025, 1),
(1710, 8, 'IFAH', 81.00, 2025, 1),
(1711, 8, 'FFAH', 99.00, 2025, 1);


-- ------------------------------------------------------------
-- Hobart City
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1801, 9, 'EDAV', 44.00, 2024, 1),
(1802, 9, 'CDAV', 51.00, 2024, 1),
(1803, 9, 'ICAV', 61.00, 2024, 1),
(1804, 9, 'IFAV', 71.00, 2025, 1),
(1805, 9, 'FFBV', 81.00, 2025, 1),
(1806, 9, 'FFBR', 89.00, 2025, 1),
(1807, 9, 'PVAV', 108.00, 2025, 1),
(1808, 9, 'CDAH', 59.00, 2025, 1),
(1809, 9, 'ICAH', 69.00, 2025, 1),
(1810, 9, 'IFAH', 79.00, 2025, 1),
(1811, 9, 'FFAH', 97.00, 2025, 1);


-- ------------------------------------------------------------
-- Launceston Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(1901, 10, 'EDAV', 43.00, 2024, 1),
(1902, 10, 'CDAV', 50.00, 2024, 1),
(1903, 10, 'ICAV', 60.00, 2024, 1),
(1904, 10, 'IFAV', 70.00, 2025, 1),
(1905, 10, 'FFBV', 80.00, 2025, 1),
(1906, 10, 'FFBR', 88.00, 2025, 1),
(1907, 10, 'PVAV', 107.00, 2025, 1),
(1908, 10, 'CDAH', 58.00, 2025, 1),
(1909, 10, 'ICAH', 68.00, 2025, 1),
(1910, 10, 'IFAH', 78.00, 2025, 1),
(1911, 10, 'FFAH', 95.00, 2025, 1);


-- ------------------------------------------------------------
-- Adelaide Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(2001, 11, 'EDAV', 47.00, 2024, 1),
(2002, 11, 'CDAV', 54.00, 2024, 1),
(2003, 11, 'ICAV', 64.00, 2024, 1),
(2004, 11, 'IFAV', 74.00, 2025, 1),
(2005, 11, 'FFBV', 84.00, 2025, 1),
(2006, 11, 'FFBR', 92.00, 2025, 1),
(2007, 11, 'PVAV', 110.00, 2025, 1),
(2008, 11, 'CDAH', 62.00, 2025, 1),
(2009, 11, 'ICAH', 72.00, 2025, 1),
(2010, 11, 'IFAH', 82.00, 2025, 1),
(2011, 11, 'FFAH', 100.00, 2025, 1);


-- ------------------------------------------------------------
-- Perth Airport
-- ------------------------------------------------------------

INSERT INTO fleet
(vehicle_id, branch_id, category_code, daily_base_rate, acquisition_year, active_flag)
VALUES
(2101, 12, 'EDAV', 49.00, 2024, 1),
(2102, 12, 'CDAV', 57.00, 2024, 1),
(2103, 12, 'ICAV', 67.00, 2024, 1),
(2104, 12, 'IFAV', 77.00, 2025, 1),
(2105, 12, 'FFBV', 87.00, 2025, 1),
(2106, 12, 'FFBR', 95.00, 2025, 1),
(2107, 12, 'PVAV', 114.00, 2025, 1),
(2108, 12, 'CDAH', 65.00, 2025, 1),
(2109, 12, 'ICAH', 75.00, 2025, 1),
(2110, 12, 'IFAH', 85.00, 2025, 1),
(2111, 12, 'FFAH', 103.00, 2025, 1);


-- ============================================================
-- 4. BOOKINGS
-- ============================================================

CREATE TABLE bookings (
    booking_id INTEGER PRIMARY KEY,

    vehicle_id INTEGER NOT NULL,

    branch_id INTEGER NOT NULL,

    booking_date DATE NOT NULL,

    pickup_date DATE NOT NULL,

    return_date DATE NOT NULL,

    rental_days INTEGER NOT NULL,

    days_to_book INTEGER NOT NULL,

    channel VARCHAR(30) NOT NULL,

    customer_segment VARCHAR(30) NOT NULL,

    daily_rate DECIMAL(10,2) NOT NULL,

    discount_pct DECIMAL(5,2) NOT NULL,

    revenue DECIMAL(10,2) NOT NULL,

    status VARCHAR(30) NOT NULL,

    peak_period INTEGER NOT NULL,

    FOREIGN KEY (vehicle_id)
        REFERENCES fleet(vehicle_id),

    FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);


-- ============================================================
-- 5. SAMPLE BOOKING DATA
-- ============================================================

INSERT INTO bookings
(
    booking_id,
    vehicle_id,
    branch_id,
    booking_date,
    pickup_date,
    return_date,
    rental_days,
    days_to_book,
    channel,
    customer_segment,
    daily_rate,
    discount_pct,
    revenue,
    status,
    peak_period
)
VALUES

-- Gold Coast
(1, 1001, 1, '2026-01-03', '2026-01-10', '2026-01-14',
 4, 7, 'Direct', 'Leisure', 49.00, 0, 196.00, 'Completed', 1),

(2, 1002, 1, '2026-01-05', '2026-01-08', '2026-01-11',
 3, 3, 'OTA', 'Leisure', 57.00, 5, 162.45, 'Completed', 0),

(3, 1003, 1, '2026-01-07', '2026-01-20', '2026-01-27',
 7, 13, 'Direct', 'Leisure', 79.00, 0, 553.00, 'Completed', 1),

(4, 1004, 1, '2026-01-10', '2026-01-12', '2026-01-15',
 3, 2, 'OTA', 'Leisure', 86.00, 5, 245.10, 'Completed', 1),

(5, 1008, 1, '2026-01-15', '2026-01-22', '2026-01-26',
 4, 7, 'Direct', 'Corporate', 68.00, 0, 272.00, 'Completed', 1),

-- Southport
(6, 1101, 2, '2026-02-01', '2026-02-05', '2026-02-08',
 3, 4, 'Direct', 'Corporate', 48.00, 0, 144.00, 'Completed', 0),

(7, 1102, 2, '2026-02-03', '2026-02-10', '2026-02-15',
 5, 7, 'OTA', 'Leisure', 56.00, 5, 266.00, 'Completed', 0),

(8, 1103, 2, '2026-02-08', '2026-02-20', '2026-02-27',
 7, 12, 'Direct', 'Leisure', 74.00, 0, 518.00, 'Completed', 1),

(9, 1104, 2, '2026-02-15', '2026-02-17', '2026-02-20',
 3, 2, 'Travel Agent', 'Leisure', 82.00, 8, 226.32, 'Completed', 1),

(10, 1108, 2, '2026-02-18', '2026-02-25', '2026-03-02',
 5, 7, 'Direct', 'Corporate', 66.00, 0, 330.00, 'Completed', 0),

-- Brisbane
(11, 1201, 3, '2026-03-01', '2026-03-05', '2026-03-08',
 3, 4, 'Direct', 'Corporate', 52.00, 0, 156.00, 'Completed', 0),

(12, 1202, 3, '2026-03-04', '2026-03-10', '2026-03-13',
 3, 6, 'OTA', 'Leisure', 61.00, 5, 173.85, 'Completed', 0),

(13, 1203, 3, '2026-03-08', '2026-03-20', '2026-03-27',
 7, 12, 'Direct', 'Leisure', 82.00, 0, 574.00, 'Completed', 1),

(14, 1207, 3, '2026-03-12', '2026-03-18', '2026-03-23',
 5, 6, 'Travel Agent', 'Leisure', 118.00, 8, 542.80, 'Completed', 1),

-- Sydney
(15, 1301, 4, '2026-04-01', '2026-04-05', '2026-04-08',
 3, 4, 'Direct', 'Leisure', 60.00, 0, 180.00, 'Completed', 0),

(16, 1302, 4, '2026-04-05', '2026-04-12', '2026-04-17',
 5, 7, 'OTA', 'Leisure', 68.00, 5, 323.00, 'Completed', 0),

(17, 1303, 4, '2026-04-08', '2026-04-20', '2026-04-27',
 7, 12, 'Direct', 'Leisure', 86.00, 0, 602.00, 'Completed', 1),

(18, 1307, 4, '2026-04-10', '2026-04-15', '2026-04-20',
 5, 5, 'Corporate', 'Corporate', 125.00, 0, 625.00, 'Completed', 1),

-- Melbourne
(19, 1501, 6, '2026-05-01', '2026-05-04', '2026-05-07',
 3, 3, 'Direct', 'Corporate', 57.00, 0, 171.00, 'Completed', 0),

(20, 1502, 6, '2026-05-04', '2026-05-10', '2026-05-15',
 5, 6, 'OTA', 'Leisure', 65.00, 5, 308.75, 'Completed', 0),

(21, 1503, 6, '2026-05-08', '2026-05-20', '2026-05-27',
 7, 12, 'Direct', 'Leisure', 84.00, 0, 588.00, 'Completed', 1),

(22, 1509, 6, '2026-05-10', '2026-05-18', '2026-05-23',
 5, 8, 'Travel Agent', 'Leisure', 82.00, 8, 377.20, 'Completed', 1),

-- Hobart
(23, 1701, 8, '2026-06-01', '2026-06-04', '2026-06-07',
 3, 3, 'Direct', 'Corporate', 50.00, 0, 150.00, 'Completed', 0),

(24, 1702, 8, '2026-06-05', '2026-06-12', '2026-06-17',
 5, 7, 'OTA', 'Leisure', 59.00, 5, 280.25, 'Completed', 0),

(25, 1703, 8, '2026-06-08', '2026-06-20', '2026-06-28',
 8, 12, 'Direct', 'Leisure', 78.00, 0, 624.00, 'Completed', 1),

(26, 1708, 8, '2026-06-10', '2026-06-22', '2026-06-26',
 4, 12, 'Direct', 'Leisure', 72.00, 0, 288.00, 'Completed', 1),

-- Launceston
(27, 1901, 10, '2026-07-01', '2026-07-05', '2026-07-08',
 3, 4, 'Direct', 'Leisure', 47.00, 0, 141.00, 'Completed', 0),

(28, 1902, 10, '2026-07-04', '2026-07-10', '2026-07-15',
 5, 6, 'OTA', 'Leisure', 56.00, 5, 266.00, 'Completed', 0),

(29, 1903, 10, '2026-07-07', '2026-07-20', '2026-07-28',
 8, 13, 'Direct', 'Leisure', 75.00, 0, 600.00, 'Completed', 1),

(30, 1909, 10, '2026-07-10', '2026-07-18', '2026-07-23',
 5, 8, 'Travel Agent', 'Leisure', 76.00, 8, 349.60, 'Completed', 1),

-- Adelaide
(31, 2001, 11, '2026-08-01', '2026-08-04', '2026-08-07',
 3, 3, 'Direct', 'Corporate', 51.00, 0, 153.00, 'Completed', 0),

(32, 2002, 11, '2026-08-05', '2026-08-12', '2026-08-17',
 5, 7, 'OTA', 'Leisure', 60.00, 5, 285.00, 'Completed', 0),

(33, 2003, 11, '2026-08-08', '2026-08-20', '2026-08-28',
 8, 12, 'Direct', 'Leisure', 80.00, 0, 640.00, 'Completed', 1),

-- Perth
(34, 2101, 12, '2026-09-01', '2026-09-04', '2026-09-07',
 3, 3, 'Direct', 'Corporate', 53.00, 0, 159.00, 'Completed', 0),

(35, 2102, 12, '2026-09-05', '2026-09-12', '2026-09-17',
 5, 7, 'OTA', 'Leisure', 63.00, 5, 299.25, 'Completed', 0),

(36, 2103, 12, '2026-09-08', '2026-09-20', '2026-09-27',
 7, 12, 'Direct', 'Leisure', 82.00, 0, 574.00, 'Completed', 1),

-- Hybrid examples
(37, 1008, 1, '2026-09-10', '2026-09-18', '2026-09-23',
 5, 8, 'Direct', 'Leisure', 72.00, 0, 360.00, 'Completed', 1),

(38, 1109, 2, '2026-09-12', '2026-09-20', '2026-09-25',
 5, 8, 'OTA', 'Leisure', 78.00, 5, 370.50, 'Completed', 1),

(39, 1509, 6, '2026-09-15', '2026-09-22', '2026-09-27',
 5, 7, 'Direct', 'Corporate', 85.00, 0, 425.00, 'Completed', 1),

(40, 1708, 8, '2026-09-18', '2026-09-25', '2026-09-30',
 5, 7, 'Direct', 'Leisure', 75.00, 0, 375.00, 'Completed', 1);


-- ============================================================
-- END OF DATABASE CREATION
-- ============================================================
```
