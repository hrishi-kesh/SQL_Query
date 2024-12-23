-- Query 2:

--Write a SQL query to fetch the second last record from a employee table.

--Tables Structure:

--drop table employee;
create table employee_tfq
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee_tfq values(101, 'Mohan', 'Admin', 4000);
insert into employee_tfq values(102, 'Rajkumar', 'HR', 3000);
insert into employee_tfq values(103, 'Akbar', 'IT', 4000);
insert into employee_tfq values(104, 'Dorvin', 'Finance', 6500);
insert into employee_tfq values(105, 'Rohit', 'HR', 3000);
insert into employee_tfq values(106, 'Rajesh',  'Finance', 5000);
insert into employee_tfq values(107, 'Preet', 'HR', 7000);
insert into employee_tfq values(108, 'Maryam', 'Admin', 4000);
insert into employee_tfq values(109, 'Sanjay', 'IT', 6500);
insert into employee_tfq values(110, 'Vasudha', 'IT', 7000);
insert into employee_tfq values(111, 'Melinda', 'IT', 8000);
insert into employee_tfq values(112, 'Komal', 'IT', 10000);
insert into employee_tfq values(113, 'Gautham', 'Admin', 2000);
insert into employee_tfq values(114, 'Manisha', 'HR', 3000);
insert into employee_tfq values(115, 'Chandni', 'IT', 4500);
insert into employee_tfq values(116, 'Satya', 'Finance', 6500);
insert into employee_tfq values(117, 'Adarsh', 'HR', 3500);
insert into employee_tfq values(118, 'Tejaswi', 'Finance', 5500);
insert into employee_tfq values(119, 'Cory', 'HR', 8000);
insert into employee_tfq values(120, 'Monica', 'Admin', 5000);
insert into employee_tfq values(121, 'Rosalin', 'IT', 6000);
insert into employee_tfq values(122, 'Ibrahim', 'IT', 8000);
insert into employee_tfq values(123, 'Vikram', 'IT', 8000);
insert into employee_tfq values(124, 'Dheeraj', 'IT', 11000);
commit;

select * from employee_tfq;

--my solution
--way 1: using with cte
with cte
AS
(select emp_id, emp_name, dept_name, salary, ROW_NUMBER() over(order by emp_id desc) rn from employee_tfq)
select * from cte where rn=2; 

-- Solution: using sub query 
SELECT emp_id, emp_name, dept_name, salary
FROM (
    SELECT e.emp_id, e.emp_name, e.dept_name, e.salary,
           ROW_NUMBER() OVER (ORDER BY emp_id DESC) AS rn
    FROM employee_tfq e
) x
WHERE x.rn = 2;



