# Cleaning Log

| # | Issue | Rows | Decision | Business impact |
|---|---|---|---|---|
| 1 | Duplicate (all columns except TransactionID) | T00011, T99999 | TBD | TBD |
| 2 | Missing CustomerID and CustomerName | T00015 | TBD | TBD |
| 3 | Missing Description and Country | T10000 | TBD | TBD |
| 4 | Dirty Country values | ' united kingdom ', 'USA', 'India ' | TBD | TBD |
| 5 | Extra spaces in Description | T00048 | TBD | TBD |
| 6 | Zero UnitPrice | T00066 | TBD | TBD |
| 7 | Negative Quantity, Returned | T00074 | TBD | TBD |
| 8 | Price outlier 999.99 | T00103 | TBD | TBD |
| 9 | Cancelled invoices (C prefix) | 12 rows, 4 invoices | TBD | TBD |
| 10 | InvoiceDate is text in dd-mm-yyyy hh:mm | all rows | Parse with explicit format | Wrong format would swap day and month |