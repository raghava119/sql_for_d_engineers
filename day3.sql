select * from sales.customers;
select * from sales.employees;

select * from sales.orders;
select * from sales.ordersarchive;
select * from sales.products;


---TASK 
--- using salesDB ,retrieve all the list of orders,along with the related customer, product and employee details 
---- For each  order display : orderID, customer's name, product name , sales, price, sales person's name 

select o.orderid,c.firstname as customer_name,o.sales,p.product,p.price, e.firstname as sales_person_name from 
sales.orders o 
left join sales.customers c
on o.customerid = c.customerid 
left join sales.products p 
on o.productid = p.productid
left join sales.employees e
on o.salespersonid = e.employeeid 





-----set operators
--RULES FOR SET OPERATORS :
---NO OF COLUMNS IN EACH QUERY MUST BE SAME
--DATA TYPES SHOULD BE SAME IN THE BOTH TABLES 
--ORDER OF COLUMNS IN EACH QUERY MUST BE SAME (EG : firstname, lastname --- firstname,lastname)
--order by only used only once
----UNION (return all distinct rows --means its gonna combine and return everything), remove the duplicates 

select  firstname, lastname 
from sales.customers 
union 

select  firstname, lastname 
from  sales.employees

----
select  customerid, lastname 
from sales.customers 
union 
select  employeeid, lastname 
from  sales.employees

----wroong mentioning of columns (we have to follow order)
select  lastname, customerid 
from sales.customers 
union 
select  employeeid, lastname 
from  sales.employees


----naming conventions should only be done in first query , it will ignore if you do it in the second query 

select customerid  as id ,  lastname name
from sales.customers 
union 
select  employeeid, lastname 
from  sales.employees



----UNION ALL 
----returns all the rows from both the queries ,including the duplicates 
---note (kevin , mary are the duplicates in this )
select  firstname, lastname 
from sales.customers 
union all

select  firstname, lastname 
from  sales.employees

---EXCEPT 
---return all the distinct rows from the first query that are not in the second query
select  firstname, lastname 
from sales.customers 
except 
select  firstname, lastname 
from  sales.employees

---find the employees who are not customers 
select  firstname, lastname 
from sales.customers 
except 
select  firstname, lastname 
from  sales.employees


----INTERSECT 
---it will return only those rows which are in the both tables
select  firstname, lastname 
from sales.customers 
intersect 
select  firstname, lastname 
from  sales.employees
----find all the employeees who are also customers
select  firstname, lastname 
from sales.customers 
intersect 
select  firstname, lastname 
from  sales.employees


----	TASK
---orders are separated into two tables orders, orders_archive , now combine these two tables without duplicates
select * ,'orders_archive' as source_table 
from sales.ordersarchive

union 
select * ,'orders' as source_table
from sales.orders
order by orderid


----EXCEPT USE CASE 
--- DELTA DETECTION 
----Identify the differences or changes (delta) between two batches of data 
---DATA COMPLETENESS CHECK 
--- Except operator is used to compare tables to detect descripencies between databases
