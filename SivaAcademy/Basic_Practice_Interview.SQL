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
SELECT TRUNC(SYSDATE, 'yyyy') AS first_day_of_year FROM dual;---shows year 1st date
SELECT TRUNC(SYSDATE, 'mm') AS first_day_of_month FROM dual;---shows month 1st date
SELECT TRUNC(SYSDATE, 'day') AS first_day_of_week FROM dual;--shows week 1st date

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


-------EY Interveiw Questions--------
--1. Write a function which takes empno as an input and resturn empname and deptno as output

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
    RAISE_APPLICATION_ERROR(-2001, 'error-occurred'||SQLERRM);
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
    RAISE_APPLICATION_ERROR(-2001, 'error-occurred'||SQLERRM);
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


-------EY Interveiw Questions--------
--2. Write a Trigger which throw  error when we insert/update data in table 

select * from employees e;
create or replace trigger Trig_InsUpd
before insert or update on employees
for each row
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'error occurred'||sqlcode||'-'||sqlerrm);
end;
/





















