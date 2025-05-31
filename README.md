Pizza Sales Analysis — SQL Project

Objective
Analyze pizza sales data to extract business insights such as total revenue, most popular pizzas, order patterns, and revenue distribution.

Tools Used
- MySQL
- SQL Joins, Group By, Aggregate Functions

Database Schema
Tables used:
- `orders`
- `orders_details`
- `pizzas`
- `pizza_types`

## 🔍 Key Business Questions Solved
1. Retrive the total numbers of orders placed
2. Calculate total revenue generated from pizza sales.
3. Identife the highest priced pizza
4. Identify the most common pizza size on orderd
5. List the top 5 most pizza types ordered pizza types along with their quantites
6. Join the necessary tables to find the total quantity of each pizza category ordered
7. Determine the distribution of orders by an hours of the day
8. Join relevent tables to find the category wise distribution of pizzas
9. Group the orders by date and calculate the average number of pizzas ordered per day
10. Determine the top most 3 most orderd pizza based on revenue
11. Claculate the percentage contribution of each pizza type to total revenue 

Sample Query (Total Revenue)
```sql
SELECT ROUND(SUM(orders_details.quantity * pizzas.price), 2) AS total_sales
FROM orders_details 
JOIN pizzas ON pizzas.pizza_id = orders_details.pizza_id;
