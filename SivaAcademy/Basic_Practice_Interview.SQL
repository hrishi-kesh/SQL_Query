select * from emp_dup;
select * from emp;
--1.Find the duplicate records
select ENAME,count(empno) from emp_dup group by empno,ENAME having COUNT(EMPNO)>1;
--1.1.Delete the duplicate records by keeping unique iord
delete from emp_dup where ROWID not in (select max(ROWID) from emp_dup group by empno);
--2. Find the third max salary department wise
with cte
as
(select empno,deptno,sal,dense_rank() over (partition by deptno order by sal desc) rnk from emp)
select empno,sal,deptno from cte where rnk=3;
--3. Print welcome in ladder format
/*
W 
WE
WEL
WELC
WELCO
WELCOM
WELCOME*/
select substr('WELCOME',1,level) from dual connect by level<=length('WELCOME');
--4.list all the employee above SMITH ---corelated query
SELECT EMPNO,ENAME FROM emp start with ename='SMITH' connect by empno=prior mgr; 
--4.2.list all the employee below KING ---corelated query
SELECT EMPNO,ENAME FROM emp start with ename='KING' connect by prior empno=mgr; 

-----replace all the charater from this string with null---
select replace('123 abc','abc') from dual;---removed abc from 123 abc
select replace('123 abc','abc','def') from dual;---replace abc with def
SELECT REGEXP_REPLACE('123abc456def', '[a-zA-Z]', '') AS cleaned_string FROM dual;--replace all alphabetical char
SELECT REGEXP_REPLACE('123abc456def', '123', '') AS cleaned_string FROM dual;--replace 123 with empty
SELECT REGEXP_REPLACE('123abc456def', '1|3', '') AS cleaned_string FROM dual;--replace 1 or 3 with empty

---Find the 1st day of the month in oracle---
SELECT TO_CHAR(TRUNC(sysdate, 'MM'), 'Day') AS first_day_of_month FROM dual;--shows name of 1st day of month
SELECT TO_CHAR(TRUNC(to_date('04052024','ddmmyyyy'), 'MM'), 'Day') AS first_day_of_month FROM dual;--shows name of 1st day of month
SELECT TRUNC(SYSDATE, 'yyyy') AS first_date_of_year FROM dual;---shows year 1st date
SELECT TRUNC(SYSDATE, 'mm') AS first_date_of_month FROM dual;---shows month 1st date
SELECT TRUNC(SYSDATE, 'day') AS first_date_of_week FROM dual;--shows week 1st date

select * from employees;
SELECT 
    employee_id,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS years_of_experience,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) - (TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) * 12) AS months_of_experience
FROM 
    EMPLOYEES;--find the years of experience including months for the employees

---create a procedure to take data from employees table and insert into employees_bkp table by creating this table


DECLARE
PROCEDURE Prc_Employee_bkp IS
sql_qry1 VARCHAR2(150);
sql_qry2 VARCHAR2(150);
BEGIN
        -- Create the backup table
    sql_qry1:='CREATE TABLE Employees_bkp AS SELECT * FROM employees WHERE 1=2';
    EXECUTE immediate sql_qry1;
    sql_qry2 :='INSERT INTO employees_bkp SELECT * FROM employees';
        -- Insert data into the backup table
    --INSERT INTO employees_bkp SELECT * FROM employees-- here normal insert shwow an error not because issue not in insert statement it just because to create table whole plsql block has to execute
    --if table is already created then we can do normal insert
    EXECUTE immediate sql_qry2;
    END Prc_Employee_bkp;
BEGIN
    Prc_Employee_bkp;
END;
/

delete from EMPLOYEES_BKP;
commit;
drop table EMPLOYEES_BKP;
select * from EMPLOYEES_bkp;
delete from EMPLOYEES_BKP where employee_id>150;
commit;
---create a procedure to take data from employees table and insert into employees_bkp table by creating this table
DECLARE
PROCEDURE Prc_Employee_bkp IS
sql_qry1 VARCHAR2(150);
sql_qry2 VARCHAR2(150);
BEGIN
    insert into EMPLOYEES_BKP select * from employees where employee_id>150;
    commit;
    END Prc_Employee_bkp;
BEGIN
    Prc_Employee_bkp;
END;
/

describe employees_bkp;--desc

