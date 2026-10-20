## Cleaning log: transactions_raw.csv (1M dataset)

Script: `python/01_clean_data.py`

### Problems found (raw data)
- Duplicate TransactionIDs: 3,000
- Missing Description: 10,151
- Missing CustomerID / CustomerName: 20,176 each
- Missing Country: 5,034
- Country text inconsistent (UPPERCASE, trailing spaces)
- Zero or negative price, price outliers (999.99), negative quantity (returns)

### Cleaning steps
1. Stripped and title-cased Country (INDIA / 'India ' -> India)
2. Trimmed extra spaces in Description
3. Removed duplicate rows (same TransactionID)
4. Converted InvoiceDate to datetime
5. Filled missing Description, CustomerID, CustomerName, Country with 'Unknown'
6. Added flags: IsMissingCustomer, IsZeroPrice, IsPriceOutlier, IsNegativeQty (0/1)
7. Added Revenue, InvoiceYear, InvoiceMonth, InvoiceMonthName, IsCancelled, IsReturned

### Result
| Metric | Value |
|---|---|
| Raw rows, columns | 1,003,000 x 11 |
| Cleaned rows, columns | 1,000,000 x 21 |
| Rows removed | 3,000 |
| Missing values left | 0 |
| Missing customers (flagged) | 20,107 |
| Cancelled lines | 40,118 |
| Returned lines | 14,350 |
| Zero price rows | 4,845 |
| Price outlier rows | 1,898 |
| Gross revenue | 81,562,430.20 |

Output: `data/cleaned/transactions_clean.csv` (not committed, over 100 MB) and `sample_transactions.csv` (first 1,000 rows).