-- ============================================================
-- E-Commerce Customer & Sales Analytics — SQL Analysis
-- Table: transactions
-- Columns: TransactionID, InvoiceNo, StockCode, Description,
--          Quantity, InvoiceDate, UnitPrice, CustomerID,
--          CustomerName, Country, OrderStatus
-- Revenue = Quantity * UnitPrice (computed on the fly)
-- ============================================================


-- ============================================================
-- SETUP: Create database and table, import data
-- ============================================================

CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE transactions (
    TransactionID   VARCHAR(10)     PRIMARY KEY,
    InvoiceNo       VARCHAR(10),
    StockCode       VARCHAR(10),
    Description     VARCHAR(100),
    Quantity        INT,
    InvoiceDate     DATETIME,
    UnitPrice       DECIMAL(10,2),
    CustomerID      VARCHAR(10),
    CustomerName    VARCHAR(100),
    Country         VARCHAR(50),
    OrderStatus     VARCHAR(20)
);

-- Import via MySQL Workbench Table Data Import Wizard,
-- or: LOAD DATA INFILE 'path/sample_ecommerce_transactions.csv'
-- INTO TABLE transactions
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;


-- ============================================================
-- 1. DATA QUALITY CHECKS (run before analysis)
-- ============================================================

-- Total rows
SELECT COUNT(*) AS total_rows FROM transactions;

-- Exact duplicate rows
SELECT TransactionID, COUNT(*) AS cnt
FROM transactions
GROUP BY TransactionID
HAVING COUNT(*) > 1;

-- Missing values per key column
SELECT
    SUM(CASE WHEN CustomerID IS NULL OR CustomerID = '' THEN 1 ELSE 0 END) AS missing_customer,
    SUM(CASE WHEN Country IS NULL OR Country = '' THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN Description IS NULL OR Description = '' THEN 1 ELSE 0 END) AS missing_description
FROM transactions;

-- Invalid values: zero price, negative quantity
SELECT * FROM transactions WHERE UnitPrice <= 0;
SELECT * FROM transactions WHERE Quantity < 0;

-- Distinct OrderStatus values
SELECT DISTINCT OrderStatus FROM transactions;


-- ============================================================
-- 2. REVENUE QUESTIONS
-- ============================================================

-- Q1a: Gross revenue (all rows)
SELECT ROUND(SUM(Quantity * UnitPrice), 2) AS gross_revenue
FROM transactions;

-- Q1b: Net revenue (Completed orders only — excludes Cancelled/Returned)
SELECT ROUND(SUM(Quantity * UnitPrice), 2) AS net_revenue
FROM transactions
WHERE OrderStatus = 'Completed';

-- Q8: Average order value (net revenue / valid completed orders)
SELECT ROUND(
    SUM(CASE WHEN OrderStatus = 'Completed' THEN Quantity * UnitPrice ELSE 0 END)
    / COUNT(DISTINCT CASE WHEN OrderStatus = 'Completed' THEN InvoiceNo END), 2
) AS avg_order_value
FROM transactions;

-- Q9a: Revenue by month
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS year_month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM transactions
WHERE OrderStatus = 'Completed'
GROUP BY year_month
ORDER BY year_month;

-- Q9b: Revenue by year
SELECT
    YEAR(InvoiceDate) AS year,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM transactions
WHERE OrderStatus = 'Completed'
GROUP BY year
ORDER BY year;


-- ============================================================
-- 3. CUSTOMER & ORDER COUNTS
-- ============================================================

-- Q2: Unique customers
SELECT COUNT(DISTINCT CustomerID) AS unique_customers
FROM transactions
WHERE CustomerID IS NOT NULL AND CustomerID <> '';

-- Q3: Unique orders (distinct invoices)
SELECT COUNT(DISTINCT InvoiceNo) AS unique_orders
FROM transactions;

-- Total valid (Completed) transactions
SELECT COUNT(*) AS valid_transactions
FROM transactions
WHERE OrderStatus = 'Completed';


-- ============================================================
-- 4. PRODUCT ANALYSIS
-- ============================================================

-- Q5: Quantity sold by product
SELECT
    StockCode,
    Description,
    SUM(Quantity) AS total_quantity
FROM transactions
WHERE OrderStatus = 'Completed'
GROUP BY StockCode, Description
ORDER BY total_quantity DESC;

-- Q4: Revenue by product
SELECT
    StockCode,
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM transactions
WHERE OrderStatus = 'Completed'
GROUP BY StockCode, Description
ORDER BY revenue DESC;

-- Top 5 products by revenue
SELECT
    StockCode,
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM transactions
WHERE OrderStatus = 'Completed'
GROUP BY StockCode, Description
ORDER BY revenue DESC
LIMIT 5;


-- ============================================================
-- 5. COUNTRY ANALYSIS
-- ============================================================

-- Q6: Revenue by country
SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM transactions
WHERE OrderStatus = 'Completed' AND Country IS NOT NULL AND Country <> ''
GROUP BY Country
ORDER BY revenue DESC;

