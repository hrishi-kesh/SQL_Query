---Siva Academy oracle interview ques diff bw procedure and function----
--1.Proc & Func:- Proc can return multiple values but function can return only one value
--2.Proc & Func:- Proc can't called inside sql statement but func can be called inside sql statement
--3.Proc & Func:- Proc and Func both can contain DML statements but function can't called inside sql 
--statement until it is autonomous transaction 
--4.Proc & Func:- Proc can have return keyword in body it is use for exit out or proc and func if we don't
--return value inside body it will compile but while executing insise select statement it will through
--an error
select * from EMPLOYEES;
create table Employees_SA as select * from employees;
select * from EMPLOYEES_SA;

---create function that return avg salary of particular department

create or replace function func_Avg_Sal_Deptno(
    in_deptno number
) return NUMBER as 
v_avg_sal number;
begin
select avg(e.salary) into v_avg_sal from Employees_SA e where e.department_id=in_deptno;
return v_avg_sal;--if we remove this return keyword code can compile but in select statement while 
--calling throwing an error
end func_Avg_Sal_Deptno;
/

select func_Avg_Sal_Deptno(50) from dual;

