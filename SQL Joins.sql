SELECT e1.last_name||' works for '||e2.last_name  
   "Employees and Their Managers" 
FROM employees e1, employees e2  
WHERE e1.manager_id = e2.employee_id 
      AND e1.last_name LIKE 'R%' 
ORDER BY e1.last_name
 
--o/p
Raphaely works for King

--LEFT OUTER JOIN example. The following example shows how a partitioned outer join fills data gaps in rows to facilitate analytic function specification and reliable report formatting. The example first creates a small data table to be used in the join.

SELECT d.department_id, e.last_name 
FROM departments d LEFT OUTER JOIN employees e 
ON d.department_id = e.department_id 
ORDER BY d.department_id, e.last_name

--o/p 
DEPARTMENT_ID	LAST_NAME
10	Whalen
20	Fay
20	Hartstein

--RIGHT OUTER JOIN example

SELECT d.department_id, e.last_name 
FROM departments d RIGHT OUTER JOIN employees e 
   ON d.department_id = e.department_id 
   ORDER BY d.department_id, e.last_name

--o/p
DEPARTMENT_ID	LAST_NAME
10	Whalen
20	Fay
20	Hartstein

---It is not clear from this result whether employees Grant and Zeuss have department_id NULL, or whether their department_id is not in the departments table. To determine this requires a full outer join.
SELECT d.department_id as d_dept_id, e.department_id as e_dept_id, 
      e.last_name 
FROM departments d FULL OUTER JOIN employees e 
   ON d.department_id = e.department_id 
ORDER BY d.department_id, e.last_name

--o/p 
D_DEPT_ID	E_DEPT_ID	LAST_NAME
10	10	Whalen
20	20	Fay
20	20	Hartstein

--Because the column names in this example are the same in both tables in the join, you can also use the common column feature by specifying the USING clause of the join syntax. The output is the same as for the preceding example except that the USING clause coalesces the two matching columns department_id into a single column output.
SELECT department_id AS d_e_dept_id, e.last_name 
FROM hr.departments d FULL OUTER JOIN hr.employees e 
USING (department_id) 
ORDER BY department_id, e.last_name
 
D_E_DEPT_ID	LAST_NAME
10	Whalen
20	Fay
20	Hartstein

---Using Antijoins: Example The following example selects a list of employees who are not in a particular set of departments.
SELECT * FROM employees 
   WHERE department_id NOT IN 
   (SELECT department_id FROM departments 
       WHERE location_id = 1700)
   ORDER BY last_name;

---Using Semijoins: Example In the following example, only one row needs to be returned from the departments table, even though many rows in the employees table might match the subquery. If no index has been defined on the salary column in employees, then a semijoin can be used to improve query performance.
SELECT * FROM departments 
   WHERE EXISTS 
   (SELECT * FROM employees 
       WHERE departments.department_id = employees.department_id 
       AND employees.salary > 2500)
   ORDER BY department_name
