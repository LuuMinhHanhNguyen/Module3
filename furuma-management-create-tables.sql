CREATE DATABASE furuma_management;
use furuma_management;


create table role(
role_id int primary key AUTO_INCREMENT,
role_name varchar(45)
);



create table education_background(
edu_id int primary key AUTO_INCREMENT,
edu_name varchar(45)
);



create table falcuty(
falcuty_id int primary key AUTO_INCREMENT,
falcuty_name varchar(45)
);



CREATE TABLE employee(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(45) NOT NULL,
dob DATE,
id_number INT,
salary DOUBLE,
phone_number varchar(45),
email VARCHAR(70),
address VARCHAR(70),
role_id INT,
edu_id INT,
falcuty_id INT,
foreign key (role_id) references role(role_id),
foreign key (edu_id) references education_background(edu_id),
foreign key (falcuty_id) references falcuty(falcuty_id)
);
select*from employee;


create table customer_type(
customer_type_id int primary key AUTO_INCREMENT,
customer_type_name varchar(45)
);



create table customer(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_type_id INT,
customer_name varchar(45),
customer_dob DATE,
gender bit(1),
id_card_num int,
phone_num int,
email varchar(45),
address varchar(45),
foreign key (customer_type_id) references customer_type(customer_type_id)
);


create table hiring_type(
hiring_type_id int primary key AUTO_INCREMENT,
hiring_type_name varchar(45)
);


create table service_type(
service_type_id int primary key AUTO_INCREMENT,
service_type_name varchar(45)
);


create table service(
service_id int primary key AUTO_INCREMENT,
service_name varchar(45),
areas int,
hiring_cost double,
max_capacity int,
hiring_type_id int,
service_type_id int,
room_standard varchar(45),
other_service_description varchar(45),
pool_area double,
num_of_floors int,
foreign key (hiring_type_id) references hiring_type(hiring_type_id),
foreign key (service_type_id) references service_type(service_type_id)
);





create table contract(
contract_id int primary key AUTO_INCREMENT,
start_date datetime,
end_date datetime,
deposit double,
employee_id INT,
customer_id INT,
service_id INT,
foreign key (employee_id) references employee(employee_id),
foreign key (customer_id) references customer(customer_id),
foreign key (service_id) references service(service_id)
);


create table complimentary(
complimentary_id int primary key AUTO_INCREMENT,
complimentary_name varchar(45),
price double,
unit varchar(10),
complimentary_status varchar(45)
);



create table contract_details(
contracts_details_id int primary key AUTO_INCREMENT,
contract_id int,
complimentary_id int,
quantity int,
foreign key (contract_id) references contract(contract_id),
foreign key (complimentary_id) references complimentary(complimentary_id)
);
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET FOREIGN_KEY_CHECKS = 0; -- to disable them
SET FOREIGN_KEY_CHECKS = 1; -- to re-enable them
















