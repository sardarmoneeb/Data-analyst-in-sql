SELECT * FROM houseprice;
Select area,price from houseprice;
SELECT * FROM houseprice WHERE price > 1000000;
SELECT * FROM houseprice WHERE parking > 0;
SELECT AVG(price) AS avg_price FROM houseprice;
SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM houseprice;
SELECT SUM(room) AS total_rooms FROM houseprice;
SELECT COUNT(*) AS total_houses FROM houseprice;
SELECT area, AVG(price) AS avg_price FROM houseprice GROUP BY area;
SELECT area, COUNT(*) AS total_houses FROM houseprice GROUP BY area;
SELECT elevator, AVG(price) AS avg_price FROM houseprice GROUP BY elevator;
SELECT * FROM houseprice ORDER BY price DESC LIMIT 10;
SELECT * FROM houseprice ORDER BY price ASC LIMIT 20;
SELECT * FROM houseprice WHERE room > 20 AND elevator = 13;
SELECT * FROM houseprice WHERE area IN ('DHA', 'Bahria Town');
-- Price ko categorize karna
SELECT price,
       CASE 
           WHEN price < 50000000 THEN 'Cheap'
           WHEN price BETWEEN 50000000 AND 350000000 THEN 'Medium'
           ELSE 'Expensive'
       END AS price_category
FROM houseprice;
