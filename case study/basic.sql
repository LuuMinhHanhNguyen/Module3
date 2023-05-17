use furuma_management;

-- ex2
-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
-- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select employee_name,  length(employee_name) as length
from employee 
where (employee_name like 'h%' 
or employee_name like 'k%' 
or employee_name like 't%' )
and length(employee_name) <= 15;

-- ex3
-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi
--  và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select customer_name, floor((datediff(curdate(), customer_dob))/365) as age, address
from customer
where address regexp 'Đà Nẵng|Quảng Trị'
having (age between 18 and 50);

-- ex4
-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select cus.customer_id, customer_name, count(*) as order_times
from customer cus
join contract c on cus.customer_id = c.customer_id
where customer_type_id = 1
group by customer_id
order by order_times;

-- ex5
-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select cus.customer_id, customer_name
, customer_type_name
, c.contract_id, service_name,
start_date, end_date, s.hiring_cost + ifnull(sum(cd.quantity * com.price),0)  as total
from customer cus
left join customer_type ct on cus.customer_type_id = ct.customer_type_id
left join contract c on cus.customer_id = c.customer_id
 left join service s on c.service_id = s.service_id
 left join contract_details cd on c.contract_id = cd.contract_id
 left join complimentary com on cd.complimentary_id = com.complimentary_id
group by customer_id, contract_id
order by cus.customer_id;

-- ex6
-- Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select s.service_id, service_name, areas, hiring_cost, service_type_name
from service s
join service_type st on s.service_type_id = st.service_type_id
join contract c on c.service_id = s.service_id
where s.service_id not in( 
select service_id
from contract
where start_date >= "2021-01-01" and end_date <= "2021-03-31")
group by service_id;

-- ex7
-- Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select s.service_id, service_name, areas, max_capacity, hiring_cost, service_type_name
from service s
join service_type st on s.service_type_id = st.service_type_id
join contract c on c.service_id = s.service_id
where year(start_date) = "2020" and s.service_id not in (
select service_id from contract
where year(start_date) = "2021" )
group by service_id;

-- ex8 - 1
-- Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct customer_name from customer;
-- ex8 - 2
select customer_name from customer
group by customer_name;
-- ex8 - 3
select customer_name from customer
intersect 
select customer_name from customer;
-- ex8 - 4
select customer_name from customer
union
select customer_name from customer;

-- ex8 - extra - display name appeared >= 2
select customer_name, count(*) as count
from customer
group by customer_name
having count >= 2;


-- ex9
-- Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(start_date) as months, count(customer_id) as num_of_customers
from contract
where year(start_date) = "2021"
group by months
order by months ASC;

-- ex10
-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select c.contract_id, start_date, end_date, deposit, ifnull(sum(quantity),0) as total
from contract c
left join contract_details cd on c.contract_id = cd.contract_id
group by c.contract_id;

-- ex11
select cd.complimentary_id, complimentary_name
from contract_details cd
join contract c on cd.contract_id = c.contract_id
join complimentary com on  cd.complimentary_id = com.complimentary_id
join customer cus on c.customer_id = cus.customer_id
join customer_type ct on cus.customer_type_id = ct.customer_type_id
where customer_type_name = "Diamond" and address regexp 'Vinh|Quãng Ngãi';

-- ex12
select c.contract_id, employee_name, customer_name, phone_num as customer_phone, 
service_name, ifnull(sum(quantity),0) as total, deposit, start_date
from contract c
left join employee e on c.employee_id = e.employee_id
left join customer cus on cus.customer_id = c.customer_id
left join service s on s.service_id = c.service_id
-- we gotta use left join here **
left join contract_details cd on cd.contract_id = c.contract_id
where (start_date between "2020-10-01" and "2020-12-31") 
 and c.service_id not in 
 (select service_id from contract
 where start_date >= "2021-01-01" and start_date <= "2021-06-30")
group by contract_id
;
  -- some practicing
