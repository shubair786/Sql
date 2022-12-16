 

Create database class2_db;

use class2_db;

create table employees(id int,name VARCHAR(50),age int,hiring_date date,salary int, city varchar(50));
		
  


							 
insert into employees values(1,'Shashank', 24, '2021-08-10', 10000, 'Lucknow');

insert into employees values(2,'Rahul', 25, '2021-08-10', 20000, 'Khajuraho');

insert into employees values(3,'Sunny', 22, '2021-08-11', 11000, 'Banaglore');

insert into employees values(5,'Amit', 25, '2021-08-11', 12000, 'Noida');

insert into employees values(1,'Puneet', 26, '2021-08-12', 50000, 'Gurgaon');

select * from employees;

--Multi update:-

update employees set age = 20, salary = 25000 where hiring_date = '2021-08-10';

select * from employees;

create table auto(id int identity(1,1),
					name varchar(30));

---highest salary?

select * from employees order by salary desc limit 1;

