----DATE AND TIME FUNCTIONS
SELECT orderdate,shipdate,creationtime FROM sales.orders

select now()
select getdate()


----functions
----part extraction
---extract day from orderdate columns 
SELECT EXTRACT(YEAR FROM creationtime) AS yearr
FROM sales.orders;

select extract(day from creationtime) as dayy, creationtime
FROM sales.orders;

select date_trunk(minutes,creationtime) as ct from 
sales.orders


SELECT DATE_PART('year', creationtime) AS dnn
FROM sales.orders;

SELECT DATE_PART('month', creationtime) AS dnn
FROM sales.orders;

SELECT DATE_PART('day', creationtime) AS dnn
FROM sales.orders;

select date_part ('hours',creationtime) as hh
FROM sales.orders;
select date_part ('minutes',creationtime) as hh
FROM sales.orders;
select date_part ('seconds',creationtime) as hh
FROM sales.orders;

select date_part ('quarter',creationtime) as hh
FROM sales.orders;
select date_part ('week',creationtime) as h
FROM sales.orders
SELECT TO_CHAR(creationtime, 'month') AS day_name
FROM sales.orders;
SELECT TO_CHAR(creationtime, 'day') AS day_name
FROM sales.orders;


SELECT DATE_TRUNC('seconds', creationtime) AS month
FROM sales.orders


select * FROM sales.orders
-----How many orders were placed each year 

SELECT count(orderid) as order_id, EXTRACT(YEAR FROM orderdate) AS year_of_order
FROM sales.orders
group by EXTRACT(YEAR FROM orderdate) 

----how many orders were placed each month 

SELECT count(orderid) as order_id,  TO_CHAR(February , 'Month') AS month_of_order 
FROM sales.orders
group by TO_CHAR(orderdate, 'Month')
---select all the orders placed on the month of feb


SELECT *
FROM sales.orders
where extract(month from  orderdate ) = 2


----Formatting and casting in date 
---  TOCHAR

SELECT   TO_CHAR(creationtime, 'FMMonth') AS month_dn
FROM sales.orders


SELECT   TO_CHAR(creationtime, 'mon DD YYYY') AS month_dn
FROM sales.orders


select CAST('123' AS INTEGER) as cov
SELECT CAST ('2025-09-12' as date) dn

-----NULL Functions
---COALESCE, return always first non null value  or we can replace the null values with the default value 

SELECT COALESCE(NULL, NULL, 'Hello', 'World');  -- Returns 'Hello'
--use case 
SELECT COALESCE(shipaddress, 'N/A') , shipaddress FROM sales.orders;

---usually we will replace the null values in a cloumn before doing aggregation
---task ....Find the average score of the customers
select 
AVG(COALESCE(score,0)) as avg_score
from 
sales.customers


select 
AVG(score) as avg_score
from 
sales.customers


----Handling the null values before doing any mathematical calculations
---task ... Display the full name of customers in a single field by merging their first and last name and add 10 bonus points to each custoemrs score
SELECT customerid ,
firstname || ' ' || COALESCE(lastname, ' ')AS full_name,
COALESCE(score,0) +  10 as updated_score  

FROM sales.customers;


----sorting the scores of the customers , showing null at the end of the list
select customerid ,  score 
from sales.customers
order by score desc;
