--------------Siva Academy PLSQL interview Question answer----------------------
---What is mutating trigger--
--Ans:-Mutating error(Ora 04091) occurs when row level trigger tries to modify or select the data 
--from table which is already undergoing change


---case 1 when creating row level trigger and we user hard coded value of max salary (No mutating Error)
--Emp, Dept, Emp_sal_log table created
create table Emp_sal_log(empno number, update_log varchar2(1000));

create or replace Trigger Trigg_Validata_Sal 
before
update of sal on emp 
for each row
declare
lv_Max_Sal number:=3000;
begin
if :new.sal < lv_Max_Sal  then
    insert into EMP_SAL_LOG values(:new.empno,'Salary Updated Successfully: '||'old sal='||:old.sal||', new sal='||:new.sal);
else
    :new.sal:=:old.sal;
    insert into EMP_SAL_LOG values(:new.empno,'Salary not Updated: Employee salary cannot more than : '||lv_Max_sal);
end if;
end;
/

select * from emp;---7839 7788 7902
update emp set sal=3500 where empno=7566;
commit;
select * from Emp_Sal_Log;
--case 2 when maximum is not hard coded instead President salary then we get mutating error

create or replace Trigger Trigg_Validata_Sal 
before
update of sal on emp 
for each row
declare
lv_Pres_Sal number;
begin
select sal into lv_Pres_sal from emp where job='President';
if (:new.sal < lv_Pres_Sal and :old.job <>'President') or (:old.job ='President') then
    insert into EMP_SAL_LOG values(:new.empno,'Salary Updated Successfully: '||'old sal='||:old.sal||', new sal='||:new.sal);
else
    :new.sal:=:old.sal;
    insert into EMP_SAL_LOG values(:new.empno,'Salary not Updated: Employee salary cannot more than : '||lv_Pres_sal);
end if;
end;
/
--error msg SQL Error: ORA-04091: table SIVAACADEMY.EMP is mutating, trigger/function may not see it
--mutating trigger occur in row level trigger only
select * from emp;---7839 7788 7902
update emp set sal=5200 where empno=7566;
commit;

--case 3.1 we are fixing this by creating a packaged variable or by creating a compound trigger 

create or replace package pkg1
AS
lv_Pres_Sal number;
end;
---create package without body

create or replace Trigger Trigg_before_Up_Sal 
before
update of sal on emp
begin
select sal into pkg1.lv_Pres_sal from emp where job='PRESIDENT';---initialising pkg variable in statement level trigger
end;
/


create or replace Trigger Trigg_Validata_Sal 
before
update of sal on emp 
for each row
begin
if (:new.sal < pkg1.lv_Pres_Sal and :old.job <>'PRESIDENT') or (:old.job ='PRESIDENT') then
    insert into EMP_SAL_LOG values(:new.empno,'Salary Updated Successfully: '||'old sal='||:old.sal||', new sal='||:new.sal);
else
    :new.sal:=:old.sal;
    insert into EMP_SAL_LOG values(:new.empno,'Salary not Updated: Employee salary cannot more than : '||pkg1.lv_Pres_sal);
end if;
end;
/

select * from emp;---7839 7788 7902
update emp set sal=5500 where empno=7566;
commit;
select * from EMP_SAL_LOG;

--case 3.2 we can fix this mutating trigger by creating a compound trigger 

CREATE OR REPLACE TRIGGER Comp_Trigg_log_changes
for UPDATE ON emp
COMPOUND TRIGGER
lv_Pres_Sal NUMBER;
BEFORE STATEMENT 
IS
BEGIN
    SELECT sal INTO lv_Pres_Sal FROM emp WHERE job = 'PRESIDENT';
END BEFORE statement;
before each row is
begin
if (:new.sal < lv_Pres_Sal and :old.job <>'PRESIDENT') or (:old.job ='PRESIDENT') then
    insert into EMP_SAL_LOG values(:new.empno,'Salary Updated Successfully: '||'old sal='||:old.sal||', new sal='||:new.sal);
else
    :new.sal:=:old.sal;
    insert into EMP_SAL_LOG values(:new.empno,'Salary not Updated: Employee salary cannot more than : '||pkg1.lv_Pres_sal);
end if;
end before each row;
end Comp_Trigg_log_changes;
/

select * from emp;---7839 7788 7902
update emp set sal=5000 where empno=7839;
commit;
select * from EMP_SAL_LOG;





