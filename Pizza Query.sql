use [Pizza Sales]

--- 1. Total Revenue
select sum(total_price) as total_revenue
from pizza_sales

--- 2. Average Order Value
select sum(total_price)/ count(distinct order_id) as avg_order_value
from pizza_sales

--- 3. Total Pizza Sold
select sum(quantity) as total_pizza_sold
from pizza_sales

--- 4. Total Orders
select count(distinct order_id) as total_orders
from pizza_sales

--- 5. Average Pizza per Order
select cast(cast(sum(quantity) as decimal(10,2)) /count(distinct order_id) as decimal(10,2)) as avg_pizza_per_order
from pizza_sales

--- 6. Daily trend for Total Orders
select DATENAME(DW,order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(DW,order_date)
order by case DATENAME(DW,order_date)
				when 'Monday' then 1
				when 'Tuesday' then 2
				when 'Wednesday' then 3
				when 'Thursday' then 4
				when 'Friday' then 5
				when 'Saturday' then 6
				when 'Sunday' then 7
		end

--- 7. Monthly trend for Total Orders
select DATENAME(month, order_date) as month_name, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(month, order_date)
order by case DATENAME(month, order_date)
				when 'January' then 1
				when 'February' then 2
				when 'March' then 3
				when 'April' then 4
				when 'May' then 5
				when 'June' then 6
				when 'July' then 7
				when 'August' then 8
				when 'September' then 9
				when 'October' then 10
				when 'November' then 11
				when 'December' then 12
			end

--- 8. % of Sales by Pizza Category
select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue, cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category
order by PCT desc

--- 9. % of Sales by Pizza size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue, cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT desc

--- 10. Total Pizza sold by Pizza Category
select pizza_category, sum(quantity) as total_quantity_sold
from pizza_sales
group by pizza_category

--- 11. Top 5 pizza by Revenue
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc

--- 12. Bottom 5 pizza by Revenue
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue asc

--- 13. Top 5 pizza by Quantity
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc

--- 14. Bottom 5 pizza by Quantity
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity asc

--- 15. Top 5 pizza by Total Orders
select top 5 pizza_name, count(distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by total_order desc

--- 16. Bottom 5 pizza by Total Orders
select top 5 pizza_name, count(distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by total_order asc