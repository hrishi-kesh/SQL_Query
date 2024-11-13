--Manish Sharma youtube tutorial "Native Dynamic SQL in Oracle Databa"
--Syntax
/*
EXECUTE IMMEDIATE dynamic_query
[INTO user_defined_variable-1,
user_defined_variable-2 ... ]
[USING bind_argument-1, bind_argument-2 ...
[RETURNING| RETURN-INTO clause];
*/

DECLARE
sql_qry VARCHAR2(150);
emp_tot NUMBER(3);
BEGIN
sql_qry := 'SELECT count (*) FROM emp';
EXECUTE IMMEDIATE sql_qry INTO emp_tot;--or EXECUTE IMMEDIATE 'SELECT count (*) FROM emp' INTO emp_tot;
DBMS_OUTPUT.PUT_LINE ('Total employees are: '||emp_tot) ;
END;
/

DECLARE
sql_smt VARCHAR2 (150);
BEGIN
sql_smt := 'INSERT INTO emp (empno,ename) VALUES (:empno,:ename)';--here we are using bind variable to
--insert values with using clause

--sql_smt := 'INSERT INTO emp (empno,ename) VALUES (''269'',''stee'')'; --direct insert    
EXECUTE IMMEDIATE sql_smt; --USING '267','Steve'
END;
/

select * from emp;
--execute immediate with bulk collect
DECLARE
TYPE nt_ename IS TABLE OF VARCHAR2 (60);
ename nt_Ename;
sql_qry VARCHAR2(150);
BEGIN
sql_qry := 'SELECT ename FROM emp';
EXECUTE IMMEDIATE sql_qry BULK COLLECT INTO ename;
FOR idx IN 1 .. ename. COUNT
LOOP
DBMS_OUTPUT.PUT_LINE (idx||'-'||ename(idx));
END LOOP;
END;
/

--Dynamic sql using plsql block in execute immediate
DECLARE
plsql_blk varchar2(250);
BEGIN
     plsql_blk:= 'DECLARE
                  var_user VARCHAR2(20);
                  BEGIN
                  SELECT user INTO var_user FROM dual;
                  DBMS_OUTPUT.PUT_LINE (''Current User is ''||var_user) ;
                  END;';
EXECUTE IMMEDIATE plsql_blk;
END;
/

--Sridhar Raghavan "Oracle execute immediate dynamic sql update returning into with and without using bind argument Part"

declare
tab VARCHAR2 (10) := 'emp';
ename varchar2(30);
job varchar2(30);
sql_stmt varchar2(100);
begin
sql_stmt := 'update '||tab||' set sal =: 1 where empno =: 2 returning ename, job into :3,:4';
dbms_output.put_line(sql_stmt);
execute immediate sql_stmt using 900,7369 returning into ename,job;
dbms_output.put_line ('Salary updated for '||ename||job);
end;
/

select * from emp;

--Sridhar Raghavan "Oracle execute immediate dynamic sql procedure in and out parameters Part 7"
--plsqlblock in dynamic sql (both in and out parameters)

create or replace procedure raise_salary
(pempid in integer, psal in INTEGER, ename out VARCHAR2, job out VARCHAR2) is
sql_stmt varchar2(100);
begin
sql_stmt := 'update emp set sal =: 1 where empno =: 2
returning ename, job into :3,:4';
execute immediate sql_stmt using psal, pempid returning into ename, job;
dbms_output.put_line ('Salary is updated to ' ||psal||' for employee_id '|| pempid||' and name and job is '||ename ||job);
end;

declare
plsqlblock varchar2(500);
ename varchar2(30);
job VARCHAR2(30);
begin
plsqlblock := 'begin raise_salary (:empno, :sal, :ename,:job); end;';
execute immediate plsqlblock using in 7369,950,out ename, out job;  ---here we are explicitly using in and out
DBMS_output. PUT_LINE ('Salary updated for '||ename||job);
end;
/
--- Sridhar Raghavan "Oracle dynamic sql select while opening ref cursor sys ref cursor Part 8"
declare
type emprefcurtyp is ref cursor;
c1 emprefcurtyp;
-- c1 sys_refcursor;
emp_rec emp%rowtype;
sql_stmt varchar2(200);
job varchar2(10) := 'MANAGER';
begin
sql_stmt := 'select * from emp where job='''||job||'''';
-- sql_stmt := 'select * from employees where job_id =: 1';
dbms_output.put_line(sql_stmt);
open c1 for sql_stmt;
-- open c1 for sql_stmt using job_id;
loop
fetch c1 into emp_rec;
exit when c1%notfound;
dbms_output.put_line (emp_rec.ename||' '||emp_rec.job||' '||emp_rec.sal);
end loop;
close c1;
end;
/

--- Sridhar Raghavan "Oracle execute immediate dynamic sql passing null value to bind argument Part 9"
declare
a_null char(1);
begin
execute immediate 'update emp set comm =: x where empno =: y'
using a_null,7839;---if no_value(a_null) assigned to a_null then null value will update
end;
/













