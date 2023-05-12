create database student_management;

use student_management;

create table class(
id int auto_increment primary key,
student_name varchar(45) );

create table teacher(
id int auto_increment primary key,
teacher_name varchar(45),
age int,
country varchar(45)
);

