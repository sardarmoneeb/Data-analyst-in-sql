-- Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;

-- Calculate the total revenue generated from pizza sales.
select round (sum(order_details.quantity * pizzas.price),2) as total_sales
from order_details 
join pizzas 
on pizzas.pizza_id=order_details.pizza_id;

-- identified the heighest price pizza.
select max(price) from pizzas;

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- Identify the most  common pizza size ordered.

SELECT 
    count(order_details.order_details_id) , pizzas.size
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
    group by pizzas.size;
    
    -- List top 5 most ordered pizza types along with thir quantities.
    
    SELECT 
    SUM(order_details.quantity) AS quantity, pizza_types.name
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;
 
