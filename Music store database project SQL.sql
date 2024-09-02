-- create database Music_database;

select * from invoice;
-- Q1: Which country have the most invoices?
-- select count(*) as c,billing_country from invoice group by billing_country order by c desc;


-- Q2: Who is the senior most employed based on job title?
-- select * from employee;
-- select * from employee order by levels desc;

-- Q3: What are top three values of total invoice?
select * from invoice order by total desc limit 3;

-- Q4: Which city has the best customers? we will like to throw a promotional music festival from the city where we make the most money.
-- write a query that returns one city that has the highest sum of invoice totals.Return both the city name and sum of totals?

select * from invoice;
select sum(total) as invoice_totals,billing_city from invoice group by billing_city order by invoice_totals desc;

-- Q5: Who is the best customer? The customer who spent the more money will be declared the best customer.
-- write a query that return the person who has spent more money?
select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id,customer.first_name,customer.last_name order by total desc limit 1;

-- Q6: -- Write query whic return the email,first name,last name and genre of all rock music listeners.
-- Return your list ordered lphabatically by email starting with A.

select distinct email,first_name,last_name  from customer 
join invoice on customer.customer_id = invoice.customer_id 
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
select track_id from track join genre on track.genre_id = genre.genre_id
where genre.name like "Rock"
)
order by email;

-- Lets invite the artists who have written the most rock music in our dataset. 
-- Write a query that return the artist  name and total track count of top 10 rock bands?

select artist.artist_id,artist.name,count(track.track_id) as t_no_of_songs
from track 
join album2 on track.album_id = album2.album_id
join artist on artist.artist_id = album2.artist_id
join genre on track.genre_id = genre.genre_id
where genre.name like "Rock"
group by artist.artist_id,artist.name
order by t_no_of_songs desc limit 10;

-- Return all the track names that have song length longer than the average song length.
-- Return the ame and milliseconds for each track.Order by the song length  with longest songs listed first?

select name,milliseconds from track
where milliseconds > (
  select avg(milliseconds) as average_track_length from track
)
order by milliseconds desc;



