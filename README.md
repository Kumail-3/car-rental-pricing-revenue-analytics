# Car Rental Pricing & Revenue Analytics

A synthetic pricing, revenue and fleet analytics project designed to demonstrate SQL, commercial analysis and pricing decision-making in the car rental industry.

The project uses a SQLite database containing booking, branch, fleet and pricing data. SQL is used to transform the raw data into commercially relevant metrics covering revenue, pricing, rental duration, fleet activity, vehicle performance and branch-level yield.

---

## Project Objective

The objective of this project is to answer practical commercial questions that a Pricing Analyst or Revenue Analyst may encounter in a car rental business:

- Which branches generate the most revenue?
- Which vehicle categories contribute the most revenue?
- What is the realised revenue per rental day?
- How does pricing vary between branches and vehicle categories?
- How does rental duration affect realised revenue?
- How does rental activity differ across vehicle categories?
- Which branches generate stronger revenue relative to their fleet size?
- Which individual vehicles generate the most revenue?
- How does pricing change over time?
- What percentage of total revenue comes from each vehicle category?
- Are the underlying booking and pricing data reliable?

The project follows the workflow:

**Raw Data → SQLite Database → SQL Analysis → Commercial Metrics → Visualisation → Business Insights**

---

# Project Overview

The dataset contains:

- **40 completed bookings**
- **136 total rental days**
- **$10,013 total revenue**
- **10 rental branches**
- **9 vehicle categories**
- Fleet-level vehicle information
- Branch-level location information
- Pricing boundaries for vehicle categories

The data is synthetic and is intended for portfolio and analytical demonstration purposes.

---

# Key KPIs

| KPI | Result |
|---|---:|
| Total bookings | 40 |
| Total rental days | 136 |
| Total revenue | $10,013 |
| Average revenue per booking | $250.33 |
| Average revenue per rental day | $73.63 |
| Branches | 10 |
| Vehicle categories | 9 |

### KPI Calculation Methods

**Average Revenue per Booking**

`Total Revenue ÷ Total Completed Bookings`

**Revenue per Rental Day**

`Total Revenue ÷ Total Rental Days`

These metrics provide the baseline for comparing revenue performance across branches, vehicle categories and rental durations.

---

# Revenue Analysis

## Calculation Method

The primary revenue analysis uses **completed bookings only**.

### Total Revenue

`SUM(total_revenue)`

### Total Rental Days

`SUM(rental_days)`

### Revenue per Rental Day

`SUM(total_revenue) ÷ SUM(rental_days)`

### Revenue by Branch

Completed booking revenue is grouped by `branch_id` and joined to the branch table to provide branch name, city and state.

### Revenue by Vehicle Category

Completed bookings are grouped by `vehicle_category` to compare booking volume, rental days, average daily rate and total revenue.

### Revenue by Location Type

Branches are grouped into location types such as **Airport** and **City** to compare their commercial performance.

---

## Revenue by Branch

| Branch | Bookings | Rental Days | Revenue |
|---|---:|---:|---:|
| Brisbane Airport | 5 | 17 | $1,516 |
| Gold Coast Airport | 6 | 20 | $1,508 |
| Launceston Airport | 5 | 19 | $1,497 |
| Southport | 4 | 14 | $1,135 |
| Sunshine Coast Airport | 4 | 14 | $1,032 |
| Hobart Airport | 4 | 14 | $994 |
| Launceston City | 4 | 14 | $964 |
| Hobart City | 3 | 10 | $590 |
| Brisbane City | 3 | 8 | $489 |
| Devonport | 2 | 6 | $288 |

---

## Revenue by Vehicle Category

| Vehicle Category | Bookings | Rental Days | Revenue |
|---|---:|---:|---:|
| ICAV | 8 | 30 | $2,157 |
| CDAV | 10 | 30 | $1,707 |
| EDAV | 11 | 31 | $1,460 |
| IFAV | 4 | 14 | $1,269 |
| FFBV | 2 | 9 | $1,051 |
| IFAH | 2 | 8 | $776 |
| FFBR | 1 | 5 | $640 |
| PVAV | 1 | 5 | $625 |
| ICAH | 1 | 4 | $328 |

