-- Query 3: Imp Question

--Write a SQL query to display only the details of employees who either earn the highest salary
--or the lowest salary in each department from the employee table.


select * from employee_tfq;

--my solution
with cte
as
(select e.*, max(salary) OVER (PARTITION BY e.dept_name) AS max_sal, min(salary) OVER (PARTITION BY e.dept_name) AS min_sal from employee_tfq e)
select * from cte where salary in (cte.max_sal, cte.min_sal);




