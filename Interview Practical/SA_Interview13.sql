---Siva Academy in HR schema ques 13. can we create DML and DDL inside the function---
---Ans:- yes we can create DDL using dynamic sql command like execute immediate and we write DML with
--the help of pragma autonomous_transaction

create or replace function test_fn1 return NUMBER
as
PRAGMA autonomous_transaction;---it can compile without this statement but can't call in select statement
begin
 update Employees_SA
    set salary=salary;
    commit;
    return 1;
end;
/

select test_fn1 from dual;--if we won't use pragma autonomous_transaction it will throw an error that
--stating the inside function we can't call DML

create or replace function test_fn2 return NUMBER
as
PRAGMA autonomous_transaction;---it can compile without this statement but can't call in select statement
begin
execute immediate 'create table Test(id number)';
execute immediate 'drop table Test';
    return 1;
end;
/

select test_fn2 from dual;--It shows an error of insufficient privileges 

create or replace function test_fn3 return NUMBER
as
begin
 update Employees_SA
    set salary=salary;
    commit;
    return 1;
end;
/

DECLARE
iv_var NUMBER;
BEGIN
    iv_var:=test_fn3;---this is we called as expression we can use without pragma autonomous transaction
end;

