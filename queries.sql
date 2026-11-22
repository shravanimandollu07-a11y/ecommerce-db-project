CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Q1. Display all products with category names
SELECT p.product_id, p.product_name, p.price, p.stock_quantity, c.category_name
FROM `Products` p
JOIN `Categories` c ON p.category_id = c.category_id;

-- Q2. Display orders by specific user
SELECT o.order_id, u.full_name, o.order_status, o.total_amount
FROM `Orders` o
JOIN `Users` u ON o.user_id = u.user_id
WHERE u.full_name = 'Aarav Sharma';

-- Q3. Out of stock
SELECT product_id, product_name, price, stock_quantity
FROM `Products`
WHERE stock_quantity = 0;

--Q4 total number of orders placed by each user
SELECT u.user_id, u.full_name, COUNT(o.order_id) AS total_orders
FROM `Users` u
LEFT JOIN `Orders` o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_orders DESC;

--Q5  Display order details with product name, quantity, and price
SELECT o.order_id, u.full_name, p.product_name, oi.quantity, oi.price, (oi.quantity * oi.price) AS line_total
FROM `Order_Items` oi
JOIN `Orders` o ON oi.order_id = o.order_id
JOIN `Users` u ON o.user_id = u.user_id
JOIN `Products` p ON oi.product_id = p.product_id
ORDER BY o.order_id;

---Q6 Find users who have placed more than 2 orders
SELECT u.user_id, u.full_name, COUNT(o.order_id) AS total_orders
FROM `Users` u
JOIN `Orders` o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name
HAVING COUNT(o.order_id) > 2;

--Q7 Display the highest priced product in each category
SELECT c.category_name, MAX(p.price) AS highest_price
FROM `Products` p
JOIN `Categories` c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- With product name also (Full answer):
SELECT c.category_name, p.product_name, p.price AS highest_price
FROM `Products` p
JOIN `Categories` c ON p.category_id = c.category_id
WHERE p.price = (
  SELECT MAX(p2.price) FROM `Products` p2
  WHERE p2.category_id = p.category_id
)
ORDER BY c.category_name;