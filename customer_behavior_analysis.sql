CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers(
Customer_ID INT,
Gender VARCHAR(10),
Age INT,
City VARCHAR(50),
Membership_Type VARCHAR(50),
Total_Spend FLOAT,
Items_Purchased INT,
Average_Rating FLOAT,
Discount_Applied VARCHAR(10),
Days_Since_Last_Purchase INT,
Satisfaction_Level VARCHAR(50)
);
SHOW TABLES;
SELECT * FROM customers;

-- [1] Which membership type generates the highest total revenue?
SELECT Membership_Type, SUM(Total_Spend) AS Total_Revenue
FROM customers
GROUP BY Membership_Type
ORDER BY Total_Revenue DESC;

-- [2] What is the average spend by gender?
SELECT Gender, AVG(Total_Spend) AS Avg_Spend
FROM customers
GROUP BY Gender;

-- [3] Which city has the highest number of customers?
SELECT City, COUNT(*) AS Customer_Count
FROM customers
GROUP BY City
ORDER BY Customer_Count DESC;

-- [4] Which age group uses discounts the most?
SELECT 
  CASE 
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30-50'
    ELSE 'Over 50'
  END AS Age_Group,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Discount_Applied = TRUE THEN 1 ELSE 0 END) AS Used_Discount
FROM customers
GROUP BY Age_Group;

-- [5] What is the average satisfaction level by membership type?
SELECT Membership_Type, AVG(Average_Rating) AS Avg_Rating
FROM customers
GROUP BY Membership_Type;

-- [6] What is the total spend per city?
SELECT City, SUM(Total_Spend) AS Total_Spend
FROM customers
GROUP BY City
ORDER BY Total_Spend DESC;

-- [7] How does the number of items purchased relate to satisfaction level?
SELECT Satisfaction_Level, AVG(Items_Purchased) AS Avg_Items
FROM customers
GROUP BY Satisfaction_Level
ORDER BY Avg_Items DESC;


