USE credit_card_project;

-- view first 5 rows
SELECT TOP 5 *
FROM customer_info;

-- percent of customers that are attrited
SELECT (COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) * 100.0 / COUNT(*)) AS churn_pct
FROM customer_info;

-- count of customers per education level
SELECT Education_Level, COUNT(*) AS customer_count
FROM customer_info
GROUP BY Education_Level
ORDER BY 2 DESC;

-- churn percentage by education level
SELECT 
	Education_Level, 
	(COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) * 100.0 / COUNT(*)) AS churn_pct
FROM customer_info
GROUP BY Education_Level
ORDER BY 2 DESC;

-- count of customers per income category
SELECT Income_Category, COUNT(*) AS customer_count
FROM customer_info
GROUP BY Income_Category
ORDER BY 2 DESC;

-- churn percentage by income category
SELECT 
	Income_Category,
	(COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) * 100.0 / COUNT(*)) AS churn_pct
FROM customer_info
GROUP BY Income_Category
ORDER BY 2 DESC;

-- percentage of total customers by income category
SELECT Income_Category,
       COUNT(*) AS total_customers,
       (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM customer_info) AS pct_of_total_customers
FROM customer_info
GROUP BY Income_Category
ORDER BY 3 DESC;


-- count of customers per card category
SELECT Card_Category, COUNT(*) AS customer_count
FROM customer_info
GROUP BY Card_Category
ORDER BY 2 DESC;

-- churn percentage by card category
SELECT Card_Category, (COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) * 100.0 / COUNT(*)) AS churn_pct
FROM customer_info
GROUP BY Card_Category
ORDER BY 2 DESC;

-- total transaction amount by card category
WITH card_transaction AS (
    SELECT
        Card_Category,
        SUM(Total_Trans_Amt) AS total_transaction_amount
    FROM customer_info
    GROUP BY Card_Category
)
SELECT Card_Category, total_transaction_amount
FROM card_transaction
ORDER BY 2 DESC;

-- average total transaction amount for existing and attrited customers
SELECT Attrition_Flag AS existing_or_attrited, AVG(Total_Trans_Amt) AS avg_total_transaction_amt
FROM customer_info
GROUP BY Attrition_Flag
ORDER BY 2 DESC;

-- average total transaction count for existing and attrited customers
SELECT Attrition_Flag AS existing_or_attrited, AVG(Total_Trans_Ct) AS avg_total_transaction_amt
FROM customer_info
GROUP BY Attrition_Flag
ORDER BY 2 DESC;