SELECT REGEXP_REPLACE('123abc456def', '[a-zA-Z]', '') AS cleaned_string FROM dual;
SELECT REGEXP_SUBSTR('Contact us at support@example.com for assistance.', '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}') AS email
FROM dual;---it extract email from string
--[A-Za-z0-9._%+-]  :- allowed in email local part before @
-- The + quantifier means "one or more" of the pieding set. 
--[A-Za-z0-9.-]+   :- allowed in domain name after @
--\.  :- This matches a literal dot (.) in the domain part. The backslash (\) is used to escape the dot, as a dot in regular expressions matches any character.
--[A-Za-z]{2,}  :-[A-Za-z]: This defines a set of allowed characters for the top-level domain (TLD), such as "com", "org", "net", etc. It includes:
--A-Z: Uppercase letters.
--a-z: Lowercase letters.
--{2,}: This quantifier means "two or more" of the pieding set. Thus, the TLD must have at least two letters

alter table employees_bkp add CONSTRAINT chk_email CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));---it will throw error if data is already there and not validating this condition

select * from employees;

DECLARE
cursor c is select first_name, last_name, rowid as rid from employees where employee_id<=150;
lv_fname employees.FIRST_NAME%TYPE;
lv_lname employees.LAST_NAME%TYPE;
lv_rid rowid;
counter INTEGER := 0;
BEGIN
    for i in c LOOP
    update employees set email=i.first_name||'.'||i.last_name||'@gmail.com' where rowid=i.rid;
    end loop;
    commit;
end;
/

select * from employees;
alter table employees modify email varchar2(50);
ALTER TABLE employees 
modify (CREATED_DATE timestamp DEFAULT SYSTIMESTAMP, 
     UPDATED_DATE timestamp);




---below query again convert the email as original state
DECLARE
cursor c is select first_name, last_name, rowid as rid from employees;
counter INTEGER := 0;
BEGIN
    for i in c LOOP
    update employees set email=substr(i.first_name,1,1)||i.last_name where rowid=i.rid;
    end loop;
    commit;
end;
/

select * from employees e;
select * from EMPLOYEES_BKP;--email contrainst is modified
desc EMPLOYEES_bkp;
ALTER TABLE employees_bkp
add (CREATED_DATE timestamp DEFAULT SYSTIMESTAMP, 
     UPDATED_DATE timestamp);
---Create error_log table to log errors
CREATE TABLE error_log (
    log_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    error_message VARCHAR2(4000)
);

DECLARE
PROCEDURE Prc_Employee_bkp IS
sql_qry1 VARCHAR2(150);
sql_qry2 VARCHAR2(150);
v_error_message VARCHAR2(4000);
BEGIN
    insert into EMPLOYEES_BKP select * from employees where REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    commit;
        FOR i IN (SELECT * FROM employees WHERE NOT REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))-- Log rows that do not meet the constraint into error_log
        LOOP
            INSERT INTO error_log (error_message)
            VALUES ('Email constraint violation for employee with ID: ' || i.employee_id);
        END LOOP;
    exception
    WHEN OTHERS THEN
            v_error_message:=SUBSTR(SQLERRM, 1, 4000);
            INSERT INTO error_log (error_message)---- Log something diff error into error_log table
            VALUES (v_error_message);
            COMMIT;
    END Prc_Employee_bkp;
BEGIN
    Prc_Employee_bkp;
END;
/
select * from employees e;
select * from EMPLOYEES_BKP;
delete from EMPLOYEES_BKP;
commit;
select * from ERROR_LOG;
delete from ERROR_LOG;
commit;


-------EY july 2024  Interveiw Questions--------
--1. Write a function which takes empno as an input and return empname and deptno as output

--this question can be solve by three ways
--1. using sys_refcursor
--2. normal variable assigning
--3. using package variable for ref cursor

--- 1. using sys_refcursor
create or REPLACE FUNCTION fnc_ENameDeptId(p_empno in number)
RETURN sys_refcursor---using sys_refcursor
IS
v_emp_cursor SYS_REFCURSOR;
BEGIN
    open v_emp_cursor for select e.first_name||' '||e.last_name as E_Name, e.DEPARTMENT_ID from employees e where e.EMPLOYEE_ID=p_empno;
    return v_emp_cursor;
EXCEPTION 
    when others THEN
    RAISE_APPLICATION_ERROR(-20001, 'error-occurred'||SQLERRM);
    return null;
end;
/

select fnc_enamedeptid(100) from dual;---this will not work
--we need to call inside plsql block
DECLARE
v_cursor SYS_REFCURSOR;
v_name VARCHAR2(100);
v_deptid number;
BEGIN
    v_cursor:=fnc_ENameDeptId(100);
    loop
       fetch v_cursor into v_name,v_deptid;
       exit when v_cursor%notfound;
       dbms_output.PUT_LINE('Name: '||v_name||', Department Id: '||v_deptid);
    end loop;
    close v_cursor;
end;
/

