---emp table and dept table values we got from livesql.oracle.com
select * from  emp;
create table table1(ID int);
create table table2  as select * from table1;
insert into table1 values(null);
select * from table4;
select * from table1 a full join table2 b on a.id=b.id;
create table  table4 as select * from table2;
insert into table4 values(2);
insert into table4 values(2);
insert into table4 values(0);
insert into table4 values(null);

select * from table3 a full join table4 b on a.id=b.id;

select a.id,count(a.id),dense_rank() over(partition by a.id order by a.id) from table3 a group by a.id;
select a.id,count(a.id) from table3 a group by a.id;

select * from emp;
select sum(sal), deptno from emp group by deptno;
with cte as (select sal, deptno, dense_rank() over (partition by deptno order by sal desc) as row_number from emp)
select *from cte where row_number=2;












