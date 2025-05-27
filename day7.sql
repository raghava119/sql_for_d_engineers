---Aggregation functions
-----sql aggregation function
--count,sum,min,max,avg

--find the total number of orders

select count(*)
from 
sales.orders

----find the total slaes of all orders using sum
select sum(sales) as total_sales
from 
sales.orders

---find the average slaes using avd

select avg(sales) as avg_sales
from 
sales.orders

--find the highest sales of all order
select max(sales) as highest_sales
from 
sales.orders
--find the lowest sales of all the order
select min(sales) as lowest_sales
from 
sales.orders



---window functions
-- find the total sales for each product , additionally provide details such as productid,order_date


select 
	productid,
	orderdate,
	sum(sales) over(partition by productid) as total_sales

from 
sales.orders



---checking the duplicates in a table 
select * from 
(select 
orderid,
count(*) OVER(PARTITION BY orderid) as pk_keeyy
from 
sales.orders)tt
where tt.pk_keeyy >1

-----find the average sales across all order 
----find the average sales for each product 
---additionally provide deatils such as order_id, orderdate 
SELECT 
    orderid, 
    orderdate,
	productid,
    ROUND(AVG(sales) OVER(), 0) AS average_sales,
    ROUND(AVG(sales) OVER (PARTITION BY productid), 0) AS average_sales_product
FROM 
    sales.orders;
--find the average score of the customers, additionally provide details such as customer_id and last_name 
select 
	customerid, 
	lastname,
	score,
	round(avg(score) over(),0) as average_Score,
	round(avg(coalesce(score,0)) over(),0) as average_Score_without_null
from sales.customers

--find all orders where sales are higher than the average sales across all orders 
select tt.orderid,  tt.average_sales , tt.sales
from 
(
select 
	 orderid, 
    orderdate,
	sales,
	productid,
    ROUND(AVG(sales) OVER(), 0) AS average_sales,
    ROUND(AVG(sales) OVER (PARTITION BY productid), 0) AS average_sales_product
from sales.orders)tt
where tt.sales > tt.average_sales 


----  find the highest and lowest sales across all the orders 
----find the highest and lowest sales product wise 
---additonally provide details such as orderid and orderdate 


select 
orderid, orderdate,
min(coalesce (sales,0)) over() min_sales,
max(coalesce(sales,0)) over() max_sales,
min(coalesce (sales,0)) over(partition by productid) min_sales_productwise,
max(coalesce(sales,0)) over(partition by productid) max_sales_productwise
from sales.orders

----running total  and rolling total 
---tracking current sales with the target sales
---running total : aggregate all the values from the begininng upto the current point without dropping off the older data
--rolling total : aggragate all values within a specific time window (eg : 30 days), as the new data is adding , old data will be dropped off 
--
select 
orderid, 
orderdate,
sales,
extract (MONTH FROM orderdate) as month_nm,
sum(sales)over( partition by extract (MONTH FROM orderdate) order by extract (MONTH FROM orderdate)) as total_running_sales
from sales.orders


----ROLLING TOTAL 
select 
orderid, 
orderdate,
sales,
extract (MONTH FROM orderdate) as month_nm,
sum(sales)over( partition by extract (MONTH FROM orderdate) order by extract (MONTH FROM orderdate)
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ) as total_running_sales
from sales.orders


---Calculate the moving average of sales for each product over time 
select 
orderid,
productid,
sales,
round(avg(sales) over(partition by productid order by orderdate)) as movingavg,
round(avg(sales) over(partition by productid )) as overall_avg
from sales.orders
