create database PIZZA_HUT;
USE PIZZA_HUT;
select * FROM orders_details;
create table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id));

create table orders_details(
order_details_id int not null,
order_id int not null,
pizza_id text  not null,
quantity int not null,
primary key(order_details_id));

#1) Retrive the total numbers of orders placed
select count(order_id) as total_orders from orders;

#2) calculate total revenue generated from pizza sales.
select round(sum(orders_details.quantity*pizzas.price),2) as total_sales
from orders_details 
join pizzas
on pizzas.pizza_id=orders_details.pizza_id;

#3) identife the highest priced pizza
select pizza_types.name,pizzas.price from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc limit 1;

#4) identify the most common pizza size on orderd
select pizzas.size,count(orders_details.order_details_id) as most_orderd from pizzas
join orders_details
on pizzas.pizza_id=orders_details.pizza_id
group by pizzas.size
order by most_orderd desc
limit 1;

#5) List the top 5 most pizza types ordered pizza types along with their quantites
select pizza_types.name,sum(orders_details.quantity) quantity from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id=pizzas.pizza_id
group by pizza_types.name
order by quantity  desc
limit 5;

#6) join the necessary tables to find the total quantity of each pizza category ordered
select pizza_types.category,sum(orders_details.quantity) as quantity from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id=pizzas.pizza_id
group by pizza_types.category order by quantity desc;

#7)determine the distribution of orders by an hours of the day
select hour(order_time), count(order_id) from orders
group by hour(order_time);

#8) join relevent tables to find the category wise distribution of pizzas
select category, count(name) from pizza_types
group by category;

#9) Gruop the orders by date and calculate the average number of pizzas ordered per day
select avg(quantity) from 
(select orders.order_date, sum(orders_details.quantity) as quantity from orders join orders_details
on orders.order_id=orders_details.order_id
group by orders.order_date) as order_quantity;


#10 determine the top most 3 most orderd pizza based on revenue
SELECT pizza_types.name, sum(orders_details.quantity * pizzas.price) AS revenue
FROM pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc
LIMIT 3;


#11) claculate the percentage contribution of each pizza type to total revenue 
SELECT pizza_types.category, SUM(orders_details.quantity * pizzas.price) AS revenue
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;

