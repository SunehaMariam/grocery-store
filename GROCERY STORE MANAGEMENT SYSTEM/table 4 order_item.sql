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