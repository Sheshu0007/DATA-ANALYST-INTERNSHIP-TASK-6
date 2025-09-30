use online_sales;
CREATE TABLE `tableName` (
    `Transaction ID`	INT,
    `Date`	VARCHAR(512),
    `Product Category`	VARCHAR(512),
    `Product Name`	VARCHAR(512),
    `Units Sold`	VARCHAR(512),
    `Unit Price`	DOUBLE,
    `Total Revenue`	DOUBLE,
    `Region`	VARCHAR(512),
    `Payment Method`	VARCHAR(512)
);
select * from saless;
rename table sales to saless;

--  checking for null values 
select * from saless
where total_revenue is null;


select Date from saless;

alter table saless
modify date date;


-- transaction list of the month
SELECT `date`, MONTH(`date`) AS month,transactionid
FROM saless;

-- total ravenue by month

select sum(total_revenue) as total_revenue,MONTH(`date`) AS months from saless
group by MONTH(`date`);

-- total revenue by the year 
select sum(total_revenue) as total_revenue,year(date) as year from saless
group by YEAR(date);


-- alter table column name
ALTER TABLE saless
CHANGE `Transaction ID` transactionid INT NOT NULL;

-- count of transaction and sales of the month
SELECT DISTINCT MONTH(date) AS month, count(transactionid),sum(total_Revenue) as revenue
FROM saless
group by month(date);

-- avg of sales by the by months
select month(date) as month,avg(total_revenue) as  Average_Sales
from saless
group by month(date);

-- sum of sales by month
select monthNAME(date) as month,sum(total_revenue) as sum_sales
from saless
group by MONTHNAME(date);

-- total transations overall
SELECT distinct COUNT(transactionid) from saless;

-- count of saless
select count(*) from saless;
select distinct count(transactionid) from saless;


-- top 3 revenue by month
select monthname(date) as month,sum(total_revenue) as revenue
from saless
group by monthname(date)
order by sum(total_revenue) desc limit 3;

-- top 3 lowest revenue by month

select monthname(date) as month,sum(total_revenue) as revenue
from saless
group by monthname(date)
order by sum(total_revenue) asc limit 3;



select * from saless
where total_revenue is null;