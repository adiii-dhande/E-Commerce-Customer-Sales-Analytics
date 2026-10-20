# E-Commerce Customer & Sales Analytics

End-to-end analysis of 1,000,000 synthetic e-commerce transaction lines (2023 to 2025) using Python, MySQL, Power BI and DAX.

> **Dataset is SYNTHETIC.** It was generated with Python (seed 42) for practice. It is not real customer data.

## Dashboard Preview

![Dashboard](ecom_dashboard_final.png)

## Project Background

This project analyzes a synthetic online store's transaction data from 2023 to 2025. The raw file has 1,003,000 transaction lines. After cleaning, 1,000,000 lines remain across 21 columns, covering customers, products, countries, quantities, prices and order status (completed, cancelled or returned). All values are in USD.

## Dataset

| Item | Value |
|---|---|
| Raw rows | 1,003,000 |
| Cleaned rows | 1,000,000 x 21 columns |
| Missing customers | 20,107 |
| Cancelled lines | 40,118 |
| Returned lines | 14,350 |
| Zero-price rows | 4,845 |
| Price-outlier rows | 1,898 |
| Gross revenue | 81,562,430.20 |

The full CSVs are over 100 MB, which is GitHub's file limit, so they are not in this repo. `data/cleaned/sample_transactions.csv` has 1,000 sample rows. The full dataset can be recreated with the generator script in `python/` (seed 42).

## Business Problem

The store has transaction records but no clear view of what they say. Management cannot easily answer which products and countries drive revenue, which customers come back, how revenue changes month to month, or how many orders are cancelled or returned. Without this, decisions about stock, marketing and customer retention are based on guesswork.

## Project Objectives

1. Clean and prepare the raw transaction data so it is accurate and consistent.
2. Measure revenue, orders, customers and cancellations using clearly documented definitions.
3. Identify top products, top countries and monthly revenue trends.
4. Understand repeat-purchase behavior and cancelled or returned orders.
5. Build an interactive Power BI dashboard with DAX KPIs.
6. Give clear, evidence-based recommendations to the business.

## Stakeholders

| Stakeholder | What they need |
|---|---|
| Sales manager | Revenue trends, top products and top countries |
| Marketing team | Which customers repeat, and where to target campaigns |
| Operations team | Why orders are cancelled or returned |
| Executive team | A simple dashboard with the main KPIs |

## Business Questions

**Revenue**
1. What is the total gross revenue and net revenue?
2. How does net revenue change month by month from 2023 to 2025?

**Products**
3. Which products generate the most revenue?
4. Which products sell the highest quantity?

**Countries**
5. Which countries generate the most revenue?

**Customers**
6. How many unique customers are there?
7. Which customers buy more than once (repeat customers)?
8. Who are the top customers by revenue?

**Cancellations and returns**
9. How many orders are cancelled or returned, and how much revenue do they represent?
10. Do cancellations and returns cluster around certain products or countries?

## KPI Definitions

| KPI | Definition |
|---|---|
| Gross revenue | Sum of Quantity x UnitPrice before removing cancelled or returned lines |
| Net revenue | Revenue from completed orders only |
| Total orders | Distinct InvoiceNo among completed orders |
| Unique customers | Distinct non-blank CustomerID |
| Cancelled orders | Distinct invoices where OrderStatus = Cancelled or InvoiceNo starts with C |
| Repeat customer | Customer with 2 or more distinct completed invoices |
| Average order value | Net revenue / total completed orders |
| Revenue / Orders / Customers / AOV MoM | Latest month vs previous month, shown as a trend badge on each KPI card |

## Tools and Techniques

| Area | Details |
|---|---|
| Data generation and cleaning | Python (Pandas, NumPy) in PyCharm |
| Storage and analysis | MySQL Server 8.0 and Workbench (`LOAD DATA INFILE`, indexes, aggregate queries) |
| Dashboard | Power BI Desktop (data loaded from the cleaned CSV) |
| Measures | DAX (KPIs and month-over-month trend measures) |
| Version control | Git and GitHub |

## Workflow

1. **Excel inspection:** checked the raw file structure and data quality issues.
2. **Python cleaning:** removed invalid rows (1,003,000 raw to 1,000,000 clean), added 10 flag and date columns.
3. **MySQL load:** loaded the cleaned file into `ecommerce_analytics.transactions_clean` and added indexes.
4. **SQL analysis:** KPIs, monthly net revenue, net revenue by country and top 5 products.
5. **Power BI dashboard:** KPI cards, country slicer, tables and charts built with DAX.
6. **Validation:** compared key numbers across Python, MySQL and Power BI.

