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
