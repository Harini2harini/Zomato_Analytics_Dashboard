SELECT 'food' AS table_name, COUNT(*) AS row_count FROM food
UNION ALL
SELECT 'menu', COUNT(*) FROM menu
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'restaurant', COUNT(*) FROM restaurant
UNION ALL
SELECT 'users', COUNT(*) FROM users;