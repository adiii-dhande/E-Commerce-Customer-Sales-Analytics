-- ============================================================
-- E-Commerce Customer & Sales Analytics | MySQL scripts
-- ============================================================


############################################################
-- PHASE 4 - LOAD DATA INTO MYSQL
############################################################

------------------------------------------------------------
-- 4.0  Create database + table + insert 127 rows
------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

DROP TABLE IF EXISTS transactions_clean;

CREATE TABLE transactions_clean (
  TransactionID     VARCHAR(20)   NOT NULL PRIMARY KEY,
  InvoiceNo         VARCHAR(20)   NOT NULL,
  StockCode         VARCHAR(20),
  Description       VARCHAR(100),
  Quantity          INT,
  InvoiceDate       DATETIME,
  UnitPrice         DECIMAL(10,2),
  CustomerID        VARCHAR(20),
  CustomerName      VARCHAR(100),
  Country           VARCHAR(50),
  OrderStatus       VARCHAR(20),
  IsMissingCustomer TINYINT(1),
  IsZeroPrice       TINYINT(1),
  IsPriceOutlier    TINYINT(1),
  IsNegativeQty     TINYINT(1),
  Revenue           DECIMAL(12,2),
  InvoiceYear       INT,
  InvoiceMonth      INT,
  InvoiceMonthName  VARCHAR(20),
  IsCancelled       TINYINT(1),
  IsReturned        TINYINT(1)
);


