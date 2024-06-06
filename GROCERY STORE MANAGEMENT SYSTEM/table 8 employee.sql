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
