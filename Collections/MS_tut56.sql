create or replace type dbObj_vry is varray(5) of number;---obj type create of varray
/
create table calendar(
day_name varchar2(25),
day_date dbObj_vry);
/
insert into calendar values('sunday',dbObj_vry(1,16,17,18));-- careful while inserting data in end column put obj type then value
commit;
SELECT * FROM calendar;
select tab1.day_name,vry.column_value from calendar tab1,table(tab1.day_date) vry;--select 2nd column in tabular structure in relational 
--format



