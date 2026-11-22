USE ecommerce_db;

CREATE TABLE `Users` (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  mobile_number VARCHAR(15) UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Categories` (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT
);

CREATE TABLE `Products` (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
  stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
  category_id INT,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES `Categories`(category_id)
);

CREATE TABLE `Orders` (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  order_status VARCHAR(20) DEFAULT 'PLACED' CHECK (order_status IN ('PLACED','SHIPPED','CANCELLED')),
  total_amount DECIMAL(10,2) DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES `Users`(user_id)
);

CREATE TABLE `Order_Items` (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT NOT NULL CHECK (quantity > 0),
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES `Orders`(order_id),
  FOREIGN KEY (product_id) REFERENCES `Products`(product_id)
);

CREATE TABLE `Payments` (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT UNIQUE,
  payment_method VARCHAR(20) CHECK (payment_method IN ('UPI','Card','COD')),
  payment_status VARCHAR(20) DEFAULT 'PENDING' CHECK (payment_status IN ('SUCCESS','FAILED','PENDING')),
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES `Orders`(order_id)
);
