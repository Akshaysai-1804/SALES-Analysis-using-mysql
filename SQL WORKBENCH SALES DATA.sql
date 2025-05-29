CREATE DATABASE COMPANY;
use company;

-- Q1:Find all orders shipped via economy mode with a total 
-- amount greater than 2500  
select * FROM SALES 
where ship_mode='economy' AND total_amount>=25000;
  

-- Q2: Retrieve all sales data for 'technology' category in 
-- 'Ireland' made after 2020-01-01
select * FROM SALES
WHERE Country='Ireland' AND category='technology' 
AND Order_Date>'2020-01-01';


-- Q3:list the top 10 most profitable sales transactions in descending order
select * FROM SALES
order by unit_profit desc
LIMIT 10;            -- TOP 10 Transactions

select * FROM SALES
order by unit_profit desc
LIMIT 10,20;            -- skip 10 record, showing next 20 records


-- Q4:Find all the customers whose name start with 'j' and ends with 'n'
select order_id, customer_Name FROM SALES
WHERE Customer_Name like 'J%N';


-- Q5:Retrieve all product names that contain 'Acco' anywhere in the name
select order_id, Product_Name FROM SALES
where product_Name like "%Acco%";


-- Q6:Get the top 5 cities with the highest total sales amount
select city, SUM(Total_amount) AS Total_sales 
FROM SALES
GROUP BY city
ORDER BY total_sales DESC
Limit 5;

-- Q7:Display the second set of 10 records for customer_name and total_amount 
--  in decreasing order.
select Customer_Name,Total_Amount
FROM SALES
ORDER BY Total_Amount DESC
LIMIT 10, 10; 


-- Q8:Find the total revenue, average unit cost, and total no.of oders.
SELECT SUM(TOTAL_AMOUNT) AS `total_revenue`,
  AVG(UNIT_COST) AS `average_unit_cost`,
  COUNT(ORDER_ID) AS `total number of orders`
FROM SALES;

-- Q9:Count unique number of region
SELECT COUNT(DISTINCT region) AS unique_regions
FROM SALES;

-- Q10: Find the number of orders placed by each customer.alter
SELECT customer_name, COUNT(order_id) AS Order_count
FROM SALES
GROUP BY Customer_Name 
ORDER BY Order_count DESC;

-- Q12: Rank 5 products based on total sales using Rank()
SELECT product_Name, SUM(Total_Amount) AS Total_sales,
       RANK() OVER (ORDER BY SUM(Total_Amount)DESC) AS Sales
FROM SALES
GROUP BY Product_Name
LIMIT 5;

  
