-- For viewing data base 
SHOW DATABASES;

-- For viewing tables 
SHOW talbes;

-- For using database
USE e_commerce;


-- Top-selling Products: Retrieve the top N products (based on the total quantity sold) during a specific time period.
SELECT p.product_name as product_name, sum(o.quantity) AS  total_quantity_sold, sum(o.quantity * o.item_price) as revenue_per_product
FROM products p
JOIN order_items o ON o.product_id = p.product_id
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- Most Valuable Customers: Identify the top N customers who have made the highest total purchase amount during a specific time period.
SELECT c.customer_name as top_customer_name, sum(o.amount) as amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY top_customer_name
ORDER BY amout DESC
LIMIT 5;


-- Inventory Management: Find products with low stock quantities (below a specified threshold) to help in inventory management.
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 20;


-- which is the most use mode of payment 
SELECT DISTINCT payment_method, count(payment_method)
FROM payment
GROUP BY payment_method;


-- Top Categories by Revenue:
-- Determine the top N product categories that contribute the most to the overall revenue. 
-- Consider both the quantity sold and the total sales amount. 
SELECT DISTINCT p.category AS category, sum(o.quantity * o.item_price) as revenew_per_category 
FROM products p
JOIN order_items o ON p.product_id = o.product_id
GROUP BY category 
ORDER BY 2 DESC;



-- Customer Segmentation:
-- Write a query to segment customers based on their total purchase amount. 
-- For example, categorize them as "High-Spending," "Medium-Spending," and "Low-Spending" customers.

SELECT c.customer_name as cus_names, o.amount AS amount, 
CASE 
    WHEN o.amount > 1200 THEN 'High_Spending'
    WHEN o.amount < 1200 AND o.amount > 600 THEN 'Medium-Spending'
    ELSE'Low-Spending'
END AS Customer_Segmentation
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;