# DATA-ANALYST-INTERNSHIP-TASK-6

📊 Online Sales Database – README

This project demonstrates how to create and analyze an online sales dataset using MySQL. It includes table creation, schema modifications, and analytical queries for revenue, transactions, and sales insights.

🗄️ Database & Table Setup
**Select database**
USE online_sales;

-- Create table
CREATE TABLE `tableName` (
    `Transaction ID` INT,
    `Date` VARCHAR(512),
    `Product Category` VARCHAR(512),
    `Product Name` VARCHAR(512),
    `Units Sold` VARCHAR(512),
    `Unit Price` DOUBLE,
    `Total Revenue` DOUBLE,
    `Region` VARCHAR(512),
    `Payment Method` VARCHAR(512)
);

📌 Table Rename & Data Selection
-- Rename table
RENAME TABLE sales TO saless;

-- View all records
SELECT * FROM saless;

🔍 Data Cleaning & Null Check
-- Check for null values in revenue
SELECT * 
FROM saless
WHERE total_revenue IS NULL;

-- View dates
SELECT Date 
FROM saless;

-- Change column type for Date
ALTER TABLE saless
MODIFY date DATE;

📊 Transaction Analysis
1. Transaction List by Month
SELECT `date`, MONTH(`date`) AS month, transactionid
FROM saless;

2. Total Revenue by Month
SELECT SUM(total_revenue) AS total_revenue, MONTH(`date`) AS months
FROM saless
GROUP BY MONTH(`date`);

3. Total Revenue by Year
SELECT SUM(total_revenue) AS total_revenue, YEAR(`date`) AS year
FROM saless
GROUP BY YEAR(`date`);

🛠️ Table Modification
-- Rename column
ALTER TABLE saless
CHANGE `Transaction ID` transactionid INT NOT NULL;

📈 Sales & Revenue Insights
1. Count of Transactions & Sales per Month
SELECT DISTINCT MONTH(date) AS month, COUNT(transactionid), SUM(total_Revenue) AS revenue
FROM saless
GROUP BY MONTH(date);

2. Average Sales by Month
SELECT MONTH(date) AS month, AVG(total_revenue) AS Average_Sales
FROM saless
GROUP BY MONTH(date);

3. Sum of Sales by Month
SELECT MONTHNAME(date) AS month, SUM(total_revenue) AS sum_sales
FROM saless
GROUP BY MONTHNAME(date);

📊 Transaction Counts
-- Total transactions overall
SELECT DISTINCT COUNT(transactionid) 
FROM saless;

-- Total sales records
SELECT COUNT(*) 
FROM saless;

-- Distinct transaction count
SELECT DISTINCT COUNT(transactionid) 
FROM saless;

🏆 Revenue Ranking
Top 3 Months with Highest Revenue
SELECT MONTHNAME(date) AS month, SUM(total_revenue) AS revenue
FROM saless
GROUP BY MONTHNAME(date)
ORDER BY SUM(total_revenue) DESC 
LIMIT 3;

Top 3 Months with Lowest Revenue
SELECT MONTHNAME(date) AS month, SUM(total_revenue) AS revenue
FROM saless
GROUP BY MONTHNAME(date)
ORDER BY SUM(total_revenue) ASC 
LIMIT 3;

⚠️ Null Value Recheck
SELECT * 
FROM saless
WHERE total_revenue IS NULL;
