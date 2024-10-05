---Progms works with sivaacademy---
---Explain plan video lecture material got from "Read Oracle SQL Execution Plan | DBMS XPLAN" DBA GENESIS

set autotrace on; --for generating explain plan every time when running select statement 
set autotrace off; --off explain plan every time

select * from emp;

EXPLAIN plan for select * from emp where empno=7698;
select plan_table_output from table(dbms_xplan.display());--it shows explain plan on same query output page

EXPLAIN plan for select e.EMPNO,e.ENAME,d.DEPTNO, d.DNAME from emp e inner join dept d on e.DEPTNO=d.DEPTNO fetch first 5 rows only;
select plan_table_output from table(dbms_xplan.display());
