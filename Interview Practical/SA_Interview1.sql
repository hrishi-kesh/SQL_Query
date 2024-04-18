--All these Siva Academy questions were run on HR schema--
--Ques 1 Diff between Delete and Truncate--
---1.Del:- Tgigger will get fired on delete triggers
---1.Trunc:-No Trigger will get involved
---2.Del:- wont reclain space used by table
---2.Truc:-Reclaim space used by table
---3.Del:-wont reset the high watermark
---3.Truc:-rest the high watermark
---4.Del:-"on delete cascade" from oracle 12c
---4.Trun:-"Truncate table <tab_name> cascade"from 12c
-------------Explanation of diff 1---------------------
create table Emp_Tab_Sample(
    empno number primary KEY,
    ename varchar2(100)
);

insert into EMP_TAB_SAMPLE(
    select level, 'emp_name'||level from dual connect by level<=100
);
commit;

select * from EMP_TAB_SAMPLE;

create or replace Trigger Trigg_on_Emp_Tab_Sample after
insert or update or Delete on Emp_Tab_Sample
for each row
begin
RAISE_APPLICATION_ERROR(-20001, 'Trigger Fired Successfully');
end;

--alter trigger Trigg_on_Emp_Tab_Sample enable;

delete from EMP_TAB_SAMPLE;

--truncate table EMP_TAB_SAMPLE;

-------------Explanation of diff 2---------------------
drop table EMP_TAB_SAMPLE;
create table Emp_Tab_Sample(
    empno number primary KEY,
    ename varchar2(100)
);

insert into EMP_TAB_SAMPLE(
    select level, 'emp_name'||level from dual connect by level<=100000
);
commit;

exec dbms_stats.GATHER_TABLE_STATS(user,'Emp_Tab_Sample',cascade=>true);

select * from EMP_TAB_SAMPLE;

--this explanation only works in sysdba or system privileges

------------------------4 diff explanation on delete cascase and truncate table <tab_name> cascade

create table continent_tab(
    con_id number primary key,
    con_name varchar2(100)
);

create table country_tab(
    country_id number primary key,
    country_name varchar2(100),
    cont_id number,
    CONSTRAINT country_fk FOREIGN key(cont_id) references continent_tab(con_id)
);

create table state_tab(
    state_id varchar2(100) primary key,
    state_name varchar2(100),
    country_id number,
    constraint state_fk foreign key(country_id) references country_tab(country_id) 
);


insert into continent_tab values('10001','North America');

insert into Country_tab values('1001','Canada','10001');
insert into Country_tab values('1002','Greenland','10001');
insert into Country_tab values('1003','United States','10001');
insert into Country_tab values('1004','Mexico','10001');

insert into State_tab values('S1','California','1003');
insert into State_tab values('S2','Florida','1003');
insert into State_tab values('S3','Mississippi','1003');
insert into State_tab values('S4','New Jersey','1003');
insert into State_tab values('S5','Washington','1003');
commit;
select * from continent_tab;
select * from country_tab;
select * from state_tab;

delete from CONTINENT_TAB;---child table we can delete but can't delete the parent table becuse of 
--integrity constraint (HR.COUNTRY_FK) violated - child record found

---we need to update the contraint on delete cascade in constrait of child table or delete those child
---table and create new one with on delete cascade

drop table country_tab;
drop table state_tab;

create table country_tab(
    country_id number primary key,
    country_name varchar2(100),
    cont_id number,
    CONSTRAINT country_fk FOREIGN key(cont_id) references continent_tab(con_id) on delete cascade
);

create table state_tab(
    state_id varchar2(100) primary key,
    state_name varchar2(100),
    country_id number,
    constraint state_fk foreign key(country_id) references country_tab(country_id) on delete cascade
);

delete from continent_tab;---now we can delete parent table without deleting child table

truncate table continent_tab;---it will throw an error even if we define on delete cascade in child table
truncate table continent_tab cascade; --it won't throw an error but we must define constraints with on 
--delete cascade

select * from continent_tab;
select * from country_tab;
select * from state_tab;

-- The basic diff bw delete and truncate cascade is that delete will delete the only entries which has 
--parent child relation satisfy but truncate cacade will also delete whose foreign key value is defined
-- as null

insert into State_tab values('S101','France',null);
insert into State_tab values('S014','Italy',null);
commit;

delete from continent_tab;---it won't delete any record with null value in foreign key column
select * from continent_tab;
select * from country_tab;
select * from state_tab;---it will show the record with null value in forein key
truncate table continent_tab cascade; --it will delete all records
















