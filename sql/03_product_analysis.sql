-- Product analysis and performance queries

-- Product KPI included the top-selling products, the top-revenue products, and the top-aov.
SELECT
	coffee_name,
	sum(money) as total_revenue,
	count(*) as total_orders,
	round(sum(money) / count(*),2) as aov
from `coffee_sales`
group by coffee_name
order by total_revenue desc;


