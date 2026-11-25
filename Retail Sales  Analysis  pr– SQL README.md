Retail Sales Project Analysis – SQL
Your project is a Retail Sales Data Analysis project using SQL. It focuses on analyzing sales transactions, customer information, product categories, revenue, and purchasing patterns using SQL queries.

The main purpose of this project is to convert raw retail sales data into meaningful business insights that can help a company understand its sales performance and customer behavior.

Based on your uploaded SQL project file.
1. Project objective
The objective of this project is to:
- Analyze retail sales transactions.
- Calculate total revenue for each product category.
- Identify high-value transactions.
- Understand customer purchasing behavior.
- Find the best-selling months.
- Identify top-spending customers.
- Analyze sales based on gender and time of day.
This project demonstrates how SQL can be used for data analysis and business decision-making.
2. Database and table structure
Your SQL script creates a database named:

reatail_sales_project_analysis

Inside the database, you create a table called retail_sales.

The table contains the following columns:
Column	Description
transactions_id	Unique transaction ID
sale_date	Date of the sale
sale_time	Time of the sale
customer_id	Customer identification number
gender	Customer gender
age	Customer age
category	Product category
quantiy	Quantity purchased
price_per_unit	Price of one unit
cogs	Cost of goods sold
total_sale	Total transaction amount

The table uses transactions_id as its primary key, ensuring that each transaction has a unique identifier. reatail_sales_project_analysis.sql

3. Main SQL concepts used in your project

Database and table creation

CREATE DATABASE, CREATE TABLE, and USE are used to create and select your database.




Filtering data

WHERE, AND, YEAR(), and MONTH() help retrieve transactions based on specific conditions.




Aggregate functions

SUM(), AVG(), COUNT(), and ROUND() calculate revenue, average customer age, and transaction counts.




Advanced SQL

GROUP BY, ORDER BY, CTEs, RANK(), DENSE_RANK(), and CASE WHEN are used for deeper analysis.



4. Important analysis performed
A. Sales analysis
Your project retrieves:
- Sales made on a particular date.
- Clothing sales in November 2022 where quantity is at least 4.
- Total sales revenue for each product category.
- Transactions with a total sale greater than ₹1,000.
Example from your project:
SELECT category, SUM(total_sale) AS sales_by_category
FROM retail_sales
GROUP BY category;


Business insight: This query helps identify which product categories generate the most revenue.
B. Customer analysis
Your project analyzes:
- Average age of customers purchasing Beauty products.
- Total transactions by gender in each category.
- Top 5 VIP customers based on total expenditure.
- Unique customers purchasing each product category.
Business insight: These queries help a business understand its customers and identify valuable customer segments.
C. Monthly sales analysis
You use a CTE and the DENSE_RANK() window function to find the best-selling month in each year.
DENSE_RANK() OVER (
    PARTITION BY YEAR(sale_date)
    ORDER BY SUM(total_sale) DESC
)


This is one of the more advanced parts of your project.

Business insight: A company can identify its strongest sales months and plan promotions or inventory accordingly.
D. Sales shift analysis
Your project categorizes sales into three shifts:
- Morning: Before 12 PM
- Afternoon: 12 PM to before 5 PM
- Evening: 5 PM onwards
You then count the transactions in each shift.

Business insight: This helps understand when customers make the most purchases.
5. What makes this project useful?
This project demonstrates practical SQL skills that are relevant to a Data Analyst or SQL Developer role.

It shows that you can:
- Create and manage databases.
- Write queries to retrieve data.
- Perform sales and customer analysis.
- Use aggregate functions.
- Work with CTEs and window functions.
- Apply conditional logic using CASE.
- Generate business insights from transaction data.
6. Improvements you should make
I noticed a few things in your SQL file that you should correct before presenting the project.

1. Correct the spelling of the quantity column

Your column is named quantiy. It would be better to rename it to quantity for professional readability.

2. Fix the unique customer count query

Your current query is:
SELECT category, COUNT(DISTINCT customer_id) AS customers
FROM retail_sales;


It should include GROUP BY category:
SELECT category,
       COUNT(DISTINCT customer_id) AS customers
FROM retail_sales
GROUP BY category;


This calculates the number of unique customers in each category.

3. Improve the sales status classification

Your current query classifies transactions as High, Medium, or Low based on total sale. You could make the thresholds clearer and use consistent capitalization.

4. Add a profit analysis

Since your table contains total_sale and cogs, you can calculate profit:
SELECT
    SUM(total_sale) AS total_revenue,
    SUM(cogs) AS total_cost,
    SUM(total_sale - cogs) AS total_profit
FROM retail_sales;


This would make your project more valuable because it analyzes not only sales revenue but also profitability.

7. How to explain this project in an interview
Here is a simple explanation you can practice:
My project is Retail Sales Data Analysis using SQL.

The main objective of this project is to analyze retail sales data and extract useful business insights.

I created a database and a retail sales table containing transaction details such as transaction ID, sale date, customer ID, product category, quantity, price, cost, and total sales.

I used SQL queries to analyze sales revenue by category, customer purchasing behavior, high-value transactions, monthly sales performance, and sales distribution by time of day.

I also used advanced SQL concepts such as Common Table Expressions, window functions, DENSE_RANK, aggregate functions, and CASE statements.

This project helped me improve my SQL skills and understand how data analysis supports business decision-making.




One important point: Your SQL file contains the database structure and analysis queries, but it does not show the actual query results or final business findings. So, in an interview, avoid claiming specific sales figures or saying which category performed best unless you have executed the queries and verified the results.