--- 1.1 to pass list of employees in the function we need to modify function and create collection table by using create or replace type or declare type in plsql block while calling function  --TYPE empno_table IS TABLE OF NUMBER;

create or replace type empno_table is table of number;---instead of creating separate type we can declare type in plsql block while calling function  --TYPE empno_table IS TABLE OF NUMBER;
/

create or REPLACE FUNCTION fnc_ENameDeptId_CL(p_empno in empno_table)
RETURN sys_refcursor---using sys_refcursor
IS
v_emp_cursor SYS_REFCURSOR;
BEGIN
    open v_emp_cursor for select e.first_name||' '||e.last_name as E_Name, e.DEPARTMENT_ID from employees e where e.EMPLOYEE_ID in (select column_value from table(p_empno));---important info
    return v_emp_cursor;
EXCEPTION 
    when others THEN
    RAISE_APPLICATION_ERROR(-20001, 'error-occurred'||SQLERRM);
    return null;
end;
/

DECLARE
v_cursor SYS_REFCURSOR;
v_empnos empno_table:=EMPNO_TABLE(100,101,102);
v_name varchar2(100);
v_deptid number;
BEGIN
    v_cursor:=fnc_ENameDeptId_CL(v_empnos);
    LOOP
        fetch v_cursor into v_name,v_deptid;
        exit when v_cursor%notfound;
        dbms_output.PUT_LINE('Name: '||v_name||', Department Id: '||v_deptid);
        end LOOP;
        close v_cursor;
end;
/
--- 1.2 to pass list of employees in the function we need to create global temporary table

create global temporary table GTT_Empnos(empno number) on commit delete rows;

create or replace function fnc_ENameDeptId_GTT
return SYS_REFCURSOR
IS
v_emp_cursor SYS_REFCURSOR;
BEGIN
    open v_emp_cursor for select e.first_name||' '||e.last_name as ename,e.DEPARTMENT_ID from employees e where e.employee_id in (select empno from GTT_Empnos);
    return v_emp_cursor;
    exception
             when others THEN
             RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
             return null;
end;
/

DECLARE
v_cursor SYS_REFCURSOR;
v_ename VARCHAR2(100);
v_deptid number;
BEGIN
    insert into GTT_Empnos(empno) values(100);
    insert into GTT_Empnos(empno)  values(101);
    insert into GTT_Empnos(empno)  values(102);
    v_cursor:=fnc_ENameDeptId_GTT();
    loop
    fetch v_cursor into v_ename,v_deptid;
    exit when v_cursor%notfound;
    DBMS_OUTPUT.PUT_LINE('Name: ' ||v_ename|| ' Department id '||v_deptid);
    end loop;
    close v_cursor;
end;
/

---2. normal variable assigning

create or replace function fnc_ENameDeptId_Normal(empno in number)
return varchar2
is
v_ename varchar2(100);
v_deptid number;
v_result varchar2(200);
BEGIN
    select e.FIRST_NAME||' '||e.LAST_NAME as Ename,e.DEPARTMENT_ID into v_ename,v_deptid from employees e where e.employee_id=empno;
    v_result:=v_ename||' '||v_deptid;
    return v_result;
    exception
    when no_data_found THEN
    return 'Employees not found';
    when others THEN
    return 'An error occurred: '||SQLERRM;
end;
/

select fnc_ENameDeptId_Normal(100) from dual;

---3. using package variable for ref cursor

create or replace package emp_pkg
AS
type emp_ref_cursor is ref cursor;
function get_emp_details(p_empno in number) return emp_ref_cursor;
end emp_pkg;
/

create or replace package body emp_pkg
as
function get_emp_details(p_empno in number) return emp_ref_cursor
IS
emp_cursor emp_ref_cursor;
BEGIN
    open emp_cursor for select e.FIRST_NAME||' '||e.LAST_NAME as Ename,e.DEPARTMENT_ID from employees e where e.employee_id=p_empno;
    return emp_cursor;
exception when others then
RAISE_APPLICATION_ERROR(-20001, 'Error occurred: ' ||sqlcode||''||SQLERRM);
return null;
end get_emp_details;
end emp_pkg;
/

declare
emp_cursor emp_pkg.emp_ref_cursor;
v_ename varchar(50);
v_deptid number;
BEGIN
    emp_cursor:=emp_pkg.get_emp_details(100);
    loop
    fetch emp_cursor into v_ename, v_deptid;
    exit when emp_cursor%notfound;
    dbms_output.PUT_LINE(v_ename||' '||v_deptid);
    END LOOP;
    CLOSE emp_cursor;
exception
    when others then
    RAISE_APPLICATION_ERROR(-20001, 'Error occurred: ' ||sqlcode||' '||sqlerrm);
