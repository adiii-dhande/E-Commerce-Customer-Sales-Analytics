# Excel Inspection Notes

File inspected: a working copy of sample_ecommerce_transactions (the raw CSV in data/raw was not touched).

## Size

- 128 data rows and 11 columns.

## Issues found (not fixed yet, cleaning happens in Python)

| # | Issue | Where | Planned decision |
|---|---|---|---|
| 1 | Missing CustomerID and CustomerName | T00015 | Keep the row for revenue, exclude from customer counts |
| 2 | Missing Description | 1 row | Fill with "Unknown" or look up by StockCode |
| 3 | Missing Country | 1 row | Fill with "Unknown" |
| 4 | Country written as USA | T00082 | Change to United States |
| 5 | Country has mixed capital letters and extra spaces | a few rows | Trim spaces and standardize the names |
| 6 | Negative Quantity (-2) with status Returned | T00074 | Keep, mark as returned, exclude from net revenue |
| 7 | Zero UnitPrice ($0.00) | T00066 | Investigate, then decide whether to keep |
| 8 | Very high UnitPrice ($999.99) | T00103 | Investigate as an outlier |
| 9 | Cancelled orders, InvoiceNo starts with C | 12 rows | Keep, flag as cancelled, exclude from net revenue |

## Checks still to do in Python

- Exact duplicate rows
- Extra spaces inside Description
- Date format of InvoiceDate