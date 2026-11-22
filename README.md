# E-Commerce Database Management System

A complete MySQL database project for managing an online shopping store.

## Database Name
ecommerce_db

## Project Files

1. 01_create_tables.sql - Creates database and all 5 tables
2. 02_insert_data.sql - Inserts sample users, products and orders
3. 03_views.sql - Creates views for easy reporting
4. 04_procedures_functions.sql - Stored procedures and functions
5. 05_triggers_transactions.sql - Triggers, transactions and rollback
6. queries.sql - Extra practice queries
7. select.sql - Select queries for testing

## Tables (5)

1. Users - Stores customer details
2. Products - Stores product details
3. Orders - Stores order details
4. Order_Items - Stores items in each order
5. Order_Status_Log - Stores history of order status changes

## Features

### Views
- view_user_orders - Shows users with their orders
- view_order_details - Shows full order details with product names

### Stored Procedure
- PlaceNewOrder - Places a new order safely

### Functions
- GetOrderTotal - Returns total amount of an order
- CheckStock - Returns current stock of a product

### Triggers (3)
- trg_check_stock_before_order - Blocks order if stock is low
- trg_reduce_stock_after_order - Reduces stock automatically
- trg_log_order_status - Logs every status change

### Transactions
- START TRANSACTION + COMMIT / ROLLBACK
- If one part fails, full order is cancelled

## How To Run

Run files in this order:
reate_tables.sql
insert_all.sql
select.sql
file 04_views_procedures.sql
file 05_storedprocedure_functions.sql
06_triggers_transactions.sql

## Testing Results

- Stock 10 -> 9 after order - Trigger Working
- Order with quantity 10000 blocked with error Insufficient Stock
- Log shows PLACED -> SHIPPED - Trigger Working
- ROLLBACK deleted failed order completely

## Order Status Allowed
PLACED, SHIPPED, DELIVERED, CANCELLED

## Tools Used
MySQL, VS Code, MySQL Workbench, GitHub