-- KPI calculations for coffee sales analysis

-- Whole KPI (Revenue/Orders/AOV)
select
	sum(money) as total_revenue,
	count(*) as total_orders,
	round(sum(money) * 10 / count(*),2) as aov
from `coffee_sales`

