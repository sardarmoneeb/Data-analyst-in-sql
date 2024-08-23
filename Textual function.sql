select* from sellers;
select length(trim(seller_city))from sellers;

select concat(seller_city," - ",seller_state)as city_state from sellers;

select *, concat(seller_city," - ",seller_state)as city_state from sellers;
select * from customers;
select *from products;
select count(product_category) from products;
select length(product_category) from products;