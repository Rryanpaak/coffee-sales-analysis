-- Data validation queries for coffee sales analysis
-- Check data quality and consistency

-- 1) Row_count
select count(*) AS row_count
from coffee_sales;

-- 2) Date range
SELECT 
	min(date) as start_date,
	max(date) as end_date
FROM coffee_sales;

-- 3) Checking Null
SELECT
	SUM(CASE WHEN date IS NULL OR TRIM(date) = '' THEN 1 ELSE 0 END) AS null_date,
	SUM(CASE WHEN money IS NULL OR TRIM(money) = '' THEN 1 ELSE 0 END) AS null_money,
	SUM(CASE WHEN coffee_name IS NULL OR TRIM(coffee_name) = '' THEN 1 ELSE 0 END) AS null_coffee_name
from coffee_sales;

-- 4) Money sanity check
SELECT
	sum(CASE WHEN money <= 0 then 1 else 0 end) as non_positive_money,
	min(money) as min_money,
	max(money) as max_money,
	avg(money) as average_money
FROM coffee_sales;

-- 5) Duplicates
--- 1) By coffee name
SELECT
	coffee_name,
	count(*) as orders
FROM coffee_sales
group by coffee_name
order by orders desc;

---2) By Weekday
SELECT
	Weekday,
	count(*) as orders
FROM coffee_sales
group by Weekday
order by orders desc;

---3) By Time of day
SELECT
	Time_of_Day,
	count(*) as orders
FROM coffee_sales
group by Time_of_Day
order by orders desc;

---4) By Month name
SELECT
	Month_name,
	count(*) as orders
FROM coffee_sales
group by Month_name
order by orders desc;
