# E-Commerce Customer & Sales Analytics

## Overview
End-to-end analytics project on e-commerce transaction data — cleaning, SQL analysis, and an interactive Power BI dashboard covering customer behavior, product performance, revenue trends, and country-level sales patterns.

## Business Problem
The business needs visibility into which products and countries drive revenue, whether customers are repeat buyers, and how much revenue is lost to cancellations — to support merchandising, retention, and ops decisions.

## Objectives
- Clean and validate raw transaction data (missing values, duplicates, cancellations)
- Answer key business questions using SQL
- Build a reusable Power BI data model with DAX measures
- Deliver a multi-page interactive dashboard
- Reconcile totals across Python, SQL, and Power BI

## Dataset
Fictional practice dataset: `sample_ecommerce_transactions.csv` — 128 transaction-line records, Jan–Oct 2025. Columns: TransactionID, InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, CustomerName, Country, OrderStatus. Full column dictionary in [`documentation/data_dictionary.md`](documentation/data_dictionary.md).

Note: synthetic data created for learning purposes, not real customer data.

## Tools Used
- **MySQL** — data storage and SQL analysis
- **Python (Pandas)** — data cleaning
- **Excel / Power Query** — inspection and transformation
- **Power BI + DAX** — data modeling and dashboard
- **Git/GitHub** — version control and portfolio

## Data Cleaning Process
See [`documentation/cleaning_log.md`](documentation/cleaning_log.md) for all cleaning decisions (duplicates, missing values, cancellations, country name standardization) and the reasoning behind each.

## SQL Analysis
Queries covering revenue, orders, customers, repeat-purchase rate, and cancellations are in [`sql/`](sql/).

## Power BI Dashboard
4 pages: Executive Summary, Product Performance, Customer Analysis, Sales & Country Analysis. Screenshots in [`screenshots/`](screenshots/), `.pbix` file in [`power_bi/`](power_bi/).

## Key KPIs
- Total / Net Revenue
- Total Orders & Unique Customers
- Cancellation Rate
- Average Order Value
- Repeat Customer Rate

## Key Insights
*(To be filled in after analysis is complete)*

## Recommendations
*(To be filled in after analysis is complete)*

## Data Limitations
- Synthetic sample dataset (128 rows) — not production scale
- Single currency assumption (USD)
- Cancellation/return logic based on documented assumptions, not real business rules

## Project Structure
```
Ecommerce-Customer-Sales-Analytics/
├── data/
│   ├── raw/          # original, untouched source file
│   ├── cleaned/       # cleaned output
│   └── exports/       # CSVs exported from SQL queries
├── python/            # cleaning scripts
├── sql/               # analysis queries
├── power_query/        # Power Query M notes
├── power_bi/           # .pbix dashboard file
├── screenshots/        # dashboard screenshots
├── documentation/       # data dictionary, business questions, cleaning log
└── README.md
```

## How to Reproduce
1. Clone this repo
2. Load `data/raw/sample_ecommerce_transactions.csv` into Python and run scripts in `python/`
3. Load cleaned data into MySQL using scripts in `sql/`
4. Run analysis queries in `sql/`
5. Open `power_bi/ecommerce_analytics.pbix` in Power BI Desktop

## Dashboard Screenshots
*(Add screenshots here once the dashboard is built)*

## Author
Aditya — [LinkedIn] · [Portfolio]
