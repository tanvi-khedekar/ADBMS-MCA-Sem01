/* Joins */

create database Basicjoin;

use Basicjoin;

create table employee(
	employee_id int primary key,
    ename varchar(50)
);

desc employee;

insert into employee(employee_id, ename)
values
(101,'Raghav'),
(102,'Raashi'),
(103,'Rohan'),
(104,'Raj'),
(105,'Mohan');

create table project(project_id int primary key,
	pname varchar(50),
    employee_id int,
    foreign key (employee_id)
    references employee(employee_id));
    
insert into project
(project_id,pname, employee_id)
values
(1, 'Project A',101),
(2, 'Project B',102),
(3, 'Project C',101),
(4, 'Project D',103);   

insert into project values();

insert into employee values(107,'Sanjay');

insert into employee values(106,'Akshay'); 

/* Inner Join */

select * from employee
JOIN project
ON employee.employee_id = project.employee_id;

select e.ename, p.pname from employee e
INNER JOIN project p
ON e.employee_id = p.employee_id; 

/* Right Join */

select e.ename, p.pname from employee e
RIGHT JOIN project p
ON e.employee_id = p.employee_id;

select e.ename, p.pname from project p
RIGHT JOIN employee e
ON e.employee_id = p.employee_id;

select e.employee_id, e.ename, p.pname from employee e
LEFT JOIN project p
ON e.employee_id = p.employee_id;

insert into project values(7,'Project G',105);

/* Full Outer Join using Union - It display all records from both tables  */

select * from employee
LEFT JOIN project
ON employee.employee_id = project.employee_id
UNION
select * from employee
RIGHT JOIN project
ON employee.employee_id = project.employee_id;

/* Display */

select employee.ename, project.pname
from employee
LEFT JOIN project
ON employee.employee_id = project.employee_id
where project.employee_id IS NOT NULL;

select employee.ename, project.pname
from employee
LEFT JOIN project
ON employee.employee_id = project.employee_id
where project.employee_id IS NULL;