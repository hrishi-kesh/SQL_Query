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


