create table my_table(id number primary key, kyc varchar2(10), flag char(1));

create sequence seq_my_table
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

insert into my_table(id,kyc)
with cte as (
select 1,'yes' from dual union all
select 2,'no' from dual union all
select 3,'yes' from dual union all
select 4,'yes' from dual union all
select 5,'no' from dual)
select * from cte;
insert into my_table(id,kyc) values(seq_my_table.currval+10,'no');

SELECT * FROM my_table;

create or replace procedure proc_my_table --we can use below case update
is
begin
update my_table set flag= case
when kyc='yes' then 'Y'
when kyc='no' then 'N'
end;
end;

begin
proc_my_table;
end;

update my_table set flag= case
when kyc='yes' then 'Y'
when kyc='no' then 'N'
end;

