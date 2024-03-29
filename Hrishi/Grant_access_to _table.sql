create table Emp_Details
(Name varchar2(30) primary key,
Job varchar2(10) Not null,
Sal Number(20) Not null,
Dept_No Number(10) Not null);

grant ALL on Emp_Details to Hrishi;

insert into Emp_Details values('KING','MANAGER',1000,10);
insert into Emp_Details values('SCOTT','SALES',3000,20);
insert into Emp_Details values('JAMES','ACCOUNT',4000,10);
insert into Emp_Details values('SMITH','SALES',2500,30);
commit;
SELECT * FROM emp_details;

select tablespace_name from user_tablespaces;