-- Top countries by revenue (top 5)
SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM transactions
WHERE OrderStatus = 'Completed' AND Country IS NOT NULL AND Country <> ''
GROUP BY Country
ORDER BY revenue DESC
LIMIT 5;


-- ============================================================
-- 6. CUSTOMER RANKING & BEHAVIOR
-- ============================================================

-- Customers ranked by spending
SELECT
    CustomerID,
    CustomerName,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_spent
FROM transactions
WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID, CustomerName
ORDER BY total_spent DESC;

-- Customers ranked by number of orders
SELECT
    CustomerID,
    CustomerName,
    COUNT(DISTINCT InvoiceNo) AS num_orders
FROM transactions
WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID, CustomerName
ORDER BY num_orders DESC;

-- Q7: One-time vs repeat customers
SELECT
    CASE WHEN order_count = 1 THEN 'One-time' ELSE 'Repeat' END AS customer_type,
    COUNT(*) AS num_customers
FROM (
    SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS order_count
    FROM transactions
    WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
    GROUP BY CustomerID
) AS customer_orders
GROUP BY customer_type;

-- Repeat-purchase rate (%)
SELECT
    ROUND(
        SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS repeat_purchase_rate_pct
FROM (
    SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS order_count
    FROM transactions
    WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
    GROUP BY CustomerID
) AS customer_orders;

-- Customers with multiple orders (list)
SELECT CustomerID, CustomerName, COUNT(DISTINCT InvoiceNo) AS num_orders
FROM transactions
WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID, CustomerName
HAVING COUNT(DISTINCT InvoiceNo) >= 2
ORDER BY num_orders DESC;

-- First purchase date per customer
SELECT CustomerID, MIN(InvoiceDate) AS first_purchase_date
FROM transactions
WHERE CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID;

-- Latest purchase date per customer
SELECT CustomerID, MAX(InvoiceDate) AS last_purchase_date
FROM transactions
WHERE CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID;

-- Customer lifetime revenue
SELECT
    CustomerID,
    CustomerName,
    ROUND(SUM(Quantity * UnitPrice), 2) AS lifetime_revenue
FROM transactions
WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID, CustomerName
ORDER BY lifetime_revenue DESC;

-- Revenue contribution % per customer
SELECT
    CustomerID,
    CustomerName,
    ROUND(SUM(Quantity * UnitPrice), 2) AS customer_revenue,
    ROUND(
        SUM(Quantity * UnitPrice) * 100.0
        / (SELECT SUM(Quantity * UnitPrice) FROM transactions WHERE OrderStatus = 'Completed'), 2
    ) AS pct_of_total_revenue
FROM transactions
WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY CustomerID, CustomerName
ORDER BY customer_revenue DESC;


-- ============================================================
-- 7. CANCELLATION ANALYSIS
-- ============================================================

-- Q10: Total cancelled transactions (by status OR 'C' prefix invoice)
SELECT COUNT(*) AS cancelled_transactions
FROM transactions
WHERE OrderStatus = 'Cancelled' OR InvoiceNo LIKE 'C%';

-- Cancelled orders (distinct invoices)
SELECT COUNT(DISTINCT InvoiceNo) AS cancelled_orders
FROM transactions
WHERE OrderStatus = 'Cancelled' OR InvoiceNo LIKE 'C%';

-- Q11: Cancellation rate (% of orders)
SELECT
    ROUND(
        COUNT(DISTINCT CASE WHEN OrderStatus = 'Cancelled' OR InvoiceNo LIKE 'C%' THEN InvoiceNo END)
        * 100.0 / COUNT(DISTINCT InvoiceNo), 2
    ) AS cancellation_rate_pct
FROM transactions;

-- Cancellation rate by revenue (% of gross revenue lost to cancellations)
SELECT
    ROUND(
        SUM(CASE WHEN OrderStatus = 'Cancelled' THEN Quantity * UnitPrice ELSE 0 END)
        * 100.0 / SUM(Quantity * UnitPrice), 2
    ) AS cancelled_revenue_pct
FROM transactions;

-- Q12a: Cancellation rate by product
SELECT
    StockCode,
    Description,
    COUNT(*) AS total_lines,
    SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_lines,
    ROUND(SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM transactions
GROUP BY StockCode, Description
ORDER BY cancellation_rate_pct DESC;

-- Q12b: Cancellation rate by country
SELECT
    Country,
    COUNT(*) AS total_lines,
    SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_lines,
    ROUND(SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM transactions
WHERE Country IS NOT NULL AND Country <> ''
GROUP BY Country
ORDER BY cancellation_rate_pct DESC;


-- ============================================================
-- 8. TIME-BASED TRENDS
-- ============================================================

-- Monthly customer count (distinct active customers per month)
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS year_month,
    COUNT(DISTINCT CustomerID) AS active_customers
FROM transactions
WHERE OrderStatus = 'Completed' AND CustomerID IS NOT NULL AND CustomerID <> ''
GROUP BY year_month
ORDER BY year_month;

-- Monthly order count
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS year_month,
    COUNT(DISTINCT InvoiceNo) AS order_count
FROM transactions
WHERE OrderStatus = 'Completed'
GROUP BY year_month
ORDER BY year_month;
