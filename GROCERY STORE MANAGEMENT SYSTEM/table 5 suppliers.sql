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