INSERT INTO transactions_clean (TransactionID, InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, CustomerName, Country, OrderStatus, IsMissingCustomer, IsZeroPrice, IsPriceOutlier, IsNegativeQty, Revenue, InvoiceYear, InvoiceMonth, InvoiceMonthName, IsCancelled, IsReturned) VALUES
('T00001', '50001', 'P1011', 'Monitor Arm', 1, '2025-01-03 09:15:00', 59.90, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 59.90, 2025, 1, 'January', 0, 0),
('T00002', '50001', 'P1002', 'Mechanical Keyboard', 2, '2025-01-03 09:15:00', 48.50, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 97.00, 2025, 1, 'January', 0, 0),
('T00003', '50002', 'P1001', 'Wireless Mouse', 2, '2025-01-11 10:15:00', 15.99, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 0, 0, 31.98, 2025, 1, 'January', 0, 0),
('T00004', '50002', 'P1005', 'Webcam HD', 3, '2025-01-11 10:15:00', 39.99, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 0, 0, 119.97, 2025, 1, 'January', 0, 0),
('T00005', '50002', 'P1004', 'Laptop Stand', 4, '2025-01-11 10:15:00', 29.95, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 0, 0, 119.80, 2025, 1, 'January', 0, 0),
('T00006', '50003', 'P1004', 'Laptop Stand', 3, '2025-01-19 11:15:00', 29.95, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 89.85, 2025, 1, 'January', 0, 0),
('T00007', '50003', 'P1003', 'USB-C Cable', 4, '2025-01-19 11:15:00', 8.99, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 35.96, 2025, 1, 'January', 0, 0),
('T00008', '50003', 'P1002', 'Mechanical Keyboard', 5, '2025-01-19 11:15:00', 48.50, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 242.50, 2025, 1, 'January', 0, 0),
('T00009', '50003', 'P1009', 'Phone Holder', 1, '2025-01-19 11:15:00', 10.99, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 10.99, 2025, 1, 'January', 0, 0),
('T00010', '50004', 'P1002', 'Mechanical Keyboard', 4, '2025-01-27 12:15:00', 48.50, 'C10010', 'Isabella Wong', 'Australia', 'Completed', 0, 0, 0, 0, 194.00, 2025, 1, 'January', 0, 0),
('T00011', '50004', 'P1010', 'Power Bank', 5, '2025-01-27 12:15:00', 25.00, 'C10010', 'Isabella Wong', 'Australia', 'Completed', 0, 0, 0, 0, 125.00, 2025, 1, 'January', 0, 0),
('T00012', '50005', 'P1007', 'Notebook Pack', 5, '2025-01-31 13:15:00', 12.50, 'C10013', 'Daniel Lee', 'Canada', 'Completed', 0, 0, 0, 0, 62.50, 2025, 1, 'January', 0, 0),
('T00013', '50005', 'P1001', 'Wireless Mouse', 1, '2025-01-31 13:15:00', 15.99, 'C10013', 'Daniel Lee', 'Canada', 'Completed', 0, 0, 0, 0, 15.99, 2025, 1, 'January', 0, 0),
('T00014', '50005', 'P1011', 'Monitor Arm', 2, '2025-01-31 13:15:00', 59.90, 'C10013', 'Daniel Lee', 'Canada', 'Completed', 0, 0, 0, 0, 119.80, 2025, 1, 'January', 0, 0),
('T00015', '50006', 'P1002', 'Mechanical Keyboard', 1, '2025-02-08 14:15:00', 48.50, 'Unknown', 'Unknown', 'United Kingdom', 'Completed', 1, 0, 0, 0, 48.50, 2025, 2, 'February', 0, 0),
('T00016', '50006', 'P1004', 'Laptop Stand', 2, '2025-02-08 14:15:00', 29.95, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 59.90, 2025, 2, 'February', 0, 0),
('T00017', '50006', 'P1011', 'Monitor Arm', 3, '2025-02-08 14:15:00', 59.90, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 179.70, 2025, 2, 'February', 0, 0),
('T00018', '50006', 'P1009', 'Phone Holder', 4, '2025-02-08 14:15:00', 10.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 43.96, 2025, 2, 'February', 0, 0),
('T00019', '50007', 'P1010', 'Power Bank', 2, '2025-02-16 15:15:00', 25.00, 'C10005', 'Noah Johnson', 'United States', 'Completed', 0, 0, 0, 0, 50.00, 2025, 2, 'February', 0, 0),
('T00020', '50007', 'P1001', 'Wireless Mouse', 3, '2025-02-16 15:15:00', 15.99, 'C10005', 'Noah Johnson', 'United States', 'Completed', 0, 0, 0, 0, 47.97, 2025, 2, 'February', 0, 0),
('T00021', 'C50008', 'P1009', 'Phone Holder', 3, '2025-02-24 16:15:00', 10.99, 'C10008', 'Sofia Rossi', 'Italy', 'Cancelled', 0, 0, 0, 0, 32.97, 2025, 2, 'February', 1, 0),
('T00022', 'C50008', 'P1004', 'Laptop Stand', 4, '2025-02-24 16:15:00', 29.95, 'C10008', 'Sofia Rossi', 'Italy', 'Cancelled', 0, 0, 0, 0, 119.80, 2025, 2, 'February', 1, 0),
('T00023', 'C50008', 'P1012', 'Cable Organizer', 5, '2025-02-24 16:15:00', 6.75, 'C10008', 'Sofia Rossi', 'Italy', 'Cancelled', 0, 0, 0, 0, 33.75, 2025, 2, 'February', 1, 0),
('T00024', '50009', 'P1007', 'Notebook Pack', 4, '2025-02-28 09:15:00', 12.50, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 50.00, 2025, 2, 'February', 0, 0),
('T00025', '50009', 'P1004', 'Laptop Stand', 5, '2025-02-28 09:15:00', 29.95, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 149.75, 2025, 2, 'February', 0, 0),
('T00026', '50009', 'P1008', 'Bluetooth Speaker', 1, '2025-02-28 09:15:00', 34.99, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 34.99, 2025, 2, 'February', 0, 0),
('T00027', '50009', 'P1005', 'Webcam HD', 2, '2025-02-28 09:15:00', 39.99, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 79.98, 2025, 2, 'February', 0, 0),
('T00028', '50010', 'P1001', 'Wireless Mouse', 5, '2025-03-08 10:15:00', 15.99, 'C10014', 'Grace Taylor', 'Canada', 'Completed', 0, 0, 0, 0, 79.95, 2025, 3, 'March', 0, 0),
('T00029', '50010', 'P1003', 'USB-C Cable', 1, '2025-03-08 10:15:00', 8.99, 'C10014', 'Grace Taylor', 'Canada', 'Completed', 0, 0, 0, 0, 8.99, 2025, 3, 'March', 0, 0),
('T00030', '50011', 'P1012', 'Cable Organizer', 1, '2025-03-16 11:15:00', 6.75, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 6.75, 2025, 3, 'March', 0, 0),
('T00031', '50011', 'P1007', 'Notebook Pack', 2, '2025-03-16 11:15:00', 12.50, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 25.00, 2025, 3, 'March', 0, 0),
('T00032', '50011', 'P1006', 'Desk Lamp', 3, '2025-03-16 11:15:00', 22.75, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 68.25, 2025, 3, 'March', 0, 0),
('T00033', '50012', 'P1005', 'Webcam HD', 2, '2025-03-24 12:15:00', 39.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 79.98, 2025, 3, 'March', 0, 0),
('T00034', '50012', 'P1003', 'USB-C Cable', 3, '2025-03-24 12:15:00', 8.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 26.97, 2025, 3, 'March', 0, 0),
('T00035', '50012', 'P1004', 'Laptop Stand', 4, '2025-03-24 12:15:00', 29.95, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 119.80, 2025, 3, 'March', 0, 0),
('T00036', '50012', 'P1006', 'Desk Lamp', 5, '2025-03-24 12:15:00', 22.75, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 113.75, 2025, 3, 'March', 0, 0),
('T00037', '50013', 'P1002', 'Mechanical Keyboard', 3, '2025-03-28 13:15:00', 48.50, 'C10009', 'Ethan Chen', 'Singapore', 'Completed', 0, 0, 0, 0, 145.50, 2025, 3, 'March', 0, 0),
('T00038', '50013', 'P1012', 'Cable Organizer', 4, '2025-03-28 13:15:00', 6.75, 'C10009', 'Ethan Chen', 'United Kingdom', 'Completed', 0, 0, 0, 0, 27.00, 2025, 3, 'March', 0, 0),
('T00039', '50014', 'P1007', 'Notebook Pack', 4, '2025-04-05 14:15:00', 12.50, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 50.00, 2025, 4, 'April', 0, 0),
('T00040', '50014', 'P1002', 'Mechanical Keyboard', 5, '2025-04-05 14:15:00', 48.50, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 242.50, 2025, 4, 'April', 0, 0),
('T00041', '50014', 'P1006', 'Desk Lamp', 1, '2025-04-05 14:15:00', 22.75, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 22.75, 2025, 4, 'April', 0, 0),
('T00042', '50015', 'P1006', 'Desk Lamp', 5, '2025-04-13 15:15:00', 22.75, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 113.75, 2025, 4, 'April', 0, 0),
('T00043', '50015', 'P1010', 'Power Bank', 1, '2025-04-13 15:15:00', 25.00, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 25.00, 2025, 4, 'April', 0, 0),
('T00044', '50015', 'P1005', 'Webcam HD', 2, '2025-04-13 15:15:00', 39.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 79.98, 2025, 4, 'April', 0, 0),
('T00045', '50015', 'P1001', 'Wireless Mouse', 3, '2025-04-13 15:15:00', 15.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 47.97, 2025, 4, 'April', 0, 0),
('T00046', '50016', 'P1012', 'Cable Organizer', 1, '2025-04-21 16:15:00', 6.75, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 0, 0, 6.75, 2025, 4, 'April', 0, 0),
('T00047', '50016', 'P1008', 'Bluetooth Speaker', 2, '2025-04-21 16:15:00', 34.99, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 0, 0, 69.98, 2025, 4, 'April', 0, 0),
('T00048', '50017', 'P1009', 'Phone Holder', 2, '2025-04-25 09:15:00', 10.99, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 21.98, 2025, 4, 'April', 0, 0),
('T00049', '50017', 'P1002', 'Mechanical Keyboard', 3, '2025-04-25 09:15:00', 48.50, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 145.50, 2025, 4, 'April', 0, 0),
('T00050', '50017', 'P1007', 'Notebook Pack', 4, '2025-04-25 09:15:00', 12.50, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 50.00, 2025, 4, 'April', 0, 0),
('T00051', '50018', 'P1002', 'Mechanical Keyboard', 3, '2025-05-03 10:15:00', 48.50, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 145.50, 2025, 5, 'May', 0, 0),
('T00052', '50018', 'P1009', 'Phone Holder', 4, '2025-05-03 10:15:00', 10.99, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 43.96, 2025, 5, 'May', 0, 0),
('T00053', '50018', 'P1005', 'Webcam HD', 5, '2025-05-03 10:15:00', 39.99, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 199.95, 2025, 5, 'May', 0, 0),
('T00054', '50018', 'P1006', 'Desk Lamp', 1, '2025-05-03 10:15:00', 22.75, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 22.75, 2025, 5, 'May', 0, 0),
('T00055', 'C50019', 'P1010', 'Power Bank', 4, '2025-05-11 11:15:00', 25.00, 'C10013', 'Daniel Lee', 'Canada', 'Cancelled', 0, 0, 0, 0, 100.00, 2025, 5, 'May', 1, 0),
('T00056', 'C50019', 'P1004', 'Laptop Stand', 5, '2025-05-11 11:15:00', 29.95, 'C10013', 'Daniel Lee', 'Canada', 'Cancelled', 0, 0, 0, 0, 149.75, 2025, 5, 'May', 1, 0),
('T00057', '50020', 'P1012', 'Cable Organizer', 5, '2025-05-19 12:15:00', 6.75, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 33.75, 2025, 5, 'May', 0, 0),
('T00058', '50020', 'P1002', 'Mechanical Keyboard', 1, '2025-05-19 12:15:00', 48.50, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 48.50, 2025, 5, 'May', 0, 0),
('T00059', '50020', 'P1001', 'Wireless Mouse', 2, '2025-05-19 12:15:00', 15.99, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 31.98, 2025, 5, 'May', 0, 0),
('T00060', '50021', 'P1011', 'Monitor Arm', 1, '2025-05-23 13:15:00', 59.90, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 59.90, 2025, 5, 'May', 0, 0),
('T00061', '50021', 'P1004', 'Laptop Stand', 2, '2025-05-23 13:15:00', 29.95, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 59.90, 2025, 5, 'May', 0, 0),
('T00062', '50021', 'P1005', 'Webcam HD', 3, '2025-05-23 13:15:00', 39.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 119.97, 2025, 5, 'May', 0, 0),
('T00063', '50021', 'P1002', 'Mechanical Keyboard', 4, '2025-05-23 13:15:00', 48.50, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 194.00, 2025, 5, 'May', 0, 0),
('T00064', '50022', 'P1004', 'Laptop Stand', 2, '2025-05-31 14:15:00', 29.95, 'C10008', 'Sofia Rossi', 'Italy', 'Completed', 0, 0, 0, 0, 59.90, 2025, 5, 'May', 0, 0),
('T00065', '50022', 'P1002', 'Mechanical Keyboard', 3, '2025-05-31 14:15:00', 48.50, 'C10008', 'Sofia Rossi', 'Italy', 'Completed', 0, 0, 0, 0, 145.50, 2025, 5, 'May', 0, 0),
('T00066', '50023', 'P1007', 'Notebook Pack', 3, '2025-06-08 15:15:00', 0.00, 'C10011', 'Raj Patel', 'India', 'Completed', 0, 1, 0, 0, 0.00, 2025, 6, 'June', 0, 0),
('T00067', '50023', 'P1005', 'Webcam HD', 4, '2025-06-08 15:15:00', 39.99, 'C10011', 'Raj Patel', 'India', 'Completed', 0, 0, 0, 0, 159.96, 2025, 6, 'June', 0, 0),
('T00068', '50023', 'P1008', 'Bluetooth Speaker', 5, '2025-06-08 15:15:00', 34.99, 'C10011', 'Raj Patel', 'India', 'Completed', 0, 0, 0, 0, 174.95, 2025, 6, 'June', 0, 0),
('T00069', '50024', 'P1011', 'Monitor Arm', 4, '2025-06-16 16:15:00', 59.90, 'C10014', 'Grace Taylor', 'Canada', 'Completed', 0, 0, 0, 0, 239.60, 2025, 6, 'June', 0, 0),
('T00070', '50024', 'P1006', 'Desk Lamp', 5, '2025-06-16 16:15:00', 22.75, 'C10014', 'Grace Taylor', 'Canada', 'Completed', 0, 0, 0, 0, 113.75, 2025, 6, 'June', 0, 0),
('T00071', '50024', 'P1003', 'USB-C Cable', 1, '2025-06-16 16:15:00', 8.99, 'C10014', 'Grace Taylor', 'Canada', 'Completed', 0, 0, 0, 0, 8.99, 2025, 6, 'June', 0, 0),
('T00072', '50024', 'P1012', 'Cable Organizer', 2, '2025-06-16 16:15:00', 6.75, 'C10014', 'Grace Taylor', 'Canada', 'Completed', 0, 0, 0, 0, 13.50, 2025, 6, 'June', 0, 0),
('T00073', '50025', 'P1006', 'Desk Lamp', 5, '2025-06-20 09:15:00', 22.75, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 113.75, 2025, 6, 'June', 0, 0),
('T00074', '50025', 'P1004', 'Laptop Stand', -2, '2025-06-20 09:15:00', 29.95, 'C10002', 'Emma Wilson', 'United Kingdom', 'Returned', 0, 0, 0, 1, -59.90, 2025, 6, 'June', 0, 1),
('T00075', '50026', 'P1011', 'Monitor Arm', 1, '2025-06-28 10:15:00', 59.90, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 59.90, 2025, 6, 'June', 0, 0),
('T00076', '50026', 'P1005', 'Webcam HD', 2, '2025-06-28 10:15:00', 39.99, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 79.98, 2025, 6, 'June', 0, 0),
('T00077', '50026', 'P1002', 'Mechanical Keyboard', 3, '2025-06-28 10:15:00', 48.50, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 145.50, 2025, 6, 'June', 0, 0),
('T00078', '50027', 'P1010', 'Power Bank', 2, '2025-07-06 11:15:00', 25.00, 'C10009', 'Ethan Chen', 'Singapore', 'Completed', 0, 0, 0, 0, 50.00, 2025, 7, 'July', 0, 0),
('T00079', '50027', 'P1011', 'Monitor Arm', 3, '2025-07-06 11:15:00', 59.90, 'C10009', 'Ethan Chen', 'Singapore', 'Completed', 0, 0, 0, 0, 179.70, 2025, 7, 'July', 0, 0),
('T00080', '50027', 'P1003', 'USB-C Cable', 4, '2025-07-06 11:15:00', 8.99, 'C10009', 'Ethan Chen', 'Singapore', 'Completed', 0, 0, 0, 0, 35.96, 2025, 7, 'July', 0, 0),
('T00081', '50027', 'P1009', 'Phone Holder', 5, '2025-07-06 11:15:00', 10.99, 'C10009', 'Ethan Chen', 'Singapore', 'Completed', 0, 0, 0, 0, 54.95, 2025, 7, 'July', 0, 0),
('T00082', '50028', 'P1012', 'Cable Organizer', 3, '2025-07-14 12:15:00', 6.75, 'C10012', 'Ananya Mehta', 'United States', 'Completed', 0, 0, 0, 0, 20.25, 2025, 7, 'July', 0, 0),
('T00083', '50028', 'P1004', 'Laptop Stand', 4, '2025-07-14 12:15:00', 29.95, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 119.80, 2025, 7, 'July', 0, 0),
('T00084', '50029', 'P1003', 'USB-C Cable', 4, '2025-07-18 13:15:00', 8.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 35.96, 2025, 7, 'July', 0, 0),
('T00085', '50029', 'P1008', 'Bluetooth Speaker', 5, '2025-07-18 13:15:00', 34.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 174.95, 2025, 7, 'July', 0, 0),
('T00086', '50029', 'P1007', 'Notebook Pack', 1, '2025-07-18 13:15:00', 12.50, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 12.50, 2025, 7, 'July', 0, 0),
('T00087', 'C50030', 'P1005', 'Webcam HD', 5, '2025-07-26 14:15:00', 39.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Cancelled', 0, 0, 0, 0, 199.95, 2025, 7, 'July', 1, 0),
('T00088', 'C50030', 'P1011', 'Monitor Arm', 1, '2025-07-26 14:15:00', 59.90, 'C10003', 'Liam Brown', 'United Kingdom', 'Cancelled', 0, 0, 0, 0, 59.90, 2025, 7, 'July', 1, 0),
('T00089', 'C50030', 'P1009', 'Phone Holder', 2, '2025-07-26 14:15:00', 10.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Cancelled', 0, 0, 0, 0, 21.98, 2025, 7, 'July', 1, 0),
('T00090', 'C50030', 'P1004', 'Laptop Stand', 3, '2025-07-26 14:15:00', 29.95, 'C10003', 'Liam Brown', 'United Kingdom', 'Cancelled', 0, 0, 0, 0, 89.85, 2025, 7, 'July', 1, 0),
('T00091', '50031', 'P1011', 'Monitor Arm', 1, '2025-08-03 15:15:00', 59.90, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 59.90, 2025, 8, 'August', 0, 0),
('T00092', '50031', 'P1006', 'Desk Lamp', 2, '2025-08-03 15:15:00', 22.75, 'C10007', 'Lucas Martin', 'France', 'Completed', 0, 0, 0, 0, 45.50, 2025, 8, 'August', 0, 0),
('T00093', '50032', 'P1001', 'Wireless Mouse', 2, '2025-08-11 16:15:00', 15.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 31.98, 2025, 8, 'August', 0, 0),
('T00094', '50032', 'P1004', 'Laptop Stand', 3, '2025-08-11 16:15:00', 29.95, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 89.85, 2025, 8, 'August', 0, 0),
('T00095', '50032', 'P1012', 'Cable Organizer', 4, '2025-08-11 16:15:00', 6.75, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 27.00, 2025, 8, 'August', 0, 0),
('T00096', '50033', 'P1006', 'Desk Lamp', 3, '2025-08-15 09:15:00', 22.75, 'C10013', 'Daniel Lee', 'Canada', 'Completed', 0, 0, 0, 0, 68.25, 2025, 8, 'August', 0, 0),
('T00097', '50033', 'P1007', 'Notebook Pack', 4, '2025-08-15 09:15:00', 12.50, 'C10013', 'Daniel Lee', 'Canada', 'Completed', 0, 0, 0, 0, 50.00, 2025, 8, 'August', 0, 0),
('T00098', '50033', 'P1005', 'Webcam HD', 5, '2025-08-15 09:15:00', 39.99, 'C10013', 'Daniel Lee', 'Canada', 'Completed', 0, 0, 0, 0, 199.95, 2025, 8, 'August', 0, 0),
('T00099', '50033', 'P1002', 'Mechanical Keyboard', 1, '2025-08-15 09:15:00', 48.50, 'C10013', 'Daniel Lee', 'Canada', 'Completed', 0, 0, 0, 0, 48.50, 2025, 8, 'August', 0, 0),
('T00100', '50034', 'P1004', 'Laptop Stand', 4, '2025-08-23 10:15:00', 29.95, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 119.80, 2025, 8, 'August', 0, 0),
('T00101', '50034', 'P1010', 'Power Bank', 5, '2025-08-23 10:15:00', 25.00, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 125.00, 2025, 8, 'August', 0, 0),
('T00102', '50035', 'P1012', 'Cable Organizer', 5, '2025-08-31 11:15:00', 6.75, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 0, 0, 33.75, 2025, 8, 'August', 0, 0),
('T00103', '50035', 'P1006', 'Desk Lamp', 1, '2025-08-31 11:15:00', 999.99, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 1, 0, 999.99, 2025, 8, 'August', 0, 0),
('T00104', '50035', 'P1004', 'Laptop Stand', 2, '2025-08-31 11:15:00', 29.95, 'C10004', 'Olivia Smith', 'United States', 'Completed', 0, 0, 0, 0, 59.90, 2025, 8, 'August', 0, 0),
('T00105', '50036', 'P1011', 'Monitor Arm', 1, '2025-09-08 12:15:00', 59.90, 'C10008', 'Sofia Rossi', 'India', 'Completed', 0, 0, 0, 0, 59.90, 2025, 9, 'September', 0, 0),
('T00106', '50036', 'P1008', 'Bluetooth Speaker', 2, '2025-09-08 12:15:00', 34.99, 'C10008', 'Sofia Rossi', 'Italy', 'Completed', 0, 0, 0, 0, 69.98, 2025, 9, 'September', 0, 0),
('T00107', '50036', 'P1007', 'Notebook Pack', 3, '2025-09-08 12:15:00', 12.50, 'C10008', 'Sofia Rossi', 'Italy', 'Completed', 0, 0, 0, 0, 37.50, 2025, 9, 'September', 0, 0),
('T00108', '50036', 'P1012', 'Cable Organizer', 4, '2025-09-08 12:15:00', 6.75, 'C10008', 'Sofia Rossi', 'Italy', 'Completed', 0, 0, 0, 0, 27.00, 2025, 9, 'September', 0, 0),
('T00109', '50037', 'P1003', 'USB-C Cable', 2, '2025-09-12 13:15:00', 8.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 17.98, 2025, 9, 'September', 0, 0),
('T00110', '50037', 'P1005', 'Webcam HD', 3, '2025-09-12 13:15:00', 39.99, 'C10003', 'Liam Brown', 'United Kingdom', 'Completed', 0, 0, 0, 0, 119.97, 2025, 9, 'September', 0, 0),
('T00111', 'C50038', 'P1003', 'USB-C Cable', 3, '2025-09-20 14:15:00', 8.99, 'C10014', 'Grace Taylor', 'Canada', 'Cancelled', 0, 0, 0, 0, 26.97, 2025, 9, 'September', 1, 0),
('T00112', 'C50038', 'P1004', 'Laptop Stand', 4, '2025-09-20 14:15:00', 29.95, 'C10014', 'Grace Taylor', 'Canada', 'Cancelled', 0, 0, 0, 0, 119.80, 2025, 9, 'September', 1, 0),
('T00113', 'C50038', 'P1009', 'Phone Holder', 5, '2025-09-20 14:15:00', 10.99, 'C10014', 'Grace Taylor', 'Canada', 'Cancelled', 0, 0, 0, 0, 54.95, 2025, 9, 'September', 1, 0),
('T00114', '50039', 'P1009', 'Phone Holder', 4, '2025-09-28 15:15:00', 10.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 43.96, 2025, 9, 'September', 0, 0),
('T00115', '50039', 'P1005', 'Webcam HD', 5, '2025-09-28 15:15:00', 39.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 199.95, 2025, 9, 'September', 0, 0),
('T00116', '50039', 'P1010', 'Power Bank', 1, '2025-09-28 15:15:00', 25.00, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 25.00, 2025, 9, 'September', 0, 0),
('T00117', '50039', 'P1007', 'Notebook Pack', 2, '2025-09-28 15:15:00', 12.50, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 25.00, 2025, 9, 'September', 0, 0),
('T00118', '50040', 'P1010', 'Power Bank', 5, '2025-10-06 16:15:00', 25.00, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 125.00, 2025, 10, 'October', 0, 0),
('T00119', '50040', 'P1007', 'Notebook Pack', 1, '2025-10-06 16:15:00', 12.50, 'C10001', 'Aarav Sharma', 'India', 'Completed', 0, 0, 0, 0, 12.50, 2025, 10, 'October', 0, 0),
('T00120', '50041', 'P1006', 'Desk Lamp', 1, '2025-10-10 09:15:00', 22.75, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 22.75, 2025, 10, 'October', 0, 0),
('T00121', '50041', 'P1004', 'Laptop Stand', 2, '2025-10-10 09:15:00', 29.95, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 59.90, 2025, 10, 'October', 0, 0),
('T00122', '50041', 'P1003', 'USB-C Cable', 3, '2025-10-10 09:15:00', 8.99, 'C10002', 'Emma Wilson', 'United Kingdom', 'Completed', 0, 0, 0, 0, 26.97, 2025, 10, 'October', 0, 0),
('T00123', '50042', 'P1009', 'Phone Holder', 2, '2025-10-18 10:15:00', 10.99, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 21.98, 2025, 10, 'October', 0, 0),
('T00124', '50042', 'P1008', 'Bluetooth Speaker', 3, '2025-10-18 10:15:00', 34.99, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 104.97, 2025, 10, 'October', 0, 0),
('T00125', '50042', 'P1002', 'Mechanical Keyboard', 4, '2025-10-18 10:15:00', 48.50, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 194.00, 2025, 10, 'October', 0, 0),
('T00126', '50042', 'P1001', 'Wireless Mouse', 5, '2025-10-18 10:15:00', 15.99, 'C10012', 'Ananya Mehta', 'India', 'Completed', 0, 0, 0, 0, 79.95, 2025, 10, 'October', 0, 0),
('T10000', '50099', 'P1012', 'Unknown', 2, '2025-10-15 14:20:00', 6.75, 'C10012', 'Ananya Mehta', 'Unknown', 'Completed', 0, 0, 0, 0, 13.50, 2025, 10, 'October', 0, 0);


-- ------------------------------------------------------------
-- 4.0  Check the load  (expected: 127 rows, 10804.50)
--      SCREENSHOT: 4.1_sql_load_check.png
-- ------------------------------------------------------------
USE ecommerce_analytics;
SELECT COUNT(*) AS total_rows, ROUND(SUM(Revenue), 2) AS gross_revenue
FROM transactions_clean;


-- ------------------------------------------------------------
-- 4.1  Verify import - (a) first 10 records
-- ------------------------------------------------------------
USE ecommerce_analytics;
SELECT * FROM transactions_clean LIMIT 10;

-- 4.1  (b) missing values  (expected: 1, 1, 1, 0)
SELECT
  SUM(Description = 'Unknown') AS unknown_description,
  SUM(CustomerID = 'Unknown')  AS unknown_customer,
  SUM(Country = 'Unknown')     AS unknown_country,
  SUM(Description IS NULL OR CustomerID IS NULL OR Country IS NULL) AS null_values
FROM transactions_clean;

-- 4.1  (c) duplicates  (expected: empty result, 0 rows)
SELECT InvoiceNo, StockCode, InvoiceDate, CustomerID, Quantity, UnitPrice, COUNT(*) AS n
FROM transactions_clean
GROUP BY InvoiceNo, StockCode, InvoiceDate, CustomerID, Quantity, UnitPrice
HAVING COUNT(*) > 1;


------------------------------------------------------------
-- 4.2  Add indexes, then list them
------------------------------------------------------------
USE ecommerce_analytics;

CREATE INDEX idx_invoice_no   ON transactions_clean (InvoiceNo);
CREATE INDEX idx_customer_id  ON transactions_clean (CustomerID);
CREATE INDEX idx_invoice_date ON transactions_clean (InvoiceDate);
CREATE INDEX idx_country      ON transactions_clean (Country);

SHOW INDEX FROM transactions_clean;

-- PHASE 5 - SQL ANALYSIS
USE ecommerce_analytics;

-- 5.1 KPI summary
SELECT
  ROUND(SUM(Revenue), 2) AS gross_revenue,
  ROUND(SUM(CASE WHEN OrderStatus = 'Completed' THEN Revenue END), 2) AS net_revenue,
  COUNT(DISTINCT CASE WHEN OrderStatus = 'Completed' THEN InvoiceNo END) AS valid_orders,
  COUNT(DISTINCT CASE WHEN CustomerID <> 'Unknown' THEN CustomerID END) AS unique_customers,
  COUNT(DISTINCT CASE WHEN IsCancelled = 1 THEN InvoiceNo END) AS cancelled_orders
FROM transactions_clean;

-- 5.2 Net revenue by month
SELECT InvoiceMonth, InvoiceMonthName, ROUND(SUM(Revenue), 2) AS net_revenue
FROM transactions_clean
WHERE OrderStatus = 'Completed'
GROUP BY InvoiceMonth, InvoiceMonthName
ORDER BY InvoiceMonth;

-- 5.3 Net revenue by country
SELECT Country, ROUND(SUM(Revenue), 2) AS net_revenue
FROM transactions_clean
WHERE OrderStatus = 'Completed'
GROUP BY Country
ORDER BY net_revenue DESC;

-- 5.4 Top 5 products
SELECT Description, ROUND(SUM(Revenue), 2) AS net_revenue
FROM transactions_clean
WHERE OrderStatus = 'Completed'
GROUP BY Description
ORDER BY net_revenue DESC
LIMIT 5;



