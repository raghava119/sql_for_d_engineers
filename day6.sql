----CASE STATEMENTS
--- it evaluates the list of conditions and returns a value , when the first condition is met 
---syntax of the case statement 
---/CASE 
--  WHEN condition1 THEN result1
-- WHEN condition2 THEN result2
--  WHEN conditionn THEN resultn
-- else result 
---END  

---use cases of CASE statement

---categorizing the data (grouping the data into different categories based on the certain conditions)

--- sql task 
-- generate a  report showing the total sales for each category 
--high if the slaes i greater than 50 
-- medium if sales between 20 and 50 
--low if sales equao to 20 or less 
---sort the categories from the lowest to highest 

------
select category,
sum(t.sales)as total_sales_by_category
from
(select 
orderid, quantity,sales,
case 
when sales > 50 then 'high'
when  sales >20 then 'medium'
else 'low'
end as category
from 
sales.orders
)t
group by category 
order by total_sales_by_category desc

---retrieve the employee details gender as full text 

select 
employeeid,
firstname,
lastname,
gender,
case when gender = 'M' then 'Male'
when gender = 'F' then 'Female'
end as full_gender
from sales.employees

---