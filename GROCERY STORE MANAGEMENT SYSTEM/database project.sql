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
SELECT * FROM products WHERE stock_quantity = 0;
SELECT p.name AS product_name, s.name AS supplier_name
FROM products p
JOIN inventory i ON p.id = i.product_id
JOIN suppliers s ON i.supplier_id = s.id;
SELECT name, AVG(price) AS average_price FROM products GROUP BY name;
SELECT * FROM products WHERE price BETWEEN 5 AND 10;
SELECT p.name, p.price, AVG(p.price) OVER (PARTITION BY p.name) AS average_p;
SELECT ROUND(AVG(price)) AS average_price FROM products;
SELECT ROUND(AVG(DISTINCT price)) AS average_price FROM products;

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

create table orders(
id int auto_increment primary key,
customer_id int,
order_date date,
total_amount decimal(10,2),
foreign key(customer_id) references customers(id)
);
insert into orders(customer_id,order_date,total_amount) values(1,'2023-05-17',672),(2,'2022-09-24',678.00),(3, '2024-05-30', 99.98);
select * from orders;
SELECT * FROM orders WHERE customer_id = 1;
SELECT customer_id, COUNT(*) as total_orders FROM orders GROUP BY customer_id;      
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date);
SELECT order_date, DAYNAME(order_date) AS day_of_week FROM orders;


create table order_Items(
id int auto_increment primary key,
order_id int,
product_id int,
quantity int,
price decimal(10,2),
foreign key (order_id) references orders(id),
foreign key (product_id) references products(id)
);
insert into order_Items(order_id,product_id,quantity,price) values(1,1,1,999.98),(1,2,1,677.98),(3, 3, 1, 49.99);
select * from order_Items; 
SELECT * FROM order_items
WHERE order_id = 1;
SELECT oi.id AS order_item_id, p.category, oi.quantity, oi.price
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.id; 

create table  suppliers(
id int auto_increment primary key,
name varchar(50),
contact_person varchar(50),
address varchar(50)
);
insert into suppliers(name,contact_person,address) values('tech supplies','ali','12 tech lane'),('Furniture Co','Ahmed','45 Furniture lane'),('Fashion Supplier Ltd.', 'Faraz', '456 Fashion City');
select * from suppliers;
SELECT * FROM suppliers
WHERE address LIKE '%12 tech lane%';
SELECT p.name AS product_name, s.name AS supplier_name, i.quantity
FROM products p 
INNER JOIN inventory i ON p.id = i.product_id
INNER JOIN suppliers s ON i.supplier_id = s.id;
SELECT DISTINCT address FROM suppliers;

create table inventory(
id int auto_increment primary key,
product_id int,
supplier_id int,
quantity int,
foreign key (product_id) references products(id),
foreign key (supplier_id) references suppliers(id)
);
insert into inventory(product_id,supplier_id,quantity) values(1,1,20),(2,4,12),(3, 3, 20);
select * from inventory;
SELECT p.name AS product_name, s.name AS supplier_name
FROM products p
JOIN inventory i ON p.id = i.product_id
JOIN suppliers s ON i.supplier_id = s.id;
SELECT product_id, SUM(quantity) as total_quantity FROM inventory GROUP BY product_id;

create table promotions(
id int auto_increment primary key,
name varchar(50),
start_date date,
end_date date,
discount decimal(5,2)
);
insert into promotions(name,start_date,end_date,discount) values('Summer Sale','2023-03-12','2023-03-30',75.00),('Back to School','2020-08-01','2020-08-31',12.00),('Holiday Promotion', '2020-08-01', '2020-08-05', 0.15);
select * from promotions;
SELECT o.id AS order_id, p.name AS promotion_name, p.discount
FROM orders o
LEFT JOIN promotions p ON o.order_date BETWEEN p.start_date AND p.end_date;

create table employees(
id int auto_increment primary key,
name varchar(50),
position varchar(50),
salary decimal(10,2)
);
insert into employees(name,position,salary) values('fatima mushtaq','head manager',95000.00),('suneha mariam','Manager',78000.00),('Sawera Rehman', 'Cashier', 25000);
select * from employees;
SELECT * FROM employees
WHERE position = 'Manager';
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
SELECT e.name, SUM(s.amount) AS total_sales_amount
FROM employees e
JOIN sales s ON e.id = s.employee_id
GROUP BY e.id;


create table departments(
id int auto_increment primary key,
name varchar(50),
location varchar(100)
);
insert into departments(name,location) values('sales','Building A'),('Support','Building B'),('Customer Service Department', 'Ground Floor');
select * from deparments;
SELECT * FROM departments
WHERE location LIKE '%Building A%';
SELECT DISTINCT location FROM departments;
-- Select the employee name, department name, and the total amount of sales made by each employee, rounded to two decimal places:
SELECT e.name AS employee_name, d.name AS department_name, ROUND(SUM(s.amount), 2) AS total_sales_amount
FROM employees e
LEFT JOIN sales s ON e.id = s.employee_id
LEFT JOIN departments d ON e.position = d.name
GROUP BY e.id;

create table sales(
id int auto_increment primary key,
employee_id int,
order_id int,
sale_date date,
amount decimal(10,2),
foreign key (employee_id) references employees(id),
foreign key (order_id) references orders(id)
);
insert into sales(employee_id,order_id,sale_date,amount) values(1,1,'2020-05-24',876.99),(2,2,'2020-05-25',199.99),(3, 3, '2020-05-30', 49.99);
select * from sales;
SELECT * FROM sales
WHERE employee_id IN (SELECT id FROM employees WHERE name = 'fatima mushtaq');

SELECT employee_id, SUM(amount) as total_sales FROM sales GROUP BY employee_id;
SELECT MAX(sale_date) AS last_sale_date FROM sales;