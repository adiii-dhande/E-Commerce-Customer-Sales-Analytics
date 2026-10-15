# E-Commerce Customer & Sales Analytics

Analysis of fictional e-commerce transactions (Jan to Oct 2025) using Python, MySQL, Power BI and DAX.

> Dataset is fictional practice data, not real customers.

## Dashboard Preview

![Dashboard](ecom_dashboard_final.png)

## Project Background

This project analyzes a fictional online store's transaction data from January to October 2025. The dataset has 128 transaction lines covering customers, products, countries, quantities, prices and order status (completed, cancelled or returned). All values are in USD. The data is fictional and was created for learning.

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
2. How does net revenue change month by month from January to October 2025?

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
| Data cleaning | Python (Pandas, NumPy) in PyCharm |
| Storage and analysis | MySQL Server and Workbench |
| Dashboard | Power BI Desktop |
| Measures | DAX (KPIs and month-over-month trend measures) |
| Version control | Git and GitHub |

## Dashboard Features

- KPI cards for Net Revenue, Total Orders, Unique Customers and Average Order Value, each with a sparkline and a month-over-month badge.
- Country tile slicer that filters the whole page.
- Sales by Country table with net revenue, total orders and cancelled orders.
- Top 5 and Bottom 5 products by net revenue.
- Net revenue by country donut, total orders by order status donut and a country map.

## Key Findings

- Net revenue is **$9,854.73** from **39 orders** and **13 unique customers**, with an average order value of **$252.69**.
- **India** leads revenue at $2,896.45 (about 29% of total), followed by the **United States** at $1,560.34. Together they make up about 45% of revenue.
- The top 3 products (**Mechanical Keyboard**, **Desk Lamp** and **Webcam HD**) bring in about **53%** of net revenue.
- **4 orders** were cancelled.
- Latest month vs previous month: revenue **+5.63%**, orders **+33.33%**, unique customers **-25.00%**, average order value **-20.77%**. More, smaller orders came from fewer customers.

## Recommendations

1. **Focus stock and promotion on the top 3 products**, since they carry over half of net revenue.
2. **Invest in India and the United States first**, and test small campaigns in France and Singapore.
3. **Investigate cancellations** by product and country before they grow.
4. **Run a repeat-customer offer**, because customer count fell while order count rose.
5. **Bundle low-value orders** (for example accessories with a main product) to lift average order value.

## Assumptions

- Currency is USD.
- Cancelled and returned lines are excluded from net revenue.
- Rows with missing CustomerID are kept for revenue but excluded from customer counts.

## Limitations

- The data is fictional and has only 128 transaction lines, so findings are for practice and not real business conclusions.
- It covers only January to October 2025, so there is no full-year or year-on-year view.
- There is no cost data, so we can measure revenue but not profit.
- Some rows have no CustomerID, so customer counts exclude them.
- All values are assumed to be in USD.
- Month-over-month figures compare only the latest two months, so small counts can swing the percentages a lot.

## Project Files

| File | Description |
|---|---|
| `ecommerce_dashboard.pbix` | Power BI dashboard |
| `power_query.m` | Power Query steps used in the model |
| `measures.dax` | DAX measures (KPIs and MoM trends) |
| `ecom_dashboard_final.png` | Dashboard screenshot |

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
