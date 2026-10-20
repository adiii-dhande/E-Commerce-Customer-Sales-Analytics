## Excel inspection: transactions_raw.csv (1M dataset)

- Rows: 1,003,000 (+ header)
- Columns: TransactionID, InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, CustomerName, Country, OrderStatus

### Issues found
- Duplicate rows (same TransactionID): ~3,000
- Missing CustomerID / CustomerName: ~2% of rows
- Missing Description: ~1% of rows
- Missing Country: ~0.5% of rows
- Inconsistent Country text: uppercase (INDIA) and trailing spaces ('India ')
- UnitPrice = 0: ~0.5% of rows
- UnitPrice outliers (999.99): ~0.2% of rows
- Negative Quantity (returns): ~1.5% of rows
- InvoiceNo starting with 'C' (cancelled orders): ~4% of orders

### Decision
No changes made in Excel. All cleaning is done in Python (Phase 3).