select * from emp_dup;
select * from emp;
--1.Find the duplicate records
select ENAME,count(empno) from emp_dup group by empno,ENAME having COUNT(EMPNO)>1;
--1.1.Delete the duplicate records by keeping unique record
delete from emp_dup where ROWID not in (select max(ROWID) from emp_dup group by empno);
--2. Find the third max salary department wise
with cte
as
(select deptno,sal,dense_rank() over (partition by deptno order by sal desc) rnk from emp)
select sal,deptno from cte where rnk=3;
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
SELECT REGEXP_REPLACE('123abc456def', '[a-zA-Z]', '') AS cleaned_string FROM dual;

---Find the 1st day of the month in oracle---
SELECT TO_CHAR(TRUNC(sysdate, 'MM'), 'Day') AS first_day_of_month FROM dual;--shows name of 1st day of month
SELECT TO_CHAR(TRUNC(to_date('04052024','ddmmyyyy'), 'MM'), 'Day') AS first_day_of_month FROM dual;--shows name of 1st day of month
SELECT TRUNC(SYSDATE, 'yyyy') AS first_day_of_year FROM dual;---shows year 1st date
SELECT TRUNC(SYSDATE, 'mm') AS first_day_of_month FROM dual;---shows month 1st date
SELECT TRUNC(SYSDATE, 'day') AS first_day_of_week FROM dual;--shows week 1st date




