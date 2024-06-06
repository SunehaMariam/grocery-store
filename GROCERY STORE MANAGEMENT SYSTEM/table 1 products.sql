create database grocery_store;
use grocery_store;
create table products(
id int auto_increment primary key,
name varchar(50),
category varchar(50),
price decimal(10,2),
stock_quantity int
);
insert into products(name,category,price,stock_quantity) values('laptop','Electronics',999.99,10),('Desk chair','Furniture',199.89,5),('Headphones', 'Electronics', 49.99, 20);
select *from products;
SELECT * FROM products
WHERE category = 'Electronics';
SELECT * FROM products WHERE price > 10;
SELECT name, category FROM products ORDER BY category;
SELECT p.name, SUM(oi.quantity) AS total_sales_quantity
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id;
SELECT * FROM products WHERE stock_quantity = 0;
SELECT p.name AS product_name, s.name AS supplier_name
FROM products p
JOIN inventory i ON p.id = i.product_id
JOIN suppliers s ON i.supplier_id = s.id;
SELECT name, AVG(price) AS average_price FROM products GROUP BY name;
SELECT * FROM products WHERE price BETWEEN 5 AND 10;
SELECT p.name, COUNT(oi.product_id) AS total_orders
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id;
SELECT p.name, p.price, AVG(p.price) OVER (PARTITION BY p.name) AS average_price
FROM products p;
SELECT p.name AS product_name, c.name AS    customer_name
FROM products p
JOIN order_items oi ON p.id = oi.product_id
JOIN orders o ON oi.order_id = o.id
JOIN customers c ON o.customer_id = c.id;
SELECT ROUND(AVG(price)) AS average_price FROM products;
SELECT ROUND(AVG(DISTINCT price)) AS average_price FROM products;