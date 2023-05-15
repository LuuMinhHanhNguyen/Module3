use furuma_management;

drop view v_employee;

-- Ex21
create view v_employee as
select  c.employee_id, employee_name, address
from employee e
join contract c on c.employee_id = e.employee_id
where e.address regexp 'Hải Châu' and c.start_date = "2019-12-12";

select * from v_employee;

-- insert into employee(employee_name, address)
-- values("Hannah", "478 Le Duan, Hải Châu, Đà Nẵng");

-- insert into contract(employee_id, start_date)
-- values(11, "2019-12-12");


-- Ex22
update v_employee
set address = "Lien Chieu";

-- Ex23
DELIMITER //
create procedure delete_customer(IN cus_id int)
begin 
delete from customer
where customer_id = cus_id;
END //
DELIMITER ;

insert into customer(customer_name)
values("Hannah");

call delete_customer(11);







