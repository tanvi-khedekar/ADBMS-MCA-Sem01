create database company;
use company;

create table employee (
	emp_no int primary key,
    e_name varchar(20),
    e_address varchar(100),
    e_ph_no varchar(15),
    dept_no int,
    dept_name varchar(50),
    job_id varchar(10),
    designation varchar(20),
    salary int
);

insert into employee values(1,'Janvi','Pune',9309744141, 1,'Finance',111,'Team leader',35000);
insert into employee values(2,'Gyahesh','Satara',1485213365, 3, 'Retail',112,'HR',15000);
insert into employee values(3,'Mahesh','Akola',9752336598, 2, 'Marketing',113,'Team leader',32000);
insert into employee values(4,'Ashok','Satara',8533625447, 1,'Finance',114,'Manager',49000);
insert into employee values(5,'Shailesh','Amravati',456665975, 2,'Marketing',115,'Clerk',9000);
insert into employee values(6,'Amey','Pune',5426663257, 3,'Retail',116,'Analyst',18000);
insert into employee values(7, 'Ganu', 'Latur', 4566666655, 1, 'Finance', 117, 'President', 150000);
insert into employee values(8, 'Ganesh', 'Sangli', 4586214595, 2, 'Marketing', 118, 'Clerk', 8500);
insert into employee values(9, 'Priti', 'Latur', 6599889985, 3, 'Retail', 119, 'HR', 15500);

select * from employee;

-- 1. List the E_no, E_name, Salary of all employees working for MANAGER. 
select emp_no,E_name,salary from employee where Designation='Manager'; 

-- 2. Display all the details of the employee whose salary is more than 10000.
select * from employee where salary>10000;

-- 3. List the employees in ascending order of Designations of those who joined after 1981. 
alter table employee add column join_date date;
update employee set join_date = '2024-02-11' where emp_no = 1;
update employee set join_date = '1980-11-11' where emp_no = 2;
update employee set join_date = '2020-01-05' where emp_no = 3;
update employee set join_date = '2025-02-17' where emp_no = 4;
update employee set join_date = '1950-12-09' where emp_no = 5;
update employee set join_date = '2026-02-02' where emp_no = 6;
update employee set join_date = '1999-08-07' where emp_no = 7;
update employee set join_date = '1990-11- 01' where emp_no = 8;
update employee set join_date = '2024-02-11' where emp_no = 9;

select * from employee where join_date >= '1982-01-01' order by designation asc; 

-- 4. List the employees along with their Experience and Daily Salary. 
alter table employee add column experience int;
update employee set experience = 25 where emp_no = 1;
update employee set experience = 40 where emp_no = 2;
update employee set experience = 55 where emp_no = 3;
update employee set experience = 99 where emp_no = 4;
update employee set experience = 15 where emp_no = 5;
update employee set experience = 80 where emp_no = 6;
update employee set experience = 77 where emp_no = 7;
update employee set experience = 49 where emp_no = 8;
update employee set experience = 95 where emp_no = 9;
select e_name,experience,salary/30 as daily_salary from employee; 

-- 5. List the employees who are either ‘CLERK’ or ‘ANALYST '. 
select * from employee where designation in ('clerk', 'analyst');

-- 6. List the employees who joined on 1-MAY-1981, 3-DEC-1981, 17-DEC-1981, 19-JAN-1980. 
insert into employee values(10, 'Priya', 'Pune', 655555555, 3, 'Retail', 120, 'HR', 15500, '1981-12-17', 88);
insert into employee values(11, 'Rohan', 'Pune', 9999985625, 3, 'Retail', 121, 'HR', 15500, '1981-05-01', 90);
select * from employee where join_date in ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19');

-- 7. List the employees who are working for Deptno 10 or20. 
insert into employee values(12, 'Rohan', 'Latur', 9555865925, 10, 'Testing', 122, 'Clerk', 8000, '1981-05-01', 98);
select * from employee where dept_no in (10, 20);

-- 8. List the Enames that start with ‘S’. 
select * from employee where e_name like 's%'; 

-- 9. Write a SQL query to find the highest salary. Return the highest salary.
select max(salary) as Highest_salary from employee;

-- 10. Display the name and the first five characters of the name starting with ‘H’. List all the employees except ‘PRESIDENT’ & ‘MGR” in ascending order of Salaries.
select e_name, substring(e_name, 1, 5) as name_first_five from employee where e_name like 'H%' and upper(designation) not in('president', 'mgr') order by salary asc;

-- 11. Display the minimum and maximum salary and Experience of the employee.
select min(salary) as min_salary, max(salary) as max_salary, min(experience) as min_experience, max(experience) as max_experience from employee;

-- 12. Display the total salary of all employees.
select sum(salary) from employee;

-- 13. Write a query to display the average salary of employees working in IT department.
insert into employee values(13, 'Prathamesh', 'Pune', 909999999, 20, 'IT', 123, 'Analyst', 58000, '1981-05-01', 98);
select avg(salary) from employee where dept_name='it'; 

-- 14. Display the Distinct salary of an employee.
select distinct salary from employee;

-- 15. Drop the database.
drop database company;