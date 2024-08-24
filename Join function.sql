select * from customers;

select * from ecommerce.orders;

select customers.customer_id,orders.order_status 
from customers join orders
 on customers.customer_id = orders.customer_id 
 where order_status = "canceled";
 
 select * from payments;
 select year(orders.order_purchase_timestamp) as years, round(sum(payments.payment_value),2)
 from orders join payments 
 on orders.order_id = payments.order_id
 group by years order by years;
 
 
 select * from orders;
 select * from payments;
 
 select monthname(orders.order_approved_at) as Approval,sum(payments.payment_value)
 from orders join payments 
 on orders.order_id = payments.order_id
 group by Approval;
 
 
 select * from customers;
 select* from orders;
 
 select customers.customer_id,orders.order_status 
 from customers left join orders 
 on customers.customer_id = orders.customer_id;
 
 select customers.customer_id,orders.order_status 
 from customers 
 left join orders 
 on customers.customer_id = orders.customer_id
 
 
 