CREATE DATABASE coffee_shop;

USE coffee_shop

SELECT * FROM coffe_shop_sales

-- Which location recorded the highest number of sales
SELECT store_location,
ROUND(SUM(Sales),2) AS total_sales,
COUNT(transaction_id) AS transaction_count
FROM coffe_shop_sales
group by store_location;


-- what is the sales trend over time
-- daily
SELECT transaction_date,
ROUND(SUM(SALES), 2) AS total_daily_sales
FROM coffe_shop_sales
GROUP BY transaction_date
ORDER BY transaction_date;

-- weekly
SELECT day_of_the_week,
ROUND(SUM(SALES), 2) AS weekly_sales
FROM coffe_shop_sales
GROUP BY day_of_the_week
ORDER BY weekly_sales DESC;

-- monthly
SELECT month,
ROUND(SUM(SALES),2) AS monthly_sales
FROM coffe_shop_sales
GROUP BY month
ORDER BY monthly_sales DESC;


-- sales by location on different days of the  week
SELECT day_of_the_week,
store_location,
ROUND(SUM(Sales),2) AS Sales_by_day
FROM coffe_shop_sales
GROUP BY store_location, day_of_the_week
ORDER BY Sales_by_day DESC;

    
    
 -- sales by category
 SELECT product_category,
 ROUND(SUM(Sales), 2) AS sales_by_category,
 COUNT(transaction_id) AS transaction_count
 FROM coffe_shop_sales
 GROUP BY product_category
 ORDER BY sales_by_category DESC;


 -- hourly sales by product category
SELECT
    hour,
    ROUND(SUM(CASE WHEN product_category = 'Bakery' THEN Sales ELSE 0 END), 2) AS Bakery,
    ROUND(SUM(CASE WHEN product_category = 'Branded' THEN Sales ELSE 0 END), 2) AS Branded,
    ROUND(SUM(CASE WHEN product_category = 'Coffee' THEN Sales ELSE 0 END), 2) AS Coffee,
    ROUND(SUM(CASE WHEN product_category = 'Coffee beans' THEN Sales ELSE 0 END), 2) AS Coffee_beans,
    ROUND(SUM(CASE WHEN product_category = 'Drinking Chocolate' THEN Sales ELSE 0 END), 2) AS Drinking_Chocolate,
    ROUND(SUM(CASE WHEN product_category = 'Flavours' THEN Sales ELSE 0 END), 2) AS Flavours,
    ROUND(SUM(CASE WHEN product_category = 'Loose Tea' THEN Sales ELSE 0 END), 2) AS Loose_Tea,
    ROUND(SUM(CASE WHEN product_category = 'Packaged Chocolate' THEN Sales ELSE 0 END), 2) AS Packaged_Chocolate,
    ROUND(SUM(CASE WHEN product_category = 'Tea' THEN Sales ELSE 0 END), 2) AS Tea
FROM
    coffe_shop_sales
GROUP BY
    hour
ORDER BY
    hour ASC;


-- sales by product type
SELECT product_type,
ROUND(SUM(Sales), 2) AS sales_by_product_type,
ROUND(AVG(unit_price), 2) AS unitPrice
FROM coffe_shop_sales
GROUP BY product_type
ORDER BY sales_by_product_type DESC;


-- product sales by category and type
SELECT product_type,
product_category,
ROUND(SUM(Sales),2) AS sales
FROM coffe_shop_sales
GROUP BY product_type, product_category
ORDER BY sales DESC;


-- hourly sales per location
SELECT store_location,
hour,
ROUND(SUM(Sales), 2) AS Hourly_sales_by_location
FROM coffe_shop_sales
GROUP BY store_location, hour
ORDER BY Hourly_sales_by_location DESC;
