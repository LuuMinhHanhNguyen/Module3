create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
customer_id int primary key auto_increment,
customer_name varchar(45),
age int
);

create table orders(
order_id int primary key auto_increment,
order_date date,
total_price double,
customer_id int,
foreign key (customer_id) references customer(customer_id)
);

create table product(
product_id int primary key auto_increment,
product_name varchar(45),
price double
);

create table order_detail(
	order_id int,
	product_id int,
    quantity int,
    primary key(order_id, product_id),
    foreign key(order_id) references orders(order_id),
    foreign key(product_id) references product(product_id)
);

