-- KPI 1: Total Revenue
SELECT SUM(sales_amount) AS total_revenue 
FROM orders 
WHERE sales_amount > 0;

-- KPI 2: Total Orders
SELECT COUNT(*) AS total_orders 
FROM orders;

-- KPI 3: Total Quantity Sold
SELECT SUM(sales_qty) AS total_quantity 
FROM orders 
WHERE sales_qty > 0;

-- KPI 4: Average Order Value
SELECT AVG(sales_amount) AS avg_order_value 
FROM orders 
WHERE sales_amount > 0;

-- KPI 5: Top 10 Restaurants by Revenue
SELECT TOP 10 r.name, SUM(o.sales_amount) AS revenue
FROM orders o
JOIN restaurant r ON o.r_id = r.id
WHERE o.sales_amount > 0
GROUP BY r.name
ORDER BY revenue DESC;

-- KPI 6: Top Cities by Revenue
SELECT TOP 10 r.city, SUM(o.sales_amount) AS revenue
FROM orders o
JOIN restaurant r ON o.r_id = r.id
WHERE o.sales_amount > 0
GROUP BY r.city
ORDER BY revenue DESC;

-- KPI 7: Veg vs Non-Veg Order Split
SELECT f.veg_or_non_veg, COUNT(*) AS order_count
FROM orders o
JOIN menu m ON o.r_id = m.r_id
JOIN food f ON m.f_id = f.f_id
GROUP BY f.veg_or_non_veg;

-- KPI 8: Monthly Revenue Trend
SELECT FORMAT(order_date, 'yyyy-MM') AS month, SUM(sales_amount) AS revenue
FROM orders
WHERE sales_amount > 0
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;