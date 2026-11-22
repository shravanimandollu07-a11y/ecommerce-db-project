--- View 1: User Name, Order ID, Order Date, Total Amount
USE ecommerce_db;
CREATE OR REPLACE VIEW view_user_orders AS
SELECT 
  u.full_name AS User_Name,
  o.order_id AS Order_ID,
  o.order_date AS Order_Date,
  o.total_amount AS Total_Amount
FROM `Orders` o
JOIN `Users` u ON o.user_id = u.user_id;

SELECT * FROM view_user_orders;

CREATE OR REPLACE VIEW view_order_details AS
SELECT 
  oi.order_id AS Order_ID,
  p.product_name AS Product_Name,
  oi.quantity AS Quantity,
  oi.price AS Price,
  (oi.quantity * oi.price) AS Line_Total
FROM `Order_Items` oi
JOIN `Products` p ON oi.product_id = p.product_id;

SELECT * FROM view_order_details;