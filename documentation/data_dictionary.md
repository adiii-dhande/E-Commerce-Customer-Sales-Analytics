# Data Dictionary

| Column | Meaning | Type |
|---|---|---|
| TransactionID | Unique ID per transaction line | Text |
| InvoiceNo | Order number, C prefix = cancelled | Text |
| StockCode | Product ID | Text |
| Description | Product name | Text |
| Quantity | Units in the line | Integer |
| InvoiceDate | Date and time (dd-mm-yyyy hh:mm) | Datetime |
| UnitPrice | Price per unit (USD) | Decimal |
| CustomerID | Customer ID | Text |
| CustomerName | Customer name | Text |
| Country | Customer country | Text |
| OrderStatus | Completed, Cancelled or Returned | Text |