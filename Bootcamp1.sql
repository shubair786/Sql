create database orders;

create table order_details(ord_no bigint primary key,
						   purch_amt decimal(7,3),
						   ord_date smalldatetime,
						   customer_id bigint,
						   salesman_id bigint);

insert into order_details values(70001,150.5,2012-10-05,3005,5002),(70009,270.65,2012-09-10,3001,5005),(70002,65.26,2012-10-07,3002,5001),
								(70004,110.5,2012-08-17,3009,5003),(70007,948.5,2012-09-10,3005,5002),(70005,2400.6,2012-07-27,3007,5001),
								(70008,5760,2012-09-10,3002,5001),(70010,1983.43,2012-10-10,3004,5006),(70012,250.45,2012-06-27,3008,5002),
								(70011,75.29,2012-08-17,3003,5007),(70013,3045.6,2012-04-25,3002,5001);

select * from order_details;

create table salesman(salesman_id bigint foreign key references order_details(salesman_id),
					  name varchar(50),
					  city varchar(100),
					  commission decimal(5,2));

select ord_no,ord_date,salesman_id,purch_amt from order_details;


-----------########--------------

create table emp1(id int primary key identity(1,1),
								name varchar(50),
								age int,
								hiring_date date,
								salary int,
								city varchar(50))

insert into emp1(name,age,hiring_date,salary,city) values ('Rahul',24,'2021-10-08',10000,'Lucknow'),('Shyam',21,'12-09-12',20000,'Allahabad'),
														  ('Varun',25,'2022-09-07',12000,'Banras'),('Chanul',27,'2022-03-04',22300,'jamnagar'),('Dhawan',26,'2022-09-07',52000,'jaipur');


select * from emp1;

--Query1:--Total Records?

select count(*) as Total_Records from emp1;

----Query2:--Multiple Col

select name as Emp_name from emp1;

---Query3 --Distinct Hiring Table

select distinct hiring_date from emp1;

---Distinct value of Age and count

select count(distinct(age)) from emp1;

--Salary increment with 20%

select id,
	   name,
	   salary as old_salary,
	   (salary + salary *0.2) as new_salary from emp1;
				
--Highest salary and lowest salary

select max(salary) from emp1;
select min(salary) from emp1;
select max(salary) from emp1 where salary != 52000;

select * from emp1;

---update command

update emp1 set name = 'Shavan' where id = 5;

update emp1 set salary = salary + salary* 0.2;

--Multiple update of here age,salary

update emp1 set age = 20,salary=23000 where hiring_date = '2021-10-08';

---Delete Command-----

--delete vs drop:--Delete :-Delete particluar col, whereas drop will remove entire database structure

delete from emp1 where hiring_date = '2022-03-04';

---------use of limit

select * from emp1 Limit 2;

--------sorting data(ASC,DESC) by using ORDERBY

select * from emp1 order by name;              --It will give in Ascending order by default

select * from emp1 order by name desc;         --When we write desc it will print descendent order

select * from emp1 order by salary desc,name asc;

-----Highest salary? ---HEre we use Top to get 1 person from table emp1 order by salary desc means top value

select top 1 * from emp1 order by salary desc;

--lowest salary

select top 1 * from emp1  order by salary asc; 

select * from emp1;

---Where clause:-

select * from emp1 where salary > 5000;

select * from emp1 where age < 22;

--Find those employee who joined company on  2022-09-07 and salary less than 1000

--And operator:-

select * from emp1 where hiring_date = '2022-09-07' and salary < 1000;

--OR Operator:-

select * from emp1 where hiring_date < '2022-09-07' or salary < 50000;

--Between:-

select * from emp1 where age between 15 and 21;

select * from emp1 where hiring_date between '2021-10-09' and '2022-09-09';

---Like Opeartor:-like Regular Expression(R.E) :--

select * from emp1 where name like 'S%';      -- After S it will print anything
select * from emp1;

select * from emp1 where name like 'S_';

--Query for exact 5 character long

select * from emp1 where name like '_____';                      --Here  __ Represent 5 underscore means 5 charatcer so it will print with 5 character


---GROUP BY:-

create table orders_data
(
 cust_id int,
 order_id int,
 country varchar(50),
 state varchar(50)
);


insert into orders_data values(1,100,'USA','Seattle');
insert into orders_data values(2,101,'INDIA','UP');
insert into orders_data values(2,103,'INDIA','Bihar');
insert into orders_data values(4,108,'USA','WDC');
insert into orders_data values(5,109,'UK','London');
insert into orders_data values(4,110,'USA','WDC');
insert into orders_data values(3,120,'INDIA','AP');
insert into orders_data values(2,121,'INDIA','Goa');
insert into orders_data values(1,131,'USA','Seattle');
insert into orders_data values(6,142,'USA','Seattle');
insert into orders_data values(7,150,'USA','Seattle');

select * from orders_data;

