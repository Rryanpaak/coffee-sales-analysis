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

--Using Pareto Analysis, we can find out how many products make 80% of revenue.
WITH product_revenue as(
	SELECT
		coffee_name,
		sum(money) as revenue
	from `coffee_sales`
	group by coffee_name
),
ranked as(
	SELECT
		coffee_name,
		revenue,
		sum(revenue) over(order by revenue desc) as cumulative_revenue,
		sum(revenue) over() as total_revenue
	from `product_revenue`
)
SELECT
	coffee_name,
	revenue,
	round(cumulative_revenue * 100 / total_revenue,2) as cumulative_rev_pct
from `ranked`
order by revenue desc;
-- Pareto Summary
-- Top 5 products account for 83% of total revenue.




