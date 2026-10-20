PHASE 4 - LOAD DATA INTO MYSQL
4.0 Create database + table
CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

DROP TABLE IF EXISTS transactions_clean;

CREATE TABLE transactions_clean (
  TransactionID VARCHAR(20) NOT NULL PRIMARY KEY,
  InvoiceNo VARCHAR(20) NOT NULL,
  StockCode VARCHAR(20),
  Description VARCHAR(100),
  Quantity INT,
  InvoiceDate DATETIME,
  UnitPrice DECIMAL(10,2),
  CustomerID VARCHAR(20),
  CustomerName VARCHAR(100),
  Country VARCHAR(50),
  OrderStatus VARCHAR(20),
  IsMissingCustomer TINYINT(1),
  IsZeroPrice TINYINT(1),
  IsPriceOutlier TINYINT(1),
  IsNegativeQty TINYINT(1),
  Revenue DECIMAL(12,2),
  InvoiceYear INT,
  InvoiceMonth INT,
  InvoiceMonthName VARCHAR(20),
  IsCancelled TINYINT(1),
  IsReturned TINYINT(1)
);

USE ecommerce_analytics;
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/adity/Documents/Ecommerce-Customer-Sales-Analytics/data/cleaned/transactions_clean.csv'
INTO TABLE transactions_clean
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_rows, ROUND(SUM(Revenue), 2) AS gross_revenue
FROM transactions_clean;

============ PHASE 4: INDEXES (skip if you already ran them) ============
USE ecommerce_analytics;

CREATE INDEX idx_invoice_no   ON transactions_clean (InvoiceNo);
CREATE INDEX idx_customer_id  ON transactions_clean (CustomerID);
CREATE INDEX idx_invoice_date ON transactions_clean (InvoiceDate);
CREATE INDEX idx_country      ON transactions_clean (Country);

4.3 check indexes
SHOW INDEX FROM transactions_clean;

============ PHASE 5: ANALYSIS ============
5.1 KPI summary
SELECT
    ROUND(SUM(Revenue), 2) AS gross_revenue,
    ROUND(SUM(CASE WHEN OrderStatus = 'Completed' THEN Revenue END), 2) AS net_revenue,
    COUNT(DISTINCT CASE WHEN OrderStatus = 'Completed' THEN InvoiceNo END) AS valid_orders,
    COUNT(DISTINCT CASE WHEN CustomerID <> 'Unknown' THEN CustomerID END) AS unique_customers,
    COUNT(DISTINCT CASE WHEN IsCancelled = 1 THEN InvoiceNo END) AS cancelled_orders
FROM transactions_clean;

5.2 net revenue by month
SELECT InvoiceYear, InvoiceMonth, InvoiceMonthName,
       ROUND(SUM(Revenue), 2) AS net_revenue
FROM transactions_clean
WHERE OrderStatus = 'Completed'
GROUP BY InvoiceYear, InvoiceMonth, InvoiceMonthName
ORDER BY InvoiceYear, InvoiceMonth;

5.3 net revenue by countryPRIMARY
USE ecommerce_analytics;

SELECT Country, ROUND(SUM(Revenue), 2) AS net_revenue
FROM transactions_clean
WHERE OrderStatus = 'Completed'
GROUP BY Country
ORDER BY net_revenue DESC;

5.4 top 5 products
SELECT StockCode, Description, ROUND(SUM(Revenue), 2) AS net_revenue
FROM transactions_clean
WHERE OrderStatus = 'Completed'
GROUP BY StockCode, Description
ORDER BY net_revenue DESC
LIMIT 5;

============ PHASE 7: VALIDATION ============
7.1 cross-check with Python
SELECT
    COUNT(*)               AS total_rows,
    ROUND(SUM(Revenue), 2) AS gross_revenue,
    SUM(IsMissingCustomer) AS missing_customers,
    SUM(IsCancelled)       AS cancelled_lines,
    SUM(IsReturned)        AS returned_lines,
    SUM(IsZeroPrice)       AS zero_price_rows,
    SUM(IsPriceOutlier)    AS price_outlier_rows
FROM transactions_clean;