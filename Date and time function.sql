select * from orders;
select order_delivered_customer_date from orders;

select order_delivered_customer_date, day(order_delivered_customer_date) from orders;

select order_delivered_customer_date, month(order_delivered_customer_date),
monthname(order_delivered_customer_date),year(order_delivered_customer_date),yearweek(order_delivered_customer_date) from orders;

select * from orders;
select datediff(order_estimated_delivery_date,order_delivered_customer_date) from orders;
select * from payments;
select payment_value from payments;
select payment_value,ceil(payment_value),floor(payment_value) from payments;
select* from orders;
select order_status,count(order_status) from orders group by order_status;

select * from customers;
select customer_state,count(customer_state) from customers group by customer_state;
select customer_city,count(customer_city) from customers group by customer_city;
