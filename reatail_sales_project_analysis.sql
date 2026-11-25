-- creating my project database
create database if not exists reatail_sales_project_analysis ;

-- createing my base table
use reatail_sales_project_analysis;

CREATE TABLE 
retail_sales ( transactions_id
 INT PRIMARY KEY, 
 sale_date DATE, 
 sale_time TIME, 
customer_id INT,
 gender VARCHAR(15), age INT, 
category VARCHAR(35),
 quantiy INT, 
 price_per_unit decimal(10.2)
 , cogs FLOAT, 
 total_sale decimal(10.2) );
 
 
 select count(*) from retail_sales ;
 select * 
 from retail_sales
 limit 25;
 
--  Retrieve all sales made on '2022-11-05'.

select*
from retail_sales
where sale_date = '2022-11-05';

--  Clothing sales in Nov-2022 where quantity >= 4.
select *
from retail_sales
where
quantiy >=4
and category= 'clothing'
and year(sale_date) = 2022 and
month (sale_date) = 11 ;

-- Total sales revenue per product category
select category , sum(total_sale) as sals_by_category
from retail_sales
group by category ;

-- Average age of customers purchasing Beauty products
 
 select round(avg(age),0)
 from retail_sales
 where category = 'Beauty';
 
 -- All high-value transactions exceeding ₹1,000
 select*
 from retail_sales
 where total_sale>1000;
 
 -- Total transactions by gender in each category
 select category,gender,count(total_sale)
 from retail_sales
 group by category,gender 
 order by category;
 
 -- Best-selling month in each operating year
 with my_cte as 
( select year(sale_date), month(sale_date) , sum(total_sale),
 dense_rank() over (  partition by year(sale_date) order by  sum(total_sale) desc) as my_rank
 from retail_sales
 
 group by year(sale_date), month(sale_date))
 select *
 from my_cte where my_rank = 1;
 
 -- Top 5 VIP customers by total expenditure

with my_cte as
( select customer_id, sum(total_sale),
 rank () over (order by sum(total_sale)desc) as my_rank 
 from retail_sales
 group by customer_id ) 
 select * 
 from my_cte where my_rank<=5;
 
 -- Unique customer count per product category
 select category, count(distinct customer_id) as customers
 from retail_sales;
 
 select*,
 case when total_sale>500  then 'High' when total_sale>300 then 'medium' else 'low' end as status
 from retail_sales limit 25;
-- cse 

-- Order distribution by operational day shift.

with my_cte as (select sale_time ,
case when hour(sale_time)<12 then 'morning' when hour(sale_time)<17 then 'agternoon'
 else 'evening' end as shift 
from retail_sales )


select shift, count(*)
from my_cte
group by shift;
