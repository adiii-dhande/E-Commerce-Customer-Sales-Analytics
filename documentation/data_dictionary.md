# Data Dictionary

**Note:** This dataset is synthetic (generated with seed 42). It is not real customer data.

Cleaned file: `transactions_clean.csv` (1,000,000 rows x 21 columns)

| Column | Meaning | Type |
|---|---|---|
| TransactionID | Unique ID per transaction line | Text |
| InvoiceNo | Order number, C prefix = cancelled | Text |
| StockCode | Product ID | Text |
| Description | Product name | Text |
| Quantity | Units in the line | Integer |
| InvoiceDate | Date and time (yyyy-mm-dd hh:mm:ss) | Datetime |
| UnitPrice | Price per unit (USD) | Decimal |
| CustomerID | Customer ID | Text |
| CustomerName | Customer name | Text |
| Country | Customer country | Text |
| OrderStatus | Completed, Cancelled or Returned | Text |
| IsMissingCustomer | 1 if the customer was missing in the raw data | Flag (0/1) |
| IsZeroPrice | 1 if UnitPrice was 0 | Flag (0/1) |
| IsPriceOutlier | 1 if UnitPrice was flagged as an outlier | Flag (0/1) |
| IsNegativeQty | 1 if Quantity was negative | Flag (0/1) |
| Revenue | Line revenue (Quantity x UnitPrice) | Decimal |
| InvoiceYear | Year of InvoiceDate | Integer |
| InvoiceMonth | Month number of InvoiceDate (1-12) | Integer |
| InvoiceMonthName | Month name of InvoiceDate | Text |
| IsCancelled | 1 if the line is a cancelled order | Flag (0/1) |
| IsReturned | 1 if the line is a returned order | Flag (0/1) |