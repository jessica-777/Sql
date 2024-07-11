create database pizza;
use pizza;

select * from pizza_sales;

-- Total Revenue 
select sum(total_price)as Total_Revenue from pizza_sales;


-- Average Order Vlaue
select sum(total_price) / count(distinct order_id) as Avg_Order_Vlaue from pizza_sales;


-- Total Pizza Sold 
select sum(quantity)as Total_pizza_sold from pizza_sales;


-- Total orders 
select count(distinct order_id) as total_orders from pizza_sales;


-- Average Pizza Per order
select sum(quantity) / count(distinct order_id) as Avg_Pizza from pizza_sales;


-- Daily Trend For Total Orders 
SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));
    
    
-- Hourly Trend 
SELECT HOUR(STR_TO_DATE(order_time, '%H:%i:%s')) AS order_hours, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY HOUR(STR_TO_DATE(order_time, '%H:%i:%s'))
ORDER BY order_hours;

-- Percentage of Sales by pizza category 
select pizza_category,sum(total_price) as Sales, sum(total_price) *100 / (select sum(total_price) from pizza_sales) As PCT
from pizza_sales 
group by pizza_category;


-- Percentage of Sales by Pizza Size
select pizza_size,sum(total_price) as Sales, sum(total_price) *100 / (select sum(total_price) from pizza_sales) As PCT
from pizza_sales 
group by pizza_size
order by PCT DESC;


-- Total Pizza sold by Category 
select pizza_category, sum(quantity) 
from pizza_sales 
group by pizza_category;


-- Top 5 best seller by Total pizza sold 
select pizza_name, sum(quantity) as total_pizza_sold 
from pizza_sales 
group by pizza_name
order by total_pizza_sold 
limit 5;


-- Bottom 5 Worst seller by Total Sales 
select pizza_name, sum(quantity) as total_pizza_sold 
from pizza_sales 
group by pizza_name
order by total_pizza_sold 
limit 5;
    
    















