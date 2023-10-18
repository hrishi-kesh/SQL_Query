-----------------Geekcoder SQL Interview(YT)---------------------
--10. print 1 to 0 without using plsql loop
with cte (id)
as
(
select 1 from dual
union all
select id+1 from cte
where id<50)

SELECT * FROM cte;

--13. find out missing ids using recursive CTE
create table GC_13(id number primary key);
insert into gc_13 values(1);
insert into gc_13
with cte
as
(select 2 from dual
union all
select 4 from dual
union all
select 6 from dual
union all
select 7 from dual
union all
select 8 from dual
union all
select 10 from dual)
SELECT * FROM cte;

SELECT * FROM gc_13;

with cte(id)
as
(select 1 from dual
union all
select id+1 from cte
where id<10)
SELECT id FROM cte
minus
SELECT id FROM gc_13;
--14 Find the possible pair of these countries with non non matching
create table GC_14(country varchar2(10));
insert all
into gc_14 values('india')
into gc_14 values('china')
into gc_14 values('pakistan')
into gc_14 values('srilanka')
select 1 from dual;
commit;

with cte
as
(select country,row_number() over (order by country) as row_num from gc_14)
select (e1.country||'-'||e2.country) country_pair from cte e1,cte e2 where e1.row_num<e2.row_num;
o/p-china-india
china-pakistan
china-srilanka
india-pakistan
india-srilanka
pakistan-srilanka

--15. swappig of column values
create table GC_15(id_a number(10),id_b number(10));
insert all
into gc_15 values(1,100)
into gc_15 values(2,200)
into gc_15 values(3,300)
into gc_15 values(4,400)
select 1 from dual;
SELECT * FROM gc_15;

update gc_15 set id_a=id_b,id_b=id_a;
commit;