end;
/

----------to handle exception in proper order if employee number not exist in table 
DECLARE
  emp_cursor emp_pkg.emp_ref_cursor;
  v_ename VARCHAR2(50);
  v_deptid NUMBER;
  no_data_found BOOLEAN := TRUE; -- Flag to check if no data is found
BEGIN
  emp_cursor := emp_pkg.get_emp_details(100);

  LOOP
    FETCH emp_cursor INTO v_ename, v_deptid;
    EXIT WHEN emp_cursor%NOTFOUND;
    no_data_found := FALSE; -- Set flag to FALSE if data is found
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename || ', Department ID: ' || v_deptid);
  END LOOP;
  
  CLOSE emp_cursor;

  if no_data_found THEN
    RAISE_APPLICATION_ERROR(-20002, 'No data found for the given employee number.');
    END IF;
  exception
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'Error occurred: ' || SQLCODE || ' ' || SQLERRM);
END;
/


-------EY july 2024 Interveiw Questions--------
--2. Write a Trigger which throw  error when we insert/update data in table 

select * from employees e;
create or replace trigger Trig_InsUpd
before insert or update on employees
for each row
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'error occurred'||sqlcode||'-'||sqlerrm);
end;
/

-------Fiserv july 2024 Interveiw Questions--------
/*
1. How to remove all space from a string?
2. write a query to list out user name who don't have access_role 2 and 3 
3. While migrating data from one database to another what things we need to focus most?
*/
--1. Answer
SELECT REGEXP_REPLACE(TRIM('  This   is   a    sample   string.  '), '\s+', ' ') AS cleaned_text
FROM dual;

--2. write a query to list out user name who don't have access_role 2 and 3 
--2. Answer

CREATE TABLE UserAccess (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    access_role INT
);

INSERT INTO UserAccess (id, name, access_role)
SELECT 1, 'abc', 1 FROM dual UNION ALL
SELECT 2, 'abc', 2 FROM dual UNION ALL
SELECT 3, 'abc', 3 FROM dual UNION ALL
SELECT 4, 'abc1', 1 FROM dual UNION ALL
SELECT 5, 'abc1', 3 FROM dual UNION ALL
SELECT 6, 'abc2', 1 FROM dual UNION ALL
SELECT 7, 'abc2', 4 FROM dual UNION ALL
SELECT 8, 'abc3', 4 FROM dual;
commit;

select name from useraccess where name not in (select name from useraccess where access_role in (2,3)) group by name;

--3. While migrating data from one database to another what things we need to focus most?
/*
1. Data Integrity and Consistency:
   Data Validation:
    Data Mapping:
    Transformation Rules:
2. Database Compatibility:
   Schema Compatibility: 
   Data Type Mapping:
3. Migration Strategy:
   Full vs. Incremental Migration:
   Downtime Minimization:
   Backup and Rollback Plan: 
4. Testing and Validation:
   Pre-Migration Testing:
   Post-Migration Validation:
5. Performance Considerations:
   Indexing:
   Query Optimization:
   Resource Management:
6. Security:
   User Access Control: 
   Data Encryption: 
7. Application Compatibility:
   Connection Strings: 
   Code Compatibility: 
   Testing Applications:
8. Documentation:
   Migration Plan:
   Post-Migration Documentation:
9. Communication:
   Stakeholder Communication: 
   Training: 
10. Legal and Compliance Considerations:
   Data Retention Policies:
   Regulatory Requirements:
*/

--1. If our query is taking much time to execute what could be the possible reason and solutions for it.
/*
1. Inefficient Query Design
2. Lack of Indexing
3. Large Dataset or Table Scans
4. Poor Execution Plan
5. Locking and Contention
6. Insufficient Resources
7. Network Latency
8. Suboptimal Database Configuration
9. Missing or Inappropriate Use of Caching
*/

