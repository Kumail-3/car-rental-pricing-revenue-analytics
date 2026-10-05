# Car Rental Pricing & Revenue Analytics

**SQL | Revenue Management | Demand Analysis | Pricing Analytics | Commercial Insights**

A portfolio project designed to demonstrate how booking, pricing, fleet and branch data can be transformed into **commercial insights for car rental pricing and revenue management**.

The project uses a synthetic SQLite database to analyse:

* Revenue performance
* Booking demand
* Vehicle category performance
* Branch pricing and revenue yield
* Rental duration
* Fleet activity
* Booking lead time
* Demand versus realised pricing

The analysis is designed around practical questions relevant to an **Assistant Pricing Analyst / Revenue Analyst**, including:

* Where is revenue being generated?
* Which vehicle categories drive the most demand and revenue?
* Which branches achieve stronger revenue yield?
* How does rental duration affect realised revenue?
* When are customers booking relative to pickup?
* How is demand distributed across branches and vehicle categories?
* What observed relationships exist between booking demand and pricing?
* Which metrics could support future pricing and fleet-allocation decisions?

### Analytical Approach

**Raw Data → Data Validation → SQLite Database → SQL Analysis → Demand & Pricing Metrics → Visualisation → Commercial Insights**

The project deliberately separates **observed relationships from causal conclusions**. For example, demand and pricing patterns are identified from the available dataset, but price elasticity is not claimed without sufficient historical data.

### Tools

* **SQL / SQLite** — data preparation, validation and analysis
* **Python** — data processing and visualisation
* **Git / GitHub** — version control and portfolio presentation
* **Excel-style commercial thinking** — KPI interpretation and pricing recommendations

---

# Project Overview

**Raw Data → SQLite Database → SQL Analysis → Commercial Metrics → Visualisation → Business Insights**

---

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

# Demand Analysis

The project also analyses booking demand patterns to understand how customer booking behaviour varies by date, vehicle category, branch, day type, and booking lead time.

### Demand by Date

Daily demand is measured using:

* **Bookings** = `COUNT(booking_id)`
* **Rental Days** = `SUM(rental_days)`
* **Average Rental Days** = `Rental Days / Bookings`

The analysis uses the **pickup date** as the demand date because it represents the start of the rental and therefore reflects operating-day demand.

### Demand by Vehicle Category

Vehicle-category demand is measured using:

* Completed bookings
* Total rental days
* Booking demand share
* Average rental days

**Booking Demand Share:**

`Category Bookings / Total Completed Bookings × 100`

The three highest-volume categories — **EDAV, CDAV and ICAV — account for 72.5% of completed bookings** in the current dataset.

### Demand by Branch

Branch demand is compared using:

* Completed bookings
* Rental days
* Booking demand share
* Average rental days

Airport locations account for **60% of completed bookings**, compared with **40% for city locations**.

### Weekday vs Weekend Demand

Bookings are classified using the pickup date:

* **Weekday** = Monday–Friday
* **Weekend** = Saturday–Sunday

The current dataset contains:

* **67.5% weekday bookings**
* **32.5% weekend bookings**

Average rental duration is **3.52 days for weekday bookings** compared with **3.15 days for weekend bookings**.

### Monthly Demand

Monthly demand is calculated by grouping completed bookings by pickup month.

The current dataset contains one month of completed bookings, so the analysis is structured for future months but does **not attempt to identify seasonality** from the current sample.

### Demand vs Pricing

Demand and realised pricing are compared at vehicle-category level using:

* Booking volume
* Booking demand share
* Average daily rate
* Total revenue
* Revenue per rental day

The current dataset shows that higher observed daily rates occur in lower-volume categories, while EDAV, CDAV and ICAV represent the majority of bookings.

This is an **observed relationship rather than evidence of price elasticity or causation**. A larger dataset across multiple periods would be required to evaluate pricing response more reliably.

### Branch-Category Demand

Demand is also analysed across the combination of:

**Branch × Vehicle Category**

This helps identify where specific vehicle categories generate booking activity and provides a basis for future fleet allocation and pricing decisions.

Because many branch-category combinations currently contain only one booking, individual combinations should be interpreted cautiously.

### Branch Demand Concentration

Branch demand concentration is calculated using:

`Branch Bookings / Total Completed Bookings × 100`

This helps identify branches contributing the largest share of booking demand and can support prioritisation of pricing and fleet-management analysis.

---

## Booking Lead-Time Analysis

Booking lead time measures the number of days between when a booking is created and when the rental begins.

**Booking Lead Time:**

`Pickup Date − Booking Date`

Lead time is useful for understanding advance-booking behaviour and can support future revenue-management decisions.

### Lead-Time Buckets

| Lead Time | Bookings | Booking Share | Average Daily Rate | Revenue |
|---|---:|---:|---:|---:|
| 0–3 days | 4 | 10% | $48.00 | $476 |
| 4–7 days | 10 | 25% | $50.90 | $1,527 |
| 8–14 days | 16 | 40% | $68.00 | $3,778 |
| 15+ days | 10 | 25% | $100.10 | $4,232 |


### Lead-Time Finding

**65% of completed bookings were made at least 8 days before pickup**, representing approximately **80% of total revenue ($8,010 of $10,013)**.

The dataset also shows an increasing observed average daily rate across longer lead-time buckets:

