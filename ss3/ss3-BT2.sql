use quan_ly_ban_hang;

insert into customer(customer_name, age)
values("Minh Quan",10),("Ngoc Oanh",20),("Hong Ha",50);

insert into orders(customer_id, order_date, total_price)
values(1, "2016-03-21", null),(2, "2016-03-23", null),(1, "2016-03-16", null);

insert into product(product_name, price)
values("May Giat",3), ("Tu Lanh",5), ("Dieu Hoa", 7), ("Quat",1), ("Bep Dien", 2);

insert into order_detail(order_id, product_id, quantity)
value(1,1,3), (1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

-- 1
select order_id, order_date, total_price from orders;

-- 2
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select customer_name, product_name
from customer c
join orders o on c.customer_id = o.customer_id
join order_detail od on od.order_id = o.order_id
join product p on p.product_id = od.product_id;

-- 3
select * from customer c
where c.customer_id not in 
(select customer_id from orders);

-- 4
select o.order_id, order_date, sum(price * quantity)
from customer c
join orders o on c.customer_id = o.customer_id
join order_detail od on od.order_id = o.order_id
join product p on p.product_id = od.product_id
group by order_id;