--LTIMindtree Interview Question
--HINT
/*
In Oracle PL/SQL, a hint is a directive that you can provide within a SQL statement to influence the execution plan generated by the Oracle optimizer. By default, the Oracle optimizer determines the most efficient way to execute a query based on factors such as table statistics, available indexes, and data distribution. However, sometimes you may want to guide or override the optimizer's decisions by using hints.

--SELECT /*+ HINT_NAME */ --column1, column2
--FROM table_name
--WHERE condition;-- we can use hint inside any dml statements or select statement
/*
Types of hints
1. Optimizer Mode Hints: ALL_ROWS, FIRST_ROWS(n)
2. Access Method Hints: INDEX NO_INDEX(tab_name or alias,ind_name) INDEX(tab_name or alias,ind_name), FULL -These hints tell the optimizer how to access tables and indexes
3. Join Method Hints: USE_NL, USE_HASH, USE_MERGE 

USE_NL: Forces a nested loop join.
USE_HASH: Forces a hash join.
USE_MERGE: Forces a sort-merge join

4. Parallel Execution Hints: These hints allow parallelism to speed up the execution of a query.
  PARALLEL
SELECT /*+ PARALLEL(e, 4) */ --e.employee_id
--FROM employees e;
/*
5. Join Order Hints:
ORDERED: Forces the optimizer to join the tables in the order specified in the query.
LEADING: Specifies the leading table in the join order.

SELECT /*+ FULL(e) USE_NL(d e) ORDERED */ --e.name, d.department_name
--FROM employees e, departments d
--WHERE e.department_id = d.department_id;-- here we are using multiple hints

select /*+ first_rows(5) */ * from employees;--in explains plan under row section it will show 5

 -- CARELONE Interview question 
 --Write a procedure which return multple values in single out parameter

 create or replace procedure prc_Carelone(empno in number, out_cur out SYS_REFCURSOR)
 IS
 BEGIN
      open out_cur for select e.first_name||' '||e.last_name as E_name, e.job_id,e.SALARY from employees e where e.employee_id=empno;
EXCEPTION
      when others then
      RAISE_APPLICATION_ERROR(-20001, 'Error Occurred'||SQLERRM);
end;
/

DECLARE
v_cur SYS_REFCURSOR;
v_ename varchar2(100);
v_job_id varchar2(100);
v_sal number;
BEGIN
    prc_Carelone(100,v_cur);
    loop
    fetch v_cur into v_ename,v_job_id,v_sal;
    exit when v_cur%notfound;
    dbms_output.put_line(v_ename||' '||v_job_id||' '||v_sal);
    end loop;
    close v_cur;
end;
/

---if you mention out parameter as sys_refcursor then you can use fetch inside the anonymous block while calling the procedure

-----------------------------------MedImpact GBS Interview Questions-------------------------------

CREATE TABLE customer (
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(100)
);

