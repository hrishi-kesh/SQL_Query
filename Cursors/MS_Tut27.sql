--Explicit cursor using open fetch
declare
 v_fname varchar2(30);
 v_lname varchar2(30);
 cursor c_Ms_Tut27 is select e.first_name, e.last_name from employees e
 where e.employee_id<104;
 
begin
 open c_Ms_Tut27;
  dbms_output.put_line('The Name of the employees whose employee_id < 104 are:- ');
 loop
 fetch c_Ms_Tut27 into v_fname,v_lname;
 dbms_output.put_line(v_fname
 ||' '||v_lname);
 exit when c_Ms_Tut27%notfound;
 end loop;
 close c_Ms_Tut27;
end;
/

