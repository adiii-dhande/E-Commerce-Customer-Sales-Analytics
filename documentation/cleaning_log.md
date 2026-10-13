# Cleaning Log

Script: `python/01_clean_data.py`
Raw file: `data/raw/sample_ecommerce_transactions.csv` (128 rows, 11 columns)
Cleaned file: `data/cleaned/cleaned_ecommerce_transactions.csv` (127 rows, 21 columns)

| # | Issue | Rows | Decision | Business impact |
|---|-------|------|----------|-----------------|
| 1 | Duplicate (all columns except TransactionID) | T00011, T99999 | Removed T99999, kept T00011 | Same order was counted twice |
| 2 | Missing CustomerID and CustomerName | T00015 | Filled with "Unknown", flagged IsMissingCustomer | Sale is kept, but customer counts exclude it |
| 3 | Missing Description and Country | T10000 | Filled with "Unknown" | Sale is kept, country reports show Unknown |
| 4 | Dirty Country values (' united kingdom ', 'USA', 'India ') | 3 | Trimmed, title-cased, USA changed to United States | One value per country |
| 5 | Extra spaces in Description | T00048 | Trimmed and collapsed spaces | Consistent product names |
| 6 | Zero UnitPrice | T00066 | Kept, flagged IsZeroPrice | Adds 0 revenue, needs business check |
| 7 | Negative Quantity, Returned | T00074 | Kept, flagged IsNegativeQty | Real return, reduces revenue |
| 8 | Price outlier 999.99 | T00103 | Kept, flagged IsPriceOutlier | Inflates revenue if wrong, investigate |
| 9 | Cancelled invoices (C prefix) | 12 rows, 4 invoices | Kept, flagged IsCancelled | Matches OrderStatus = Cancelled (12 = 12) |
| 10 | InvoiceDate is text in dd-mm-yyyy hh:mm | all rows | Converted to datetime with explicit format | Prevents day and month swap |

## New columns added
Revenue, InvoiceYear, InvoiceMonth, InvoiceMonthName, IsCancelled, IsReturned, IsMissingCustomer, IsZeroPrice, IsPriceOutlier, IsNegativeQty

## Checks
- Cancelled lines: 12
- Returned lines: 1
- Gross revenue (Python): 10804.5 (to match in SQL and Power BI)