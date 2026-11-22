
USE ecommerce_db;

-- 1. 6 Categories
INSERT INTO `Categories` (category_name, description) VALUES
('Electronics', 'Mobiles, laptops and gadgets'),
('Fashion', 'Clothes, shoes and accessories'),
('Home & Kitchen', 'Home appliances and kitchen items'),
('Beauty', 'Skincare, makeup and personal care'),
('Sports', 'Sports equipment and fitness'),
('Books', 'Fiction, non-fiction and academic books');

-- 2. 12 Users
INSERT INTO `Users` (full_name, email, mobile_number, password) VALUES
('Aarav Sharma', 'aarav@gmail.com', '9876543210', 'aarav123'),
('Priya Patel', 'priya@gmail.com', '9876543211', 'priya123'),
('Rohan Desai', 'rohan@gmail.com', '9876543212', 'rohan123'),
('Sneha Kulkarni', 'sneha@gmail.com', '9876543213', 'sneha123'),
('Vikram Singh', 'vikram@gmail.com', '9876543214', 'vikram123'),
('Ananya Iyer', 'ananya@gmail.com', '9876543215', 'ananya123'),
('Arjun Mehta', 'arjun@gmail.com', '9876543216', 'arjun123'),
('Kavita Rao', 'kavita@gmail.com', '9876543217', 'kavita123'),
('Manish Joshi', 'manish@gmail.com', '9876543218', 'manish123'),
('Divya Nair', 'divya@gmail.com', '9876543219', 'divya123'),
('Karan Verma', 'karan@gmail.com', '9876543220', 'karan123'),
('Pooja Shah', 'pooja@gmail.com', '9876543221', 'pooja123');

-- 3. 20 Products
INSERT INTO `Products` (product_name, price, stock_quantity, category_id) VALUES
('Wireless Headphones', 1999.00, 50, (SELECT category_id FROM `Categories` WHERE category_name='Electronics')),
('Smartphone', 15999.00, 20, (SELECT category_id FROM `Categories` WHERE category_name='Electronics')),
('Laptop', 45999.00, 15, (SELECT category_id FROM `Categories` WHERE category_name='Electronics')),
('Smartwatch', 2999.00, 40, (SELECT category_id FROM `Categories` WHERE category_name='Electronics')),
('Bluetooth Speaker', 1499.00, 35, (SELECT category_id FROM `Categories` WHERE category_name='Electronics')),
('T-Shirt', 499.00, 100, (SELECT category_id FROM `Categories` WHERE category_name='Fashion')),
('Jeans', 999.00, 60, (SELECT category_id FROM `Categories` WHERE category_name='Fashion')),
('Kurti', 799.00, 80, (SELECT category_id FROM `Categories` WHERE category_name='Fashion')),
('Sneakers', 1999.00, 45, (SELECT category_id FROM `Categories` WHERE category_name='Fashion')),
('Handbag', 1299.00, 25, (SELECT category_id FROM `Categories` WHERE category_name='Fashion')),
('Mixer Grinder', 2499.00, 30, (SELECT category_id FROM `Categories` WHERE category_name='Home & Kitchen')),
('Pressure Cooker', 1199.00, 40, (SELECT category_id FROM `Categories` WHERE category_name='Home & Kitchen')),
('Dinner Set', 2999.00, 20, (SELECT category_id FROM `Categories` WHERE category_name='Home & Kitchen')),
('Face Wash', 299.00, 120, (SELECT category_id FROM `Categories` WHERE category_name='Beauty')),
('Lipstick', 499.00, 90, (SELECT category_id FROM `Categories` WHERE category_name='Beauty')),
('Yoga Mat', 699.00, 60, (SELECT category_id FROM `Categories` WHERE category_name='Sports')),
('Dumbbells 5kg', 1499.00, 30, (SELECT category_id FROM `Categories` WHERE category_name='Sports')),
('Cricket Bat', 1799.00, 20, (SELECT category_id FROM `Categories` WHERE category_name='Sports')),
('Python Programming Book', 599.00, 50, (SELECT category_id FROM `Categories` WHERE category_name='Books')),
('The Alchemist', 349.00, 70, (SELECT category_id FROM `Categories` WHERE category_name='Books'));

-- 4. 12 Orders
INSERT INTO `Orders` (user_id, order_status, total_amount) VALUES
(1, 'PLACED', 1999.00),
(1, 'SHIPPED', 15999.00),
(2, 'PLACED', 1498.00),
(3, 'PLACED', 2499.00),
(4, 'PLACED', 45999.00),
(5, 'SHIPPED', 2999.00),
(6, 'PLACED', 1298.00),
(7, 'PLACED', 1799.00),
(8, 'CANCELLED', 499.00),
(9, 'SHIPPED', 2198.00),
(10, 'PLACED', 599.00),
(11, 'PLACED', 3499.00);

-- 5. 23 Order Items
INSERT INTO `Order_Items` (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1999.00),
(2, 2, 1, 15999.00),
(3, 6, 1, 499.00),
(3, 7, 1, 999.00),
(4, 11, 1, 2499.00),
(5, 3, 1, 45999.00),
(6, 4, 1, 2999.00),
(7, 8, 1, 799.00),
(7, 15, 1, 499.00),
(8, 18, 1, 1799.00),
(9, 15, 1, 499.00),
(10, 5, 1, 1499.00),
(10, 16, 1, 699.00),
(11, 19, 1, 599.00),
(12, 10, 1, 1299.00),
(12, 12, 1, 1199.00),
(12, 13, 1, 999.00),
(1, 14, 1, 299.00),
(2, 16, 2, 699.00),
(3, 17, 1, 1499.00),
(4, 20, 1, 349.00),
(5, 9, 1, 1999.00),
(6, 8, 1, 799.00);

-- 6. 12 Payments
INSERT INTO `Payments` (order_id, payment_method, payment_status) VALUES
(1, 'UPI', 'SUCCESS'),
(2, 'Card', 'SUCCESS'),
(3, 'COD', 'PENDING'),
(4, 'UPI', 'SUCCESS'),
(5, 'Card', 'SUCCESS'),
(6, 'UPI', 'SUCCESS'),
(7, 'COD', 'PENDING'),
(8, 'UPI', 'SUCCESS'),
(9, 'Card', 'FAILED'),
(10, 'UPI', 'SUCCESS'),
(11, 'COD', 'PENDING'),
(12, 'Card', 'SUCCESS');

