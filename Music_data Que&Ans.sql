use  music_data;

/* Q1: Who is the senior most employee based on job title? */
 
select * from employee;

select employee_id,last_name,first_name, title, levels
from employee
order by levels desc
limit 1;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q2: Which countries have the most Invoices? */

select * from invoice;

select count(*) as most_Invoices , billing_country
from invoice
group by billing_country
order by billing_country desc;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q3: What are top 3 values of total invoice? */

select * from invoice;

select count(*) as top3 , total, billing_country
from invoice 
group by total, billing_country
order by  total desc
limit 3;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals */

select * from customer;

select * from invoice;

select * from invoice_line;

select sum(total) as Total_invoices , Billing_city
from invoice
group by billing_city
order by Total_invoices desc
limit 1  ;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

select * from customer ;

select * from invoice;

select customer. customer_id, customer. first_name, customer.last_name , sum(total) as total_spending 
from customer 
join invoice on customer.customer_id = invoice.customer_id
group by customer. customer_id
order by total_spending desc
limit 1;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

select * from genre;

select * from customer;

select * from invoice_line;

select * from invoice;

select * from track;

select distinct email as Email, first_name as FirstName, last_name as LastName 
from customer 
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id =invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id  
where lower(genre.name) like '%rock%'
order by email ;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q7: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

select * from track;

SELECT name, milliseconds 
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) AS avg_track_length
    FROM track
)
ORDER BY milliseconds DESC;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q8: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */

/* Steps to Solve:  There are two parts in question- first most popular music genre and second need data at country level. */

WITH popular_genre AS 
(
    SELECT COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name, genre.genre_id, 
	ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo 
    FROM invoice_line 
	JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
	JOIN customer ON customer.customer_id = invoice.customer_id
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN genre ON genre.genre_id = track.genre_id
	GROUP BY 2,3,4
	ORDER BY 2 ASC, 1 DESC
)
SELECT * FROM popular_genre WHERE RowNo <= 1;

------------------------------------------------------------------------------------- 0000 ---------------------------------------------------------------------------------------