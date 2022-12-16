create table employee_new(emp_name char(30), emp_address varchar(80));  --DDL(Data Decrelation Language)

insert into employee_new values('Aman','India');
insert into employee_new values('Deepak','India');
insert into employee_new values('Rahul','USA')          --; is not mandatory if we are not using it willbe exceute
insert into employee_new values('Shyam','UK'),('Dhan','Russia'),('Vikas','Japan')     --you can also add like this

select * from employee_new;          --Print all data

select emp_name from employee_new    --Print only Emp_name becaue here we specify not giving *
	
select emp_name as Name, emp_address as Address from employee_new;   --as is Alises means give another name for table name

select* from Employee;  --Here we uses Employee table to test how delete /drop works

delete from Employee;   --Here we delete , so it will not delete the structure

drop table Employee;   --Whole databse with structure will deleted

create table emp(salary decimal(5,2))     --here we place decimal 2 means upto 2 digit values if we give 201.1 so it become 201.10

insert into emp values(203.213),(302.22000),(212.1),(101.12)   --its will take upto 2 decimal values

select salary from emp;	

--Data type are:-Int,Float,Decimal,Money(used for currency),char

--Difference between char vs varchar.  Char(10) stores it will fixed means it will take 10 byte in memory. Varchar(10) it will take if we assign less values like'hello' takes 3 byte only 

--Primary key have unique value, it should not be duplicated , null is not allowed

create table ex(name char(10), age int, salary float, emp_id int primary key) 

insert into ex values('Ram',23,1000,1),('Shyam',32,6000,2),('Shyam',21,9000,3)

select * from ex

--Foriegn key means taking content of another table primary key,here we will take primary key from ex table and make foreign key

create table salary1 (eid int Foreign key references ex(emp_id),current_sal int);

insert into salary1 values (1,2000),(2,3000)

select * from salary1 