select Country,count(*)as Total_Country_Count from orders_data group by country;
--Here we count country and total with respect to group by country

--------------New Query 

select * from emp1;

select age,sum(salary) as Total_Salary from emp1 group by age;   --Here we select age,sum(salary) and group by with age

select age,
       sum(salary) as Total_Salary,
	   min(salary) as Min_Salary,
	   max(salary) as Max_Salary,
	   Avg(salary) as Avg_Salary,
	   count(*) as Total_Employee_Count
from emp1 group by age;


--Having Clause

select country from order_details group by country having count(*)=1;

--GROUP CONCAT:--

select Country,GROUP_CONCAT(state) as State_Name from order_details group by country;

select * from emp1;

--Query:-We want nested select to solve salary greater than of shyam:--

select * from emp1 where salary > (select salary from emp1 where name = 'shyam');

select * from orders_data;

----USE OF IN:--------IN is used to check state whether it's present or not

select * from orders_data where state in('seattle','goa');

------CASE WHEN (like if else in python) , to solve nested case

create table student_id
(
		stud_id int,
		stu_name varchar(50),
		total_marks int
);


insert into student_id values(1,'Shashank',50);
insert into student_id values(2,'Rahul',91);
insert into student_id values(3,'Amit',74);
insert into student_id values(4,'Nikhil',65);
insert into student_id values(5,'Rohit',86);
insert into student_id values(6,'Deepak',77);

select * from student_id;

select stud_id,
	   stu_name,
	   total_marks,
	   case
			when total_marks >=90 then 'A-Grade'
			when total_marks < 90 and total_marks >= 80 then 'B-Grade'
			when total_marks < 80 and total_marks >=70 then 'C-Grade'
			when total_marks < 70 and total_marks >= 60 then 'D-Grade'
			when total_marks < 60 and total_marks >= 50 then 'E-Grade'
			when total_marks < 50 and total_marks > = 33 then 'Just Pass'
			else 'Fail'
		end as Grade
from student_id;


-------Binary Tree Node Table:--

create table tree(node int,parent int);

insert into tree values(5,8),(9,8),(1,5),(4,5),(2,9),(3,9),(8,null);

select * from tree;

select node,
	   case
	        when node not in (select distinct parent from tree where parent is not null) then 'Leaf'
			when parent is null then 'Root'
			else 'Inner'
		end as node_type
from tree;


---Example of Group by and Case when 

create table transactions(trx_date date, 
						  merchant_id varchar(50),
						  amount int,
						  payment_mode varchar(20)
						  );

insert into transactions values('2022-04-02','m1','150','cash');
insert into transactions values('2022-04-02','m1','500','online');
insert into transactions values('2022-04-03','m2','450','online');
insert into transactions values('2022-04-03','m1','100','cash');
insert into transactions values('2022-04-02','m3','600','cash');
insert into transactions values('2022-04-05','m5','200','online');
insert into transactions values('2022-04-05','m1','100','online');

select * from transactions;


select merchant_id,
       sum(case when payment_mode = 'cash' then amount else 0 end) as cash_amount,
	   sum(case when payment_mode ='online' then amount else 0 end) as online_amount
from transactions
group by merchant_id;


--------JOINS--------

create table orders(order_id int,cust_id int,order_date date,shipper_id int );

create table customers(cust_id int, cust_name varchar(50),country varchar(100));

create table shippers
(
    ship_id int,
    shipper_name varchar(50)
);

insert into orders values(10308, 2, '2022-09-15', 3);
insert into orders values(10309, 30, '2022-09-16', 1);
insert into orders values(10310, 41, '2022-09-19', 2);

insert into customers values(1, 'Neel', 'India');
insert into customers values(2, 'Nitin', 'USA');
insert into customers values(3, 'Mukesh', 'UK');

insert into shippers values(3,'abc');
insert into shippers values(1,'xyz');

select * from orders;
select * from customers;
select * from shippers;


--Inner join combine table but select those which is common in both
select 
o.*,c.*
from orders o
inner join customers c on
o.cust_id = c.cust_id;

--Left join will take all from left and where value is not present it will be null values.
select o.*,c.*
from orders o
left join customers c on
o.cust_id = c.cust_id;

--Right join will take all data from right and if data not present in left it will be null

select o.*,c.*
from orders o
right join customers c on
o.cust_id = c.cust_id;

--Full outer join = Left + Right join.In this all values came which is not present on left or right became null but all values came

select o.*,c.*
from orders o
full outer join customers c on
o.cust_id = c.cust_id;

---How to join two or more tables :-
select 
o.*,c.*,s.*
from orders o
inner join customers c on
o.cust_id = c.cust_id
inner join shippers s on
s.ship_id = o.shipper_id;



----Task Query:-

create table employees_full_data(emp_id int,name varchar(50),mgr_id int);

insert into employees_full_data values(1,'Shashank',3),(2,'Amit',3),(3,'Rajesh',4),(4,'Ankit',6),(5,'Nikhil',null);

