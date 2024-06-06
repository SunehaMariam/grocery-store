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