-- Car Rental Pricing & Revenue Analytics
-- SQLite Database Creation Script

PRAGMA foreign_keys = ON;

-- Drop existing tables so the script can be safely re-run
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS pricing;
DROP TABLE IF EXISTS fleet;
DROP TABLE IF EXISTS branches;

-- Branches
CREATE TABLE branches (
    branch_id INTEGER PRIMARY KEY,
    branch_name TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    location_type TEXT NOT NULL
);

-- Fleet
CREATE TABLE fleet (
    vehicle_id INTEGER PRIMARY KEY,
    branch_id INTEGER NOT NULL,
    vehicle_category TEXT NOT NULL,
    vehicle_make TEXT NOT NULL,
    vehicle_model TEXT NOT NULL,
    vehicle_year INTEGER,
    transmission TEXT,
    fuel_type TEXT,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- Pricing
CREATE TABLE pricing (
    pricing_id TEXT PRIMARY KEY,
    vehicle_category TEXT NOT NULL,
    season TEXT NOT NULL,
    demand_level TEXT NOT NULL,
    base_daily_rate REAL NOT NULL,
    min_daily_rate REAL NOT NULL,
    max_daily_rate REAL NOT NULL
);

-- Bookings
CREATE TABLE bookings (
    booking_id TEXT PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    branch_id INTEGER NOT NULL,
    booking_date TEXT NOT NULL,
    pickup_date TEXT NOT NULL,
    return_date TEXT NOT NULL,
    vehicle_category TEXT NOT NULL,
    daily_rate REAL NOT NULL,
    rental_days INTEGER NOT NULL,
    total_revenue REAL NOT NULL,
    booking_status TEXT NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES fleet(vehicle_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- Indexes to improve query performance
CREATE INDEX idx_bookings_vehicle
ON bookings(vehicle_id);

CREATE INDEX idx_bookings_branch
ON bookings(branch_id);

CREATE INDEX idx_bookings_pickup_date
ON bookings(pickup_date);

CREATE INDEX idx_fleet_branch
ON fleet(branch_id);

CREATE INDEX idx_fleet_category
ON fleet(vehicle_category);

CREATE INDEX idx_pricing_category
ON pricing(vehicle_category);