CREATE TABLE orders (
    o_id NUMBER PRIMARY KEY,
    cust_id NUMBER,
    price NUMBER,
    new_price NUMBER,
    inc_price NUMBER,
    CONSTRAINT fk_cust FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

INSERT INTO customer (cust_id, cust_name) VALUES (1, 'A');
INSERT INTO customer (cust_id, cust_name) VALUES (2, 'B');
INSERT INTO customer (cust_id, cust_name) VALUES (3, 'C');
INSERT INTO customer (cust_id, cust_name) VALUES (4, 'D');
commit;
INSERT INTO orders (o_id, cust_id, price, new_price) VALUES (1, 1, 100, 100);
INSERT INTO orders (o_id, cust_id, price, new_price) VALUES (2, 1, 200, 300);
INSERT INTO orders (o_id, cust_id, price, new_price) VALUES (3, 1, 150, 450);
INSERT INTO orders (o_id, cust_id, price, new_price) VALUES (4, 2, 500, 500);
INSERT INTO orders (o_id, cust_id, price, new_price) VALUES (5, 3, 1000, 1000);
INSERT INTO orders (o_id, cust_id, price, new_price) VALUES (6, 3, 2000, 3000);
commit;

select * from customer;
MERGE INTO orders o
USING (
    SELECT o_id,
           price - LAG(price, 1, 0) OVER (PARTITION BY cust_id ORDER BY o_id) AS Inc_Price
    FROM orders
) calc
ON (o.o_id = calc.o_id)
WHEN MATCHED THEN
UPDATE SET o.inc_price = calc.Inc_Price;

--Q 1: How can you retrieve the names of customers who have no orders in the orders table?
select c.cust_id, c.cust_name from customer c left outer join Orders o on c.cust_id=o.cust_id where o.o_id is null;

--Q 2: How would you calculate the cumulative sum of the price column within each customer (cust_id) group, ordered by price, using the SUM window function?
select o_id,cust_id,price,sum(price) over (partition by cust_id order by o_id) as new_price from orders o;--this will show running sum of price column for each customer id wise--showing 100,300,450,500,1000,3000

select o_id,cust_id,price,sum(price) over (partition by cust_id) as new_price from orders o;--This one is cummulative sum, Actually, in window functions, when you do not specify ORDER BY within the OVER clause, it does not default to ascending or any other order for cumulative operations. Instead, it treats the operation as a total aggregation for each partition without a running sum.---showing 450,450,450,500,3000,3000
--It is only aggregating cust_id wise


--Q 3: How can you calculate the difference in the price between each order and its preceding order for each customer using a window function?
select price - lag(price,1,0) over(partition by cust_id  order by o_id) Inc_Price  from orders;

--To update this in last column we can use below query
MERGE INTO orders o
USING (
    SELECT o_id,
           price - LAG(price, 1, 0) OVER (PARTITION BY cust_id ORDER BY o_id) AS Inc_Price
    FROM orders
) calc
ON (o.o_id = calc.o_id)
WHEN MATCHED THEN
UPDATE SET o.inc_price = calc.Inc_Price;

--Preparing of TechM interview on 21 Dec 24
--How can we ensure the execution plan reflects the latest database state in Oracle?

--Ans
/*
Gather Updated Statistics: Use the DBMS_STATS package to collect statistics on tables, indexes, and schemas. Updated statistics help the optimizer generate an accurate execution plan. */

BEGIN
   DBMS_STATS.GATHER_TABLE_STATS('SCHEMA_NAME', 'TABLE_NAME');
END;
/

--Check for Stale Statistics: Use the USER_TAB_STATISTICS view to identify tables with stale or outdated statistics.

SELECT table_name, stale_stats
FROM user_tab_statistics
WHERE stale_stats = 'YES';

--Flush the Shared Pool (Optional): If outdated cached execution plans are being reused, flushing the shared pool can help. Use this cautiously in production environments:

ALTER SYSTEM FLUSH SHARED_POOL;

--Use SQL Plan Baselines or Hints (Optional): If the plan remains suboptimal after updating statistics, use SQL plan baselines or hints to enforce a better plan.

--Verify the Plan: Use the EXPLAIN PLAN command or the DBMS_XPLAN.DISPLAY function to review the new execution plan:

EXPLAIN PLAN FOR SELECT * FROM TABLE_NAME;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

--Ensure Dynamic Sampling (if applicable): If statistics cannot be updated, enabling dynamic sampling for specific queries can improve plan accuracy:

ALTER SESSION SET OPTIMIZER_DYNAMIC_SAMPLING = 4;


--if we delete and commit then how can we retrive in oracle db

--Once a DELETE operation is performed and followed by a COMMIT in Oracle Database, the data is permanently removed from the database and cannot be retrieved using standard rollback mechanisms. However, there are some advanced methods to potentially recover the data:

--1. Using Flashback Query (if enabled)
--If the database has UNDO data available and flashback features are enabled, you can use a flashback query to retrieve the deleted data.

SELECT * 
FROM emp 
AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE);
--Replace 5 with the number of minutes ago the data was deleted.

--2. Using Flashback Table
--If flashback is enabled for the table, you can restore it to a previous point in time.

FLASHBACK TABLE table_name TO TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE);
--This restores the entire table to its previous state.
/*
3. Using RMAN (Database Backup)
If you have a backup of the database, you can perform a point-in-time recovery or extract the deleted data from the backup.

Use RMAN to restore the database to a point before the deletion.
Alternatively, restore to a different instance and export the data.
4. Using LogMiner
If the database has archived redo logs, you can analyze them using LogMiner to identify and recover the deleted rows.

sql
Copy code
EXECUTE DBMS_LOGMNR.START_LOGMNR(
   STARTTIME => TO_DATE('YYYY-MM-DD HH24:MI:SS', 'YYYY-MM-DD HH24:MI:SS'),
   ENDTIME   => TO_DATE('YYYY-MM-DD HH24:MI:SS', 'YYYY-MM-DD HH24:MI:SS')
);

SELECT * FROM V$LOGMNR_CONTENTS WHERE OPERATION = 'DELETE';
5. Using Data Pump or Export
If a recent export was taken using expdp or exp, you can import the data back into the database.
*/

--------------------------Walking Tree Assessment Test-----------------------

--1. Find the employees who are earning salary more than their manager's salary
select e.first_name from employees e, employees d where e.MANAGER_ID=d.employee_id and e.salary>d.salary;

--verification
select * from EMPLOYEES where first_name in ('Ellen','Lisa');--salary- 11000,11500 Manager_id 149,148  manager salary 10500 11000
select * from EMPLOYEES where employee_id in ('149','148');--manager_id
--2. Find the department name who has no employees
select  d.department_name from employees e left join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID and d.DEPARTMENT_ID is null; 

select * from employees where department_id is null;
--3. Find the employees who is earing maximum salary in their respective department
with cte
as
(select e.*, dense_rank()over(partition by department_id order by salary desc) rn from EMPLOYEES e)
select  EMPLOYEE_ID from cte where rn=1;
--verifications
select e.*, dense_rank()over(partition by department_id order by salary desc) rn from EMPLOYEES e;

