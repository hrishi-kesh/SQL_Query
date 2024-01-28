---------------------Parameterized cursor using open fetch and bind variable-- single parameterized---------------------
declare
 v_fname varchar2(30);
 v_lname varchar2(30);
 cursor c_Ms_Tut28(P_Employee_Id number) is select e.first_name, e.last_name from
 employees e where e.employee_id<P_Employee_Id;
begin
 open c_Ms_Tut28(:employee_id);
 dbms_output.put_line('The Name of the employees whose employee_id < input number are:- ');
 loop
 fetch c_Ms_Tut28 into v_fname, v_lname;
 dbms_output.put_line(v_fname
 ||' '||v_lname);
 exit when c_Ms_Tut28%notfound;
 end loop;
 close c_Ms_Tut28;
end;
/
select * from --single parameter cursor
 employees ;
--------------------------Parameterized cursor using open fetch and bind variable-- multiple parameters
declare
 v_fname varchar2(30);
 v_lname varchar2(30);
 v_salary varchar2(20);
 v_department_id varchar2(20);
 cursor c_Ms_Tut28(P_Employee_Id number, P_Salary number, P_Department_Id number) is select e.first_name, e.last_name, e.salary, 
 e.department_id from 
 employees e where e.employee_id<P_Employee_Id and e.salary<P_Salary and Department_Id=P_Department_Id;
begin
 open c_Ms_Tut28(:employee_id, :salary, :department_id);
 dbms_output.put_line('The Name of the employees whose employee_id < input number and less than particular salary and 
 belongs to particular department are:- ');
 loop
 fetch c_Ms_Tut28 into v_fname, v_lname, v_salary, v_department_id;
 dbms_output.put_line(v_fname
 ||' '||v_lname||' '||v_salary||' '||v_department_id);
 exit when c_Ms_Tut28%notfound;
 end loop;
 close c_Ms_Tut28;
end;
/