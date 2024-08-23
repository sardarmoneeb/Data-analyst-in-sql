select * from ecommerce.customers;

select * from customers where customer_city="franca";

select *from payments;
select* from payments where payment_value <=100 and payment_type="UPI";

select* from payments where payment_value between 500 and 1000;

select * from payments order by payment_value desc;
select* from customers;
select * from customers where customer_state in('SP','SC','PR');