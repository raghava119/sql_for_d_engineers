--- ROW level Functions 

---Two types of functions 
--1.Single row functions 
---2.Multi row functions

--1.Single row functions 
  -- string functions
  --numeric functions 
  ---date time functions 
  ---Null functions 
---2.Multiple row funtions(Aggregations)
   --1.Aggregation functions (Basics like sum, min,max,avg)
   ---2.Window functions (Advance)

---string functions 
--string functions are divided into three main categories
--1.Manipuation functions (concat(),upper(),lower(),trim(),replace())
--2.calculation functions (len())
--3.string Extraction (left(),right(),substring())


---CONCAT()
---combines multiple string values into one value

--use case
select CONCAT(firstname,' ',lastname) as name 
from 
sales.customers
----
select CONCAT(firstname,' ',country) as new_concat 
from 
sales.customers


----UPPER() , LOWER()
--used to convert lower case letter into upper case and vice versa
---use case

select upper(firstname) as upper_Case_name
from 
sales.customers


-----
select lower(firstname) as upper_Case_name
from 
sales.customers

---TRIM() Function is used to remove the spaces 
SELECT TRIM('  John    Doe  ');

------REPLACE

SELECT REPLACE('4111-1111-1111-1111', '-', '*********');

select replace('201-887-1854','-',' ')



----calculation function 
--length 
select 
length('virat') as count_name 


select length ('2026-10-11') as lin


---extraction 
select left('new',2) as nn

select right('new',2) as ri

select substring('viratkohli',2,length('viratkohli'))



-----Number functions

---ROUND 
select round(3.12499,2)

----ABS
Select abs(-988)
----


