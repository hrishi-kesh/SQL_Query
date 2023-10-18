-----------------------find the manager of SCOTT till end using heirarchial query------------------
SELECT * FROM emp;
select empno,ename,level from emp start with ename='JONES' connect by prior empno= mgr;---employees working under johns
7566	JONES	1
7788	SCOTT	2
7876	ADAMS	3
7902	FORD	2
7369	SMITH	3

select empno,ename,level from emp start with ename='JONES' connect by empno=prior mgr;---employees having higher post then johns
7566	JONES	1
7839	KING	2