## Validation

Key numbers were checked across all three tools.

| Check | Python | MySQL | Power BI |
|---|---|---|---|
| Row count | 1,000,000 | 1,000,000 | [FILL: Power BI row count] |
| Gross revenue | 81,562,430.20 | 81,562,430.20 | [FILL: Power BI gross revenue] |
| Missing customers | 20,107 | 20,107 | n/a |
| Cancelled lines | 40,118 | 40,118 | n/a |
| Returned lines | 14,350 | 14,350 | n/a |
| Zero-price rows | 4,845 | 4,845 | n/a |
| Price-outlier rows | 1,898 | 1,898 | n/a |

## Dashboard Features

- KPI cards for Net Revenue, Total Orders, Unique Customers and Average Order Value, each with a sparkline and a month-over-month badge.
- Country tile slicer that filters the whole page.
- Date slicer for 2023 to 2025.
- Sales by Country table with net revenue, total orders and cancelled orders.
- Top 5 and Bottom 5 products by net revenue.
- Net revenue by country donut, total orders by order status donut and a country map.

## Key Findings

- Gross revenue is **81,562,430.20** across 1,000,000 cleaned lines.
- Net revenue (completed orders only) is **[FILL: net revenue]** from **[FILL: total orders]** orders and **[FILL: unique customers]** unique customers, with an average order value of **[FILL: AOV]**.
- **40,118** lines were cancelled and **14,350** were returned.
- **20,107** lines have no customer ID, so they count toward revenue but not toward customer counts.
- Top country, top products and the latest month-over-month change are shown on the dashboard.

## Recommendations

1. **Focus stock and promotion on the top 5 products**, since they carry a large share of net revenue.
2. **Invest in the top-revenue countries first**, and test small campaigns in the next tier.
3. **Investigate cancellations** (40,118 lines) by product and country before they grow.
4. **Fix customer data capture**, because 20,107 lines have no customer ID and cannot be used for repeat-customer analysis.
5. **Run a repeat-customer offer** to lift orders per customer.
6. **Bundle low-value orders** (for example accessories with a main product) to lift average order value.

## Assumptions

- Currency is USD.
- Cancelled and returned lines are excluded from net revenue.
- Rows with missing CustomerID are kept for revenue but excluded from customer counts.

## Limitations

- The data is synthetic, so findings are for practice and not real business conclusions.
- There is no cost data, so we can measure revenue but not profit.
- 20,107 rows have no CustomerID, so customer counts exclude them.
- All values are assumed to be in USD.
- Month-over-month figures compare only the latest two months.
- MySQL Workbench timed out (30 sec read limit) on the net revenue by country query, so the country view is built in Power BI. The query is still in the SQL file.

## Project Files

| File | Description |
|---|---|
| `python/generate_dataset.py` | Generates the synthetic dataset (seed 42) |
| `python/01_clean_data.py` | Cleans the raw data and adds flag columns |
| `SQL/ecommerce_analysis.sql` | Table creation, load, indexes and analysis queries |
| `power_bi/ecommerce_dashboard.pbix` | Power BI dashboard |
| `power_bi/measures.dax` | DAX measures (KPIs and MoM trends) |
| `power_query/` | Power Query steps used in the model |
| `data/cleaned/sample_transactions.csv` | 1,000-row sample of the cleaned data |
| `documentation/cleaning_log.md` | Cleaning steps and row counts |
| `documentation/data_dictionary.md` | Column definitions |
| `documentation/excel_inspection_notes.md` | Notes from the Excel inspection |
| `screenshots/` | Screenshots of each phase |
| `ecom_dashboard_final.png` | Dashboard screenshot |

## How to Reproduce

1. Run the generator script in `python/` to create the raw file (seed 42).
2. Run `python/01_clean_data.py` to create `transactions_clean.csv`.
3. Load it into MySQL with the script in `SQL/ecommerce_analysis.sql`.
4. Open the Power BI file and point the source to `transactions_clean.csv`.

The raw and cleaned CSVs are not in the repo because they are over 100 MB.

## Status

- [x] Phase 0: Setup
- [x] Phase 1: Business problem
- [x] Phase 2: Excel inspection
- [x] Phase 3: Python cleaning
- [x] Phase 4: MySQL load
- [x] Phase 5: SQL analysis
- [x] Phase 6: Power BI model, DAX, dashboard
- [x] Phase 7: Validation
- [x] Phase 8: Insights and final README

## Author

**Aditya Dhande** | [GitHub](https://github.com/adiii-dhande)