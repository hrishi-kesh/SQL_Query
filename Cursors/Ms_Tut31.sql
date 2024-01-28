--Explicit cursor using for loop for Parameterized cursor
declare
 cursor c_Ms_Tut31(P_Employee_id number) is select e.first_name, e.last_name, e.employee_id from employees e
 where e.employee_id<P_Employee_Id;
begin
  dbms_output.put_line('The Name of the employees whose employee_id < 104 are:- ');
 for i in c_Ms_Tut31(:employee_id)
 loop
 dbms_output.put_line(i.first_name
 ||' '||i.last_name||' '||i.employee_id);
 end loop;
end;
/