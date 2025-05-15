---- joins 
---Inner joins 

--get all the customers along with their orders, but for only customres who placded an order

select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales from 
customers c 
inner join  orders o
on c.id = o.customer_id


---left join 

-- get all the customers along with their order, including those without order

select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales from 
customers c 
left  join  orders o
on c.id = o.customer_id



---Right Join 

select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales from 
customers c 
right  join  orders o
on c.id = o.customer_id




----GET ALL CUSTOMERS ALONG WITH THEIR ORDERS , ALONG WITH THOSE ODERS WITHOUT HAVING CUSTIOMERS DETAILS USING 
--LEFT JOIN

select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from orders o 
left join customers c 
on o.customer_id = c.id


----FULL JOIN 
--- get all customers and orders, even if there is no match 
select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from orders o 
full join customers c 
on o.customer_id = c.id


---LEFT ANTI JOIN
--- get all the customers ,who havent placed any oder 
select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from  customers c 
left join  orders o 
on o.customer_id = c.id
where o.customer_id is null



---RIGHT ANTI JOIN 
--get all the orders, who have not our regular customers 
select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from  customers c 
right join  orders o 
on o.customer_id = c.id
where c.id is null

--get all the orders, who have not our regular customers using left anti join 

select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from orders o   
left join  customers c 
on o.customer_id = c.id
where c.id is null


---FULL ANTI JOIN
--- find order wihtout customers and cutomers without orders
select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from orders o   
FULL join  customers c 
on o.customer_id = c.id
where c.id is null or  o.customer_id  is null


---get all the customers along with their orders, but only for customers who placed an order 

select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from  customers c 
left  join  orders o   
on o.customer_id = c.id
where o.customer_id is not  null


select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from  customers c 
inner  join  orders o   
on o.customer_id = c.id

---CROSS JOIN 
select c.id,c.first_name,c.country,c.score,o.order_id,o.order_date,o.sales
from  customers c 
CROSS  join  orders o   

