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
