-- 1
create database demo;

-- 2
use demo;

create table products(
id int primary key auto_increment,
product_code varchar(25),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(255),
product_status bit
);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values("111", "Book", 50.50, 1000, "Books are good", 1),
("222", "Pen", 10.10, 2000, "Pens are good", 1),
("333", "Radio", 90.90, 500, "Radios are good", 1),
("444", "TV", 500, 9000, "TVs are good", 1),
("555", "AC", 700, 700, "ACs are good", 1),
("666", "Fan", 66.50, 1000, "Fans are good", 1),
("777", "Mac", 2000.20, 100, "Macs are good", 1);

-- 3
create unique index code_index on products(product_code); 
create unique index name_price_index on products(product_name, product_price);

explain select * from products
where product_code = "777";

-- 4
create view get_product_info as
select product_code, product_name, product_price, product_status
from products;

select * from get_product_info;

alter view get_product_info as
select product_code, product_name, product_price, product_status, product_description
from products;

drop view get_product_info;

-- 5

 -- get All
create procedure getAllProducts() 
select * from products;

call getAllProducts();

-- add New
DELIMITER //
create procedure addNewProduct(p_code varchar(25), p_name varchar(50), price double, 
amount int, p_description varchar(255), p_status bit)
begin 
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values(p_code, p_name, price, amount, p_description, p_status);
END //
DELIMITER ;

call addNewProduct(888, "Phone", 888, 789, "Phones are good", 1);

-- edit
delimiter //
create procedure editProduct(p_id int, p_newDescription varchar(255))
begin 
update products p
set product_description = p_newDescription
where p.id = p_id;
end //
delimiter ;

drop procedure editProduct;

call editProduct(1, "This product's description has been edited!");
-- delete

delimiter //
create procedure deleteProduct(p_id int)
begin 
delete from products p
where p.id = p_id;
end //
delimiter ;

call deleteProduct(1);



