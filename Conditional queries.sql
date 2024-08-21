select * from payments;
select * from payments where payment_type="credit_card" and payment_value >= "500";
select *from payments where payment_type="UPI" and payment_value >=1000 and payment_installments = 1;

select * from payments where not(payment_type="credit_card" or payment_value >= "500") limit 0,20;
select * from payments where payment_value between 200 and 500 limit = 0,30;
