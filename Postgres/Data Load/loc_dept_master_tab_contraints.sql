----loc_details and dept_details master tables created with copying data from csv file
----apply primary key constraint and foreign key constraint
create table dept_details (dept_id numeric(20), department varchar(30));
create table loc_details (dept_id numeric(20) primary key, department varchar(30));
alter table dept_details add primary key(dept_id);
alter table emp_details add constraint fk_dept_id foreign key(dept_id) references dept_details(dept_id);
alter table emp_details add constraint fk_loc_id foreign key(loc_id) references loc_details(loc_id);
select * from emp_details;

copy dept_details from 'F:\PLSQL\Postgres\Data Load\Dept.csv' Delimiter ',' csv;
copy loc_details from 'F:\PLSQL\Postgres\Data Load\Loc.csv' Delimiter ',' csv;
update emp_details set dept_id=
case 
when dept_id='Sales' then '1'
when dept_id='Depot' then '2'
else 3
end,
loc_id=
case 
when loc_id='Manchester' then '1'
when loc_id='London' then '2'
end
where 1=1;

update emp_details set loc_id=1 where loc_id=3;
commit;

alter table emp_details rename column department to dept_id;
alter table loc_details rename column dept_id to loc_id;
alter table emp_details alter column loc_id type numeric(20,0) USING dept_id::numeric(20,0);


select * from emp_details;
select * from dept_details;
select * from loc_details;