---

# Pricing Analysis

## Calculation Method

Pricing analysis uses completed bookings and compares realised pricing across multiple dimensions.

### Average Daily Rate

For the overall dataset:

`Total Revenue ÷ Total Rental Days`

At category, branch and other analysis levels, the SQL also calculates:

`AVG(daily_rate)`

This allows comparison between the recorded booking daily rate and the realised revenue generated from rental activity.

### Pricing Dimensions

Pricing is analysed across:

- Branch
- Vehicle category
- Rental duration
- Weekday vs weekend
- Branch and vehicle category combinations
- Monthly periods

The purpose is to identify pricing differences and potential commercial opportunities.

---

# Revenue Yield

## Calculation Method

### Revenue per Rental Day

`Total Branch Revenue ÷ Total Branch Rental Days`

This measures the realised revenue generated for each rental day.

It is useful for comparing branches with different booking volumes because total revenue alone does not show how efficiently rental days are monetised.

## Revenue per Rental Day by Branch

| Branch | Revenue per Rental Day |
|---|---:|
| Brisbane Airport | $89.18 |
| Southport | $81.07 |
| Launceston Airport | $78.79 |
| Gold Coast Airport | $75.40 |
| Sunshine Coast Airport | $73.71 |
| Hobart Airport | $71.00 |
| Launceston City | $68.86 |
| Brisbane City | $61.13 |
| Hobart City | $59.00 |
| Devonport | $48.00 |

---

# Rental Duration Analysis

## Calculation Method

### Rental Duration

`Return Date − Pickup Date`

### Revenue per Rental Day

`Total Revenue ÷ Total Rental Days`

Bookings are grouped by `rental_days` to compare revenue performance across different rental lengths.

### Commercial Application

This analysis can support decisions around:

- Length-of-rental pricing
- Long-rental discounts
- Minimum rental periods
- Promotional pricing
- Revenue optimisation by rental duration

---

# Fleet Performance

## Calculation Method

Fleet performance compares branch-level rental activity against the number of vehicles assigned to each branch.

### Rental Days per Vehicle

`Total Rental Days ÷ Fleet Vehicles at Branch`

### Revenue per Vehicle

`Total Branch Revenue ÷ Fleet Vehicles at Branch`

These metrics provide a simple productivity view of the fleet.

**Important:** Rental days per vehicle is a fleet productivity measure, not a formal utilisation percentage. A formal utilisation rate would require available fleet-days or calendar capacity.

---

# Category Revenue Contribution

## Calculation Method

### Revenue Contribution %

`Category Revenue ÷ Total Revenue × 100`

### Average Revenue per Booking

`Category Revenue ÷ Category Bookings`

This analysis identifies the contribution of each vehicle category to total revenue.

It can support:

- Fleet allocation decisions
- Category pricing
- Vehicle mix optimisation
- Revenue forecasting
- Promotional strategy

---

# Data Quality

Before analysing the commercial metrics, the dataset is checked for consistency and integrity.

## Calculation Methods

### Revenue Consistency

`Expected Revenue = Daily Rate × Rental Days`

### Rental Date Validation

`Return Date > Pickup Date`

### Rental Duration Validation

`Rental Days = Return Date − Pickup Date`

### Vehicle Referential Integrity

Bookings are checked against the fleet table using `vehicle_id`.

### Branch Referential Integrity

Bookings are checked against the branches table using `branch_id`.

### Pricing Boundary Validation

`Minimum Daily Rate ≤ Base Daily Rate ≤ Maximum Daily Rate`

The completed data-quality checks found no mismatched revenue calculations, orphan vehicle or branch references, invalid rental dates, invalid rental durations or invalid pricing boundaries in the analysed dataset.

---

# SQL Analysis Library

The project contains 15 SQL analyses covering different commercial questions.

