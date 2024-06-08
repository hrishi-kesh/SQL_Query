--------------techTFQ------- SQL Window Function----

select e.*, max(sal) over() as max_sal from emp e; ---here over() act as a windows function with aggregate function
select e.*, max(sal) over(partition by e.DEPTNO) as max_sal from emp e; ---showing department wise max sal
--find the two new employees joined in each department
select * from (select e.*, row_number() over(partition by e.DEPTNO order by e.empno) as rn from emp e) x where x.rn<3; 
