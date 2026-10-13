# E-Commerce Customer & Sales Analytics

Analysis of fictional e-commerce transactions (Jan to Oct 2025) using Python, MySQL, Power BI and DAX.

> Dataset is fictional practice data, not real customers.

## Business Questions
1. How much revenue did the business make, and how does it change month by month?
2. Which products and countries bring the most revenue?
3. Who are our top customers, and how many are repeat customers?
4. How many orders were cancelled or returned, and how much money is lost?

## KPI Definitions
| KPI | Definition |
|---|---|
| Gross revenue | Sum of Quantity x UnitPrice before removing cancelled or returned lines |
| Net revenue | Revenue from completed orders only |
| Total orders | Distinct InvoiceNo among completed orders |
| Unique customers | Distinct non-blank CustomerID |
| Cancelled orders | Distinct invoices where OrderStatus = Cancelled |
| Repeat customer | Customer with 2 or more distinct completed invoices |
| Average order value | Net revenue / total completed orders |

## Assumptions
- Currency is USD.
- Cancelled and returned lines are excluded from net revenue.
- Rows with missing CustomerID are kept for revenue but excluded from customer counts.

## Status
- [x] Phase 0: Setup
- [x] Phase 1: Business problem
- [ ] Phase 2: Excel inspection
- [ ] Phase 3: Python cleaning
- [ ] Phase 4: MySQL load
- [ ] Phase 5: SQL analysis
- [ ] Phase 6: Power BI model, DAX, dashboard
- [ ] Phase 7: Validation
- [ ] Phase 8: Insights and final README

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

## Limitations

- The data is fictional and has only 128 transaction lines, so findings are for practice and not real business conclusions.
- It covers only January to October 2025, so there is no full-year or year-on-year view.
- There is no cost data, so we can measure revenue but not profit.
- Some rows have no CustomerID, so customer counts exclude them.
- All values are assumed to be in USD.