| SQL Analysis | Business Focus |
|---|---|
| `01_data_quality.sql` | Data validation and integrity checks |
| `02_revenue_analysis.sql` | Overall revenue performance |
| `03_utilisation.sql` | Rental activity by vehicle category |
| `04_branch_pricing.sql` | Pricing and revenue by branch |
| `05_category_pricing.sql` | Pricing by vehicle category |
| `06_rental_duration.sql` | Pricing by rental duration |
| `07_weekday_weekend_pricing.sql` | Weekday vs weekend pricing |
| `08_branch_category_pricing.sql` | Branch/category pricing combinations |
| `09_monthly_pricing_trend.sql` | Monthly pricing and revenue trends |
| `10_fleet_performance.sql` | Fleet size and branch productivity |
| `11_category_revenue_contribution.sql` | Revenue contribution by category |
| `12_booking_status_overview.sql` | Booking status and revenue |
| `13_branch_revenue_per_rental_day.sql` | Revenue yield by branch |
| `14_vehicle_performance.sql` | Vehicle-level performance |
| `15_rental_duration_revenue.sql` | Revenue by rental duration |

---

# Visualisations

The project includes four visualisations generated from the analysis.

## Branch Revenue

![Branch Revenue](charts/branch_revenue.png)

## Category Revenue

![Category Revenue](charts/category_revenue.png)

## Revenue per Rental Day

![Revenue per Rental Day](charts/revenue_per_rental_day.png)

## Rental Duration Revenue

![Rental Duration Revenue](charts/rental_duration_revenue.png)

These visualisations provide a visual layer on top of the SQL analysis and make the commercial findings easier to communicate.

---

# Key Findings

### Branch Revenue

Branch revenue ranges from **$288 at Devonport** to **$1,516 at Brisbane Airport**.

### Vehicle Category Revenue

ICAV generated **$2,157** across 8 completed bookings and 30 rental days.

### Revenue Yield

Revenue per rental day varies across branches, ranging from **$48.00 to $89.18** in the analysed dataset.

### Rental Duration

The analysis shows different realised revenue-per-rental-day levels across rental-duration groups, providing a starting point for investigating rental-duration pricing.

---

# Commercial Pricing Applications

The analysis can be extended into practical revenue-management decisions such as:

### Dynamic Pricing

Adjust daily rates based on:

- Demand
- Branch
- Vehicle category
- Rental duration
- Time period
- Day type

### Fleet Allocation

Use:

- Rental activity
- Revenue per vehicle
- Revenue per rental day
- Category demand

to support fleet allocation analysis.

### Rental Duration Pricing

Evaluate:

- Longer-rental discounts
- Short-rental pricing
- Minimum rental periods
- Rental-length pricing structures

### Branch Pricing

Compare realised revenue per rental day across branches to understand differences in revenue yield.

---

# Technology Stack

- **SQLite** — relational database
- **SQL** — data analysis and business metrics
- **CSV** — source datasets
- **Git** — version control
- **GitHub** — portfolio presentation
- **Markdown** — documentation
- **Matplotlib / PNG** — visual analysis

---

# Project Structure

```text
car-rental-pricing-revenue-analytics/
│
├── charts/
│   ├── branch_revenue.png
│   ├── category_revenue.png
│   ├── revenue_per_rental_day.png
│   └── rental_duration_revenue.png
│
├── data/
│   ├── bookings.csv
│   ├── branches.csv
│   ├── fleet.csv
│   └── pricing.csv
│
├── database/
│   └── car_rental.db
│
├── sql/
│   ├── 01_data_quality.sql
│   ├── 02_revenue_analysis.sql
│   ├── 03_utilisation.sql
│   ├── 04_branch_pricing.sql
│   ├── 05_category_pricing.sql
│   ├── 06_rental_duration.sql
│   ├── 07_weekday_weekend_pricing.sql
│   ├── 08_branch_category_pricing.sql
│   ├── 09_monthly_pricing_trend.sql
│   ├── 10_fleet_performance.sql
│   ├── 11_category_revenue_contribution.sql
│   ├── 12_booking_status_overview.sql
│   ├── 13_branch_revenue_per_rental_day.sql
│   ├── 14_vehicle_performance.sql
│   └── 15_rental_duration_revenue.sql
│
└── README.md

