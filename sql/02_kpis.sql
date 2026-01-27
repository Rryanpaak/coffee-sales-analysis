-- KPI calculations for coffee sales analysis

-- Whole KPI (Revenue/Orders/AOV)
select
	sum(money) as total_revenue,
	count(*) as total_orders,
	round(sum(money) * 10 / count(*),2) as aov
from `coffee_sales`;

-- Monthly KPI
select
	Month_name,
	sum(money) as total_revenue,
	count(*) as total_orders,
	round(sum(money) * 10 / count(*),2) as aov
from `coffee_sales`
group by Month_name
order by total_revenue asc;

--Weekday KPI
select
	Weekday,
	sum(money) as total_revenue,
	count(*) as total_orders,
	round(sum(money) * 10 / count(*),2) as aov
from `coffee_sales`
group by Weekday
order by total_revenue asc;

--Time of day KPI
select
	Time_of_Day,
	sum(money) as total_revenue,
	count(*) as total_orders,
	round(sum(money) * 10 / count(*),2) as aov
from `coffee_sales`
group by Time_of_Day
order by total_revenue asc
	
--Hour of day KPI
select
	hour_of_day,
	sum(money) as total_revenue,
	count(*) as total_orders,
	round(sum(money) * 10 / count(*),2) as aov
from `coffee_sales`
group by hour_of_Day
order by total_revenue asc


