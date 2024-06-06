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