--4. Find the employees who are managers.

SELECT DISTINCT e.manager_id AS manager_id, m.first_name AS manager_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

--5. Find the employees who are working in the same department as their manager.

SELECT e.employee_id, e.First_name, e.department_id
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.department_id = m.department_id;

--6. Find the employees who have the same salary as another employee.

SELECT e1.employee_id, e1.First_name, e1.salary
FROM employees e1
JOIN employees e2 ON e1.salary = e2.salary AND e1.employee_id != e2.employee_id;


--------------------------TechM Manegerial round 24 Dec 24-----------------------
/* write a query to get the unmatched records from both the table
table1
e1	d1
e2  d2
e3  d3

table2
e1	d1
e2  d2
e5	d5 */

SELECT * 
FROM table1 t1
FULL OUTER JOIN table2 t2 
ON t1.e1 = t2.e1 AND t1.d1 = t2.d1
WHERE t1.e1 IS NULL OR t2.e1 IS NULL;

/*
Write a query to find the total sales data for each region (region_name) for the last year (relative to the current date) where the total sales exceed 1000. Use a Common Table Expression (CTE) to structure the query, and ensure the results include only the region names.
*/
create TABLE Sales_data (
    region_name VARCHAR2(100),
    sales_date DATE,
    amount NUMBER(10, 2),
    product_id VARCHAR2(50),
    sales_rep VARCHAR2(100),
    transaction_id VARCHAR2(50) PRIMARY KEY,
    created_at DATE DEFAULT SYSDATE
);

-- Index on region_name and sales_date to optimize queries that filter by region and date
CREATE INDEX idx_sales_region_date ON Sales_data(region_name, sales_date);

-- Index on amount for faster aggregation queries
CREATE INDEX idx_sales_amount ON Sales_data(amount);

BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO Sales_data (region_name, sales_date, amount, product_id, sales_rep, transaction_id, created_at)
        VALUES (
            'Region' || MOD(i, 10),  -- Generating region names (Region0, Region1, ..., Region9)
            TO_DATE('2023-' || LPAD(MOD(i, 12) + 1, 2, '0') || '-01', 'YYYY-MM-DD'),  -- Assigning months from January 2023 to December 2023
            ROUND(DBMS_RANDOM.VALUE(50, 200), 2),  -- Random sales amount between 50 and 200
            'P' || TO_CHAR(MOD(i, 10) + 1),  -- Random product IDs (P1, P2, ..., P10)
            'SalesRep' || TO_CHAR(MOD(i, 5) + 1),  -- Sales representative names (SalesRep1, SalesRep2, ..., SalesRep5)
            'T' || TO_CHAR(i),  -- Transaction IDs (T1, T2, ..., T100)
            SYSDATE  -- Setting the created_at column to the current date
        );
    END LOOP;
    COMMIT;
END;
/

WITH cte AS (
  SELECT 
    region_name,
    SUM(amount) AS total_sales
  FROM Sales_data
  WHERE EXTRACT(YEAR FROM TO_DATE(sales_date, 'YYYY-MM-DD')) = EXTRACT(YEAR FROM SYSDATE) - 1
  GROUP BY region_name
)
SELECT region_name
FROM cte
WHERE total_sales > 1000;

--------------------------Consert ai assessment round 24 Dec 24-----------------------
--1. Write a SQL Query to generate fibonacci series up to 100
DECLARE
    n1 NUMBER := 0;
    n2 NUMBER := 1;
    next NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('series');
    DBMS_OUTPUT.PUT_LINE(n1); 
    DBMS_OUTPUT.PUT_LINE(n2);

    LOOP
        next := n1 + n2;
        EXIT WHEN next > 100;
        DBMS_OUTPUT.PUT_LINE(next);
        n1 := n2;
        n2 := next;
    END LOOP;
END;
/

--Join interview questions
select * from tab_a inner join tab_b on tab_a.id=tab_b.id;--it will show 0 if no data in both the table 
--find the non matching records from both the tables
select * from tab_a a full outer join tab_b b on a.id = b.id where a.id is null or b.id is null;

--Capgemini Interview Questions in April 2025
--IPL_Teams
CREATE TABLE IPL_Teams (
    Team1 VARCHAR2(50),
    Team2 VARCHAR2(50),
    Winner VARCHAR2(50)
);

select * from IPL_Teams;

--We want to count the number of matches won by each team, including teams that never won (i.e., their count would be 0).
SELECT t.team, COUNT(m.winner) AS win_count
FROM (
  SELECT team1 AS team FROM IPL_Teams
  UNION
  SELECT team2 AS team FROM IPL_Teams
) t
LEFT JOIN IPL_Teams m
  ON t.team = m.winner
