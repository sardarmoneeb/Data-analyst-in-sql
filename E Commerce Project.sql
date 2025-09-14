USE ecommerce_db;
 -- CREATE TABLE sales_data (
--      InvoiceNo VARCHAR(20),
--      StockCode VARCHAR(20),
--      Description VARCHAR(255),
--      Quantity INT,
--      InvoiceDate DATETIME,
--      UnitPrice DECIMAL(10,2),
--      CustomerID INT,
--      Country VARCHAR(100)
--  );
 SHOW VARIABLES LIKE 'secure_file_priv';
 USE ecommerce_db;

 ALTER TABLE sales_data MODIFY CustomerID INT NULL;
ALTER TABLE sales_data MODIFY InvoiceDate DATETIME NULL;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_clean.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, @inv, UnitPrice, @cust, Country)
SET 
    InvoiceDate = NULLIF(@inv, ''),
    CustomerID  = NULLIF(@cust, '');
SET SQL_SAFE_UPDATES = 0;

DELETE FROM sales_data WHERE UnitPrice <= 0;
SELECT 
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM sales_data;
SELECT 
    Description,
    SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Description
ORDER BY Total_Quantity desc
LIMIT 10;-- 
SELECT 
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM sales_data
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;
-- Top 10 Customer by Revenue
SELECT 
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM sales_data
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;
-- Monthly Sales Trend
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Monthly_Revenue
FROM sales_data
GROUP BY Month
ORDER BY Month;
-- Sales by Country
SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM sales_data
GROUP BY Country
ORDER BY Total_Revenue DESC;
-- Average Order Value per Customer
SELECT 
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice)/COUNT(DISTINCT InvoiceNo), 2) AS Avg_Order_Value
FROM sales_data
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Avg_Order_Value DESC;
-- Top Countries by Number of Orders
SELECT 
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales_data
GROUP BY Country
ORDER BY Total_Orders DESC
LIMIT 10;
SHOW VARIABLES LIKE 'secure_file_priv';











