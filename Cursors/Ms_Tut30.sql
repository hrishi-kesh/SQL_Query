--Explicit cursor using for loop for same prog in Ms_tut27
declare
 cursor c_Ms_Tut30 is select e.first_name, e.last_name from employees e
 where e.employee_id<104;
begin
  dbms_output.put_line('The Name of the employees whose employee_id < 104 are:- ');
 for i in c_Ms_Tut30 loop
 dbms_output.put_line(i.first_name
 ||' '||i.last_name);
 end loop;
end;
/
