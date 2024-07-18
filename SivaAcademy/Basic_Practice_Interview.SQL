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
SELECT REGEXP_REPLACE('123abc456def', '1|3', '') AS cleaned_string FROM dual;--replace 11 or 3 with empty

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













