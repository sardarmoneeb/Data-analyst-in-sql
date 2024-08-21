SELECT 
    *
FROM
    customers;
SELECT 
    *
FROM
    customers
WHERE
    customer_state IN ('SP' , 'MG', 'PR');
SELECT 
    *
FROM
    customers
WHERE
    customer_state NOT IN ('SP' , 'MG', 'PR');

SELECT 
    *
FROM
    payments;
SELECT 
    *
FROM
    payments
ORDER BY payment_value;
SELECT 
    *
FROM
    payments
ORDER BY payment_value DESC;

SELECT 
    *
FROM
    payments
WHERE
    payment_installments = 1
ORDER BY payment_type DESC;