insert into contract(start_date, end_date, deposit, employee_id, customer_id, service_id)
values("2021-02-02", "2021-02-05", 777777, 7,7,3);

update contract 
set service_id = 2
where contract_id = 13;

delete from contract
where contract_id = 13;

-- ex13
select cd.complimentary_id, complimentary_name, sum(quantity) as num_of_uses
from contract_details cd
left join complimentary com on com.complimentary_id = cd.complimentary_id
group by complimentary_id
having sum(quantity) = 
(select sum(quantity) as num_of_uses
from contract_details
group by complimentary_id
order by num_of_uses DESC
limit 1);

-- ex14
select cd.contract_id, service_type_name,complimentary_name, count(cd.complimentary_id) as num_of_uses 
from contract_details cd
join contract c on c.contract_id = cd.contract_id
join service s on c.service_id = s.service_id
join service_type st on st.service_type_id = s.service_type_id
join complimentary com on cd.complimentary_id = com.complimentary_id
group by cd.complimentary_id
having num_of_uses = 1
order by contract_id;

-- ex15
select e.employee_id, employee_name, edu_name, falcuty_name, phone_number, address
from employee e
left join education_background eb on e.edu_id = eb.edu_id
left join falcuty f on f.falcuty_id = e.falcuty_id
join contract c on c.employee_id = e.employee_id
where year(start_date) in ("2020", "2021") 
group by employee_id
having count(c.employee_id) <= 3
order by employee_id ; 



-- ex16
-- delete employees with no contract from 2019 - 2021
select employee_id, employee_name
from employee
where employee_id not in 
(select employee_id from contract
where year(start_date) in ("2019", "2020", "2021"));
-- if truly wanna delete then implement this code (change the 'year' a bit to get your desired result):

delete from employee 
where employee_id in 
(select employee_id from contract
where year(start_date) in ("2023") or year(start_date) is null);



-- ex17
update customer cus
set cus.customer_type_id = 1
where cus.customer_id = 
	(select customer_id from -- (***)
(select c.customer_id , customer_name, c.customer_type_id
from customer c
join customer_type ct on c.customer_type_id = ct.customer_type_id
join contract con on con.customer_id = c.customer_id
join service s on s.service_id = con.service_id
where customer_type_name = "Platinium" and year(start_date) = "2021"
group by customer_id
having sum(hiring_cost) >= 10000000) as temp_customer_table -- temporary table copied of the original table 'customer' (***)
);

-- ex17 -- explanation, read to know more:
-- https://leetcode.com/problems/delete-duplicate-emails/solutions/1377749/reason-for-mysql-error-1093-cant-specify-target-table-for-update-in-from-clause/
-- MySQL doesn’t allow updates to a table when you are also using that same table in an inner select,
--  you can't modify the same table which you use in the SELECT part
-- To solve this problem, you have to wrap the inner select inside another select (***): why? - (link)

-- ex18
SET FOREIGN_KEY_CHECKS = 0; -- to disable them
delete from customer 
where customer_id in
	(select customer_id from
(select cus.customer_id, customer_name 
from customer cus
join contract c on cus.customer_id = c.customer_id
where year(start_date) < "2021") as temp_customer_table);
SET FOREIGN_KEY_CHECKS = 1; -- to re-enable them


-- ex19
update complimentary
set price = price * 2 
where complimentary_id = 
(select complimentary_id from
(select cd.complimentary_id, complimentary_name, sum(quantity) as num_of_uses
from complimentary com
join contract_details cd on com.complimentary_id = cd.complimentary_id
join contract c on c.contract_id = cd.contract_id
where year(start_date) = "2020"
group by complimentary_id
having sum(quantity) > 10) as temp_complimentary_table)
;


-- ex20
select employee_id as ID, employee_name, email, phone_number, address
from employee
union
select customer_id, customer_name, email, phone_num, address
from customer;

-- extra
create view HREmployee as 
select employee_name, dob, falcuty_id from employee
where falcuty_id = 2;
select * from HREmployee;

















 