GROUP BY t.team
ORDER BY win_count DESC;

select winner, count(winner) as win_count from IPL_Teams group by winner order by win_count desc;--this will show the winner team and their count of winning matches


--Genpact DB ETL Developer Interview Questions in April 2025
/*
1. Find the unique records from the table emp_gen.

"EMP_ID","EMP_NAME"
1,"hrish"
1,"hrish"
2,"hrish"
2,"Alok"
3,"Siva"
3,"Siva"
4,"John"
4,"John"
5,"Mike"
5,"Mike"
6,"Alice"
6,"Alice"
7,"Bob"
7,"Bob"
8,"Emma"
8,"Emma"
9,"Raj"
9,"Raj"
10,"Priya"
10,"Priya"

*/
CREATE TABLE emp_gen (
    emp_id NUMBER,
    emp_name VARCHAR2(50)
);

INSERT INTO emp_gen (emp_id, emp_name) VALUES (1, 'hrish');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (1, 'hrish');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (2, 'hrish');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (2, 'Alok');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (3, 'Siva');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (3, 'Siva');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (4, 'John');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (4, 'John');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (5, 'Mike');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (5, 'Mike');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (6, 'Alice');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (6, 'Alice');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (7, 'Bob');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (7, 'Bob');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (8, 'Emma');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (8, 'Emma');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (9, 'Raj');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (9, 'Raj');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (10, 'Priya');
INSERT INTO emp_gen (emp_id, emp_name) VALUES (10, 'Priya');

COMMIT;

select * from emp_gen;--this will show duplicate records

--1. Find the unique records from the table emp_gen.
select emp_id, emp_name from (select emp_id, emp_name, row_number() over(partition by emp_id order by emp_name)
 rnk from emp_gen) where rnk=1;--this will show unique records

with cte
as 
(select emp_id, emp_name, row_number() over(partition by emp_id order by emp_name)
 rnk from emp_gen)
select emp_id, emp_name from cte where rnk=1;--this will show unique records

--Defragmentation and index rebuild
--Genpact DB ETL Developer 2nd Round Interview Questions in April 2025
--Q1. Extract domain name from an email column 
select email,substr(email,instr(email,'@')+1) as domain_name from employees;--this will show domain name from email column. If third parameter is not given then it will take the length of string as default. length(email)

--2nd way
-- Extract the domain name from the email column using REPLACE.
SELECT 
    email,
    REPLACE(email, SUBSTR(email, 1, INSTR(email, '@'))) AS domain_name---if third paramerter is not given then it will take the empty string as default like this ''
FROM employees;

-- Explanation:
-- 1. SUBSTR(email, 1, INSTR(email, '@')) extracts the part of the email string up to and including the '@' character.
-- 2. REPLACE(email, SUBSTR(email, 1, INSTR(email, '@'))) removes this part, leaving only the domain name.

select * from employees;
/*SELECT trigger_name, trigger_type, triggering_event, table_name, status
FROM user_triggers
WHERE trigger_name = 'TRIG_INSUPD';

SELECT text
FROM user_source
WHERE name = 'TRIG_INSUPD'
ORDER BY line;
*/
--Since this trigger is already there so it is not allowing to update the table so we need to drop the trigger first
--DROP TRIGGER SIVAACADEMY.TRIG_INSUPD;

--2.To count how many dots (.) are in a string like 'a.b.c.d@gmail.com' in Oracle SQL

SELECT LENGTH('a.b.c.d@gmail.com') - LENGTH(REPLACE('a.b.c.d@gmail.com', '.', '')) AS dot_count
FROM dual;

SELECT REGEXP_COUNT('a.b.c.d@gmail.com', '.') AS dot_count FROM dual;--2nd way '/.'-->4 and '.'-->17 bcoz counting all characters including dot and space its regular expression pattern match.

SELECT CASE 
         WHEN REGEXP_LIKE('abc1234', '\d') THEN 'TRUE' --This checks if the string 'abc123' contains at least one digit (\d is the regular expression for a digit).
         ELSE 'FALSE' 
       END AS result,
       LENGTH('abc1234') - LENGTH(REGEXP_REPLACE('abc1234', '\d', '')) AS digit_count, --This calculates the count of digits in the string by replacing all digits with an empty string and subtracting the length of the modified string from the original string length.
FROM dual;
-- Output: TRUE,4

SELECT LENGTH('abc1234') - LENGTH(REGEXP_REPLACE('abc1234', '\D', '')) AS non_digit_count FROM dual;
-- Output: 3 (has only non-digits)











