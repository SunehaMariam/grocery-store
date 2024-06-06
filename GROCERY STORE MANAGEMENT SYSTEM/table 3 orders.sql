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
