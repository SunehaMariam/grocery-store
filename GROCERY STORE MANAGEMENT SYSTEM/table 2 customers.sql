create table customers(
id int auto_increment primary key,
name varchar(50),
email varchar(50),
phone_number varchar(20)
);
insert into customers(name,Email,phone_number) values('Suneha','suneha@gmail.com','2233-5668'),('Fatima','Fatima@gmail.com',3444-24247),('Sawera', 'Sawera@example.com', '555-123-4567');
select * from customers;
SELECT * FROM customers
WHERE email = 'suneha@gmail.com';
SELECT c.*
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
WHERE oi.product_id = 1;
SELECT c.*, SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY c.id
ORDER BY total_spent DESC
LIMIT 1;
SELECT UPPER(name) AS customer_name FROM customers;
SELECT name, email, CHAR_LENGTH(email) AS email_length FROM customers;
SELECT name, LEFT(name, 1) AS first_letter FROM customers;
SELECT name, RIGHT(name, 2) AS last_two_characters FROM customers;
SELECT DISTINCT phone_number FROM customers;