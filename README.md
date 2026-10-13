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