-- Retrieve the total number of orders placed.
 select count(*) from orders;
 
-- Calculate the total revenue generated from pizza sales.
select round(sum(od.quantity * p.price),2)  as total_revenue from order_details as od 
join pizzas as p on od.pizza_id = p.pizza_id;

-- Identify the highest-priced pizza.
select pt.name,  p.price as max_price from pizzas as p
join pizza_types as pt 
on p.pizza_type_id = pt.pizza_type_id
order by max_price desc
limit 1;

-- Identify the most common pizza size ordered.
select p.size, count(od.quantity) as qnty from pizzas as p 
join order_details as od 
on p.pizza_id = od.pizza_id
group by p.size
order by qnty desc;

-- List the top 5 most ordered pizza types along with their quantities.
select pt.name, sum(od.quantity) as qnty from pizza_types as pt 
join pizzas as p 
on pt.pizza_type_id = p.pizza_type_id
join order_details as od 
on p.pizza_id = od.pizza_id
group by pt.name
order by qnty desc
limit 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pt.category, sum(od.quantity) as qnty from pizza_types as pt 
join pizzas as p 
on pt.pizza_type_id = p.pizza_type_id
join order_details as od 
on p.pizza_id = od.pizza_id
group by pt.category
order by qnty desc;

-- Determine the distribution of orders by hour of the day.
select hour(order_time) as hours, count(order_id) as cnt from orders group by hours order by cnt desc;

-- Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name) as distribution from  pizza_types group by category order by distribution desc;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
select day(order_date) as days, round(avg(order_id)) as avg_orders from orders group by days order by avg_orders desc;

-- Determine the top 3 most ordered pizza types based on revenue.
select pt.name, round(sum(od.quantity*p.price)) as revenue from pizzas as p
join order_details as od on p.pizza_id=od.pizza_id
join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
group by pt.name
order by revenue desc
limit 3;

-- Calculate the percentage contribution of each pizza type to total revenue.
select pt.category, round((sum(od.quantity*p.price)/(select round(sum(od.quantity * p.price),2)  as total_revenue from order_details as od 
join pizzas as p on od.pizza_id = p.pizza_id))*100,2) as percentage_revenue 
from pizzas as p
join order_details as od on p.pizza_id=od.pizza_id
join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
group by pt.category
order by percentage_revenue desc;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select pt.category, pt.name, round(sum(od.quantity * p.price),2) as total_revenue from order_details as od 
join pizzas as p on od.pizza_id = p.pizza_id
join pizza_types as pt on p.pizza_type_id=pt.pizza_type_id
group by pt.category, pt.name
order by total_revenue desc;

