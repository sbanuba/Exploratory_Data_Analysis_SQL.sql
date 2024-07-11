-- Exploratory Data Analysis Using SQL 
-- https://github.com/sbanuba/Exploratory_Data_Analysis_SQL.sql/blob/main/README.md

-- Business Cases:

--1. Finding the top-performing products and the states where the sales are coming from. In this case, you’ll need to pull out each product name, order, and state and LIMIT to 10 as specified.

SELECT
    product_name              
    , region_state              
    , SUM(order_quantity) AS total_sales  
FROM sales s                      
INNER JOIN products p ON s.product_id = p.id
INNER JOIN stores st ON s.store_id = st.id
INNER JOIN regions r  ON r.state_code = st.state_code
GROUP BY product_name, region_state  
ORDER BY total_sales DESC       
LIMIT 10;                       



-- As a multi-channel business, management would like to know which sales channel brings in the most sales. To answer this, pull the sale channels and count the number of orders per channel.

SELECT
   sale_channel
   , COUNT(order_quantity) orders_per_channel
FROM sales
GROUP BY sale_channel;


-- The marketing team would like to know all customers with total orders of less than 300 units in the year 2020

SELECT
    c.id
    , customer_name
    , SUM(order_quantity) AS total_sales
FROM sales s
INNER JOIN customers c ON s.customer_id = c.id
WHERE YEAR(order_date) = 2020
GROUP BY customer_name
HAVING SUM(order_quantity) < 300;




--  Customer acquisition and retention are vital for business growth. To understand the buying behavior of customers over time, cohort analysis is imperative.Based on that, the marketing department can measure the success of a marketing campaign, as well as implement a strong retention strategy.


SELECT
    x.customer_id
    , x.product_id
    , x.store_id
    , p.product_name
    , st.city_name
    , x.FO_date
    , x.order_date
    , x.order_quantity
    , p1.product_name AS FO_product_name
    , st1.city_name AS FO_city_name
    , x.order_rank
    , TIMESTAMPDIFF(MONTH, x.FO_date, x.order_date) AS cohort
FROM
( --Finding the first order and repeat order behavior of the customers across the entire period.
    SELECT
        customer_id
        , product_id
        , order_date
        , order_quantity
        , store_id
        , FIRST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS FO_date
        , FIRST_VALUE(store_id) OVER (PARTITION BY customer_id ORDER BY order_date) AS FO_store_id
        , FIRST_VALUE(product_id) OVER (PARTITION BY customer_id ORDER BY order_date) AS FO_product
        , RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank
    FROM sales s
) x
LEFT JOIN products p ON x.product_id = p.id
LEFT JOIN products p1 ON x.FO_product = p1.id
LEFT JOIN stores st ON x.store_id = st.id
LEFT JOIN stores st1 ON x.FO_store_id = st1.id;



-- Print a table showing each day of the week and the respective order quantities.

SELECT
    DAYOFWEEK(order_date) AS day_of_week
    , DAYNAME(order_date) AS Day_name
    , SUM(order_quantity) AS order_quantity
FROM sales s
GROUP BY Day_name, day_of_week;



-- Calculate the total order quantities for each month

SELECT
    MONTH(order_date) AS month_number
    , MONTHNAME(order_date) AS name_of_month
    , SUM(order_quantity) AS order_per_month
FROM sales s
GROUP BY month_number, name_of_month;



-- Finally, management would like to know the annual trend of sales to assess the growth over the entire period

SELECT
    YEAR(order_date) AS order_year
    , SUM(order_quantity) AS order_per_year
FROM sales
GROUP BY order_year;
