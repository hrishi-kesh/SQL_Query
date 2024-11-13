--------Vishal Jaiswal youtube channel -Crack Database Technical Interviews----
--------Advance Database Concepts-----------Performance Tuning----------

/*
begin
   for i in (select * from hr.employees)
  loop
    insert into Emp values (i.EMPLOYEE_ID,i.FIRST_NAME,i.LAST_NAME	,i.EMAIL	,i.PHONE_NUMBER	,i.HIRE_DATE	,i.JOB_ID,i.SALARY	,i.COMMISSION_PCT	,i.MANAGER_ID	,i.DEPARTMENT_ID);
    dbms_output.put_line('Row_number'||sql%rowcount);
end loop;
end;
--In this sql statement called those many times as resulted rows
--practise prog in live sql
*/
--Bulk collect and forall
create table t3 as select * from emp where 1=2;

declare
    type t_emp_data is table of emp%rowtype;
     t_emp_data_aa t_emp_data;
begin
    select * bulk collect into t_emp_data_aa from emp;
    forall x in t_emp_data_aa.first .. t_emp_data_aa.last
       insert into t3 values t_emp_data_aa(x); 
    dbms_output.put_line('Row_number '||sql%rowcount);
end;
--o/p Row_number14  all 14 rows processed in one shot
-- context switching bet plsql engine and sql engine is reduced to 2
--In same example if we are using simple for loop then it run 14 times

declare
    type t_emp_data is table of emp%rowtype;
     t_emp_data_aa t_emp_data;
begin
    select * bulk collect into t_emp_data_aa from emp;
    for i in 1 .. t_emp_data_aa.count loop
       insert into t3 values t_emp_data_aa(i);
       dbms_output.put_line('Row_number '||sql%rowcount);
       end loop;
end;

select * from t3;

/*
--In varry we can delete last or all elements using trim() or delete() respectively 
--But in nested table we can delete any element at postion using delete(n)
three exception in collection
--referance to uninitialized collection
--subscript beyond count
--subscript outside of limit

if no data found error comes it means someone has deleted any record from nested table

collections methods:- count,first,last,trim(),delete(),exist(),prior,next
exist():- it will return boolean

--associated array:-pl/sql table or index by table

In nested table and varry it is mandatory to initalise the collection in declare section

If not initializing then we need to initialize through bulk collect

DECLARE
    TYPE emp_table IS TABLE OF employees%ROWTYPE;
    employees emp_table;
BEGIN
    -- No need to initialize 'employees', BULK COLLECT will automatically initialize and populate it
    SELECT * BULK COLLECT INTO employees FROM employees WHERE department_id = 10;
    
    DBMS_OUTPUT.PUT_LINE('First employee: ' || employees(1).first_name);
END;

--varray doesn't support bulk collect

*/



