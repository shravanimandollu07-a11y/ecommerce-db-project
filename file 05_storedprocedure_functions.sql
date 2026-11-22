USE ecommerce_db;
DROP PROCEDURE IF EXISTS AddNewProduct;
DELIMITER $$source 

CREATE PROCEDURE AddNewProduct(
    IN p_name VARCHAR(100),
    IN p_category_id INT,
    IN p_price DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO Products
    (product_name, category_id, price, stock_quantity)
    VALUES
    (p_name, p_category_id, p_price, p_stock);

    SELECT 'Product Added Successfully' AS Message;
END $$

DELIMITER ;
CALL AddNewProduct('iPhone 15', 1, 79999.00, 10);

CREATE PROCEDURE PlaceNewOrder(
  IN p_user_id INT,
  IN p_product_id INT,
  IN p_quantity INT
)
BEGIN
  DECLARE v_price DECIMAL(10,2);
  DECLARE v_order_id INT;
  DECLARE v_total DECIMAL(10,2);
  SELECT price INTO v_price FROM `Products` WHERE product_id = p_product_id;
  SET v_total = v_price * p_quantity;
  INSERT INTO `Orders` (user_id, total_amount, order_status)
  VALUES (p_user_id, v_total, 'Pending');
  SET v_order_id = LAST_INSERT_ID();
  INSERT INTO `Order_Items` (order_id, product_id, quantity, price)
  VALUES (v_order_id, p_product_id, p_quantity, v_price);
  UPDATE `Products`
  SET stock_quantity = stock_quantity - p_quantity
  WHERE product_id = p_product_id;
  SELECT v_order_id AS New_Order_ID, v_total AS Total_Amount;
END ;

INSERT INTO `Orders` (user_id, total_amount, order_status)
VALUES (p_user_id, v_total, 'PLACED');

CREATE FUNCTION GetOrderTotal(p_order_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE v_total DECIMAL(10,2);
  SELECT SUM(quantity * price) INTO v_total
  FROM `Order_Items`
  WHERE order_id = p_order_id;
  RETURN IFNULL(v_total, 0);
END ;


CREATE FUNCTION CheckStock(p_product_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  DECLARE v_stock INT;
  SELECT stock_quantity INTO v_stock FROM `Products` WHERE product_id = p_product_id;
  IF v_stock IS NULL THEN
    RETURN 'Product Not Found';
  ELSEIF v_stock = 0 THEN
    RETURN 'Out of Stock';
  ELSEIF v_stock < 10 THEN
    RETURN 'Low Stock';
  ELSE
    RETURN 'In Stock';
  END IF;
END ;

SELECT GetOrderTotal(1);
SELECT product_name, CheckStock(product_id) FROM `Products`;