* 0–3 days: **$48.00**
* 4–7 days: **$50.90**
* 8–14 days: **$68.00**
* 15+ days: **$100.10**

This pattern can be used as a starting point for investigating advance-purchase behaviour and potential pricing strategies.

However, the analysis **does not establish that longer lead times cause higher prices**. Vehicle mix, branch, rental duration and other factors may also influence the observed rates.

### SQL Demand Analyses

The demand and booking-behaviour analysis is implemented through:

* `16_demand_by_date.sql`
* `17_demand_by_category.sql`
* `18_demand_by_branch.sql`
* `19_weekday_weekend_demand.sql`
* `20_monthly_demand.sql`
* `21_demand_vs_pricing.sql`
* `22_branch_category_demand.sql`
* `23_branch_demand_concentration.sql`
* `24_booking_lead_time.sql`
* `25_booking_lead_time_summary.sql`

The demand analysis is presented primarily through **SQL tables and calculation methodology rather than additional charts**, allowing the repository to focus visualisations on the core revenue and pricing analysis.
# Commercial Pricing Applications

# Forecasting Methodology

Forecasting can be used to estimate future booking demand, rental activity and revenue based on historical patterns.

The current dataset contains one month of completed bookings, so it is not sufficient to build a reliable production forecasting model. However, the project is structured so that additional historical data can be incorporated into the forecasting process.

## 1. Moving Average

A moving average forecasts the next period by calculating the average of recent observations.

### Formula

`Moving Average Forecast = (Demandₜ + Demandₜ₋₁ + ... + Demandₜ₋ₙ₊₁) ÷ n`

Where:

* `Demandₜ` = most recent observed demand
* `n` = number of periods included in the average

For example, using a 3-period moving average:

`Forecast = (Demand₁ + Demand₂ + Demand₃) ÷ 3`

A moving average is useful as a simple baseline when demand is relatively stable.

## 2. Weighted Moving Average

A weighted moving average gives greater importance to more recent observations.

### Formula

`Forecast = (w₁ × Demandₜ) + (w₂ × Demandₜ₋₁) + ... + (wₙ × Demandₜ₋ₙ₊₁)`

Where:

* `w` = weight assigned to each observation
* The weights should sum to `1`

For example:

`Forecast = (0.5 × Most Recent Demand) + (0.3 × Previous Demand) + (0.2 × Earlier Demand)`

This approach can respond more quickly to recent changes in booking demand.

## 3. Exponential Smoothing

Exponential smoothing gives greater weight to recent observations while still incorporating previous forecasts.

### Formula

`Fₜ₊₁ = αAₜ + (1 − α)Fₜ`

Where:

* `Fₜ₊₁` = forecast for the next period
* `Aₜ` = actual demand in the current period
* `Fₜ` = previous forecast
* `α` = smoothing parameter between `0` and `1`

A higher `α` makes the forecast respond more strongly to recent changes, while a lower `α` produces a smoother forecast.

## 4. Regression-Based Forecasting

Regression can be used to estimate how demand changes in relation to one or more business variables.

### Simple Linear Regression

`Ŷ = β₀ + β₁X`

Where:

* `Ŷ` = predicted demand
* `β₀` = intercept
* `β₁` = estimated relationship between the predictor and demand
* `X` = predictor variable

For example:

`Predicted Bookings = β₀ + β₁ × Price`

### Multiple Regression

A more realistic revenue-management model could include several variables:

`Demand = β₀ + β₁Price + β₂Branch + β₃Vehicle Category + β₄Lead Time + β₅Day Type + β₆Seasonality + β₇Availability`

This approach allows multiple factors to be considered simultaneously rather than attributing changes in demand to price alone.

Regression results would identify statistical relationships and predictive patterns. They would not automatically prove that a price change caused a change in demand.

## 5. Revenue Forecasting

Once future booking demand has been forecast, expected revenue can be estimated.

### Formula

`Forecast Revenue = Forecast Bookings × Forecast Average Rental Days × Forecast Daily Rate`

Alternatively, where rental-day demand is forecast directly:

`Forecast Revenue = Forecast Rental Days × Forecast Revenue per Rental Day`

This connects demand forecasting with revenue-management decisions.

## 6. Forecast Accuracy

Forecasts should be compared with actual results to determine how well the model performs.

### Mean Absolute Error (MAE)

`MAE = Σ|Actual − Forecast| ÷ n`

MAE measures the average absolute difference between the forecast and actual result.

### Mean Absolute Percentage Error (MAPE)

`MAPE = (100 ÷ n) × Σ(|Actual − Forecast| ÷ |Actual|)`

MAPE expresses forecast error as a percentage.

Lower MAE and MAPE values indicate better forecast accuracy.

## Forecasting Application

With sufficient historical data, these methods could be used to forecast demand by:

* Branch
* Vehicle category
* Pickup date
* Rental duration
* Booking lead time

The forecasts could then support decisions such as:

* Increasing prices during periods of strong forecast demand
* Reducing prices when forecast demand is weak
* Protecting fleet capacity for high-demand periods
* Adjusting vehicle-category pricing
* Moving fleet between branches
* Planning promotional strategies

The current project does not claim to have produced a reliable forecast because the dataset contains only one month of observations. With a larger historical dataset, different forecasting methods could be tested and compared using out-of-sample forecast accuracy.


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

