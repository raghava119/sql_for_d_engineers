select * from customers where score !=0;
select order_id, customer_id from orders;


select * from customers where country like 'Germany'


----order by 

select * from customers
order by score



select * from customers
order by score desc



----------nested order by 

select * from customers
order by country,score 
select * from customers
order by country asc,score desc

select * from customers
order by score ,country

---- group by 
-- find the total scores of each country
select country, sum(score) as scores from customers
group by country
order by scores desc

-- find the total score and total number of customers of each country 
select country, sum(score) as Total_scores,count(id) as total_customers from customers
group by country
order by Total_scores desc


-- HAVING cluase, we can filter the data after the aggregation, can be used only with group by
-- find the average score for each country ,
---considering only customer score > zero and return only those countries whose average > 430
select  country,avg(score) as average_score
from 
customers
where score != 0
group by country
having avg(score) >430



----LIMIT function


select  * 
from customers
LIMIT  3 


----retreieve the top 3 customers of highest score
select * 
from customers
order by  score desc 
limit 3 

---retrieve the lowest 2 customers based on the score 
select * 
from customers
order by  score  
limit 2
---get two most recent orders from the order table

select * from orders
order by  order_date desc
limit 2  


--------filtering the data (intermdiate level)
--comparison opreators 

select * from 
customers
where country = 'Germany'


select * from 
customers
where country != 'Germany'


select * from 
customers
where score > 500

select * from 
customers
where score >= 500


select * from 
customers
where score < 500

select * from 
customers
where score <= 500


----logical opreators

--AND 

select * from 
customers
where score <= 500 AND country = 'Germany'


--OR 

select * from 
customers
where score <= 500 OR country = 'USA'
--not

select * from 
customers
where NOT (country = 'USA' )

-----Range operators 

---BETWEEN 


select * from 
customers
where score BETWEEN 100 and 500


-----IN operator , check if a value exists in a list 

select * from 
customers
where  country in ('Germany','USA')


----not in 
select * from 
customers
where  country not  in ('Germany','USA')