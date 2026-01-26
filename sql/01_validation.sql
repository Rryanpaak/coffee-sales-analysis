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
