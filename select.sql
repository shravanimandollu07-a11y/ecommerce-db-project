select * from categories;
SELECT 'Users', COUNT(*) FROM `Users` UNION ALL
SELECT 'Categories', COUNT(*) FROM `Categories` UNION ALL
SELECT 'Products', COUNT(*) FROM `Products` UNION ALL
SELECT 'Orders', COUNT(*) FROM `Orders` UNION ALL
SELECT 'Order_Items', COUNT(*) FROM `Order_Items` UNION ALL
SELECT 'Payments', COUNT(*) FROM `Payments`;
