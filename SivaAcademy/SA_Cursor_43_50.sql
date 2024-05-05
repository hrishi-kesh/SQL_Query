---------------Sivaacademy 43 to 50 PLSQL interview questions ----------------------------
select * from V$OPEN_CURSOR;--it will run in system user
select * from V$PARAMETER where name like '%open_cursors%';--it will run in system user
select * from emp;

--local variable--
DECLARE
lv_ename varchar2(100);
BEGIN
    select e.ename into lv_ename from emp e where e.EMPNO=7839;---if we remove where condition all emp detail won't fetch
    DBMS_OUTPUT.PUT_LINE('Employee names are:- '||lv_ename);
end;
/

--using nested table collection---

DECLARE
type lv_ename_list_type is table of varchar2(100);
lv_ename_list lv_ename_list_type:=lv_ename_list_type();
BEGIN
    select ename bulk collect into lv_ename_list from emp;
    for i in lv_ename_list.first .. lv_ename_list.last LOOP
    DBMS_OUTPUT.PUT_LINE('The employees names are:- '||lv_ename_list(i));
    END LOOP;
end;
/

--using cursor for loop
DECLARE
CURSOR c_name IS 
SELECT ENAME FROM emp;
BEGIN
FOR i IN c_name LOOP
DBMS_OUTPUT.PUT_LINE('The names of the employees are: ' || i.ENAME);
END LOOP;
IF c_name%ISOPEN THEN
CLOSE c_name;
END IF;
END;
/

---using cursor open fetch into

DECLARE
CURSOR c_name IS 
SELECT ENAME FROM emp;
lv_ename emp.ENAME%TYPE;
BEGIN
    open c_name;
    loop
    fetch c_name into lv_ename;
    DBMS_OUTPUT.PUT_LINE('The names of the employees are: ' || lv_ename);
    exit when c_name%notfound;
    END LOOP;
IF c_name%ISOPEN THEN
CLOSE c_name;
END IF;
END;
/

---using cursor in local procedure
declare
procedure abc
is
cursor c_name IS SELECT ENAME FROM emp;
begin
FOR i IN c_name LOOP
DBMS_OUTPUT.PUT_LINE('The names of the employees are: ' || i.ENAME);
END LOOP;
IF c_name%ISOPEN THEN
CLOSE c_name;
END IF;
end abc;
begin
abc;
end;
/
---using cursor  return multiple column using rowtype

DECLARE
    CURSOR c_employee IS 
        SELECT * FROM emp;
    lv_emp_row emp%ROWTYPE;
BEGIN
    OPEN c_employee;
    LOOP
        FETCH c_employee INTO lv_emp_row;
        EXIT WHEN c_employee%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Employee details: ' || lv_emp_row.empno || ', ' || lv_emp_row.ename || ', ' || lv_emp_row.job);
    END LOOP;

    IF c_employee%ISOPEN THEN
        CLOSE c_employee;
    END IF;
END;
/
---Attributes use we can use in merge statement------
--merger syntax
/*merge into target t using
source s on (s.id=t.id)
wh,t.nameen MATCHED
THEN
    update set s.name=t.name;
when not MATCHED
insert (s.id,s.name) values(t.id,t.name)
when not MATCHED with source
delete;
*/

---parameterized cursor---
DECLARE
    CURSOR pc_name(p_deptno emp.deptno%type) IS
        SELECT ename FROM emp WHERE deptno = p_deptno;
    lv_ename emp.ename%TYPE; -- Variable to hold employee name
BEGIN
    OPEN pc_name(:p);
    LOOP
        FETCH pc_name INTO lv_ename;
        EXIT WHEN pc_name%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('The names of deptno ' || lv_ename);
    END LOOP;
    CLOSE pc_name;
END;
/

---REF CURSOR this cursor basically we are using for when we are taking data from two different table
--we can't use for loop in ref cursor because it will throw an error 'RC_EMP_LIST_CUR' is not a procedure or is undefined
DECLARE
type ref_cur_type is REF CURSOR;
rc_emp_list_cur ref_cur_type;
v_name VARCHAR2(100);
v_id number;
BEGIN
    open rc_emp_list_cur for select ename from emp;
    DBMS_OUTPUT.PUT_LINE('There employees list are:- ');
    loop
    fetch rc_emp_list_cur into v_name;
    exit when rc_emp_list_cur%notfound; 
    DBMS_OUTPUT.PUT_LINE(v_name);
    end loop;
    close rc_emp_list_cur;
    open rc_emp_list_cur for select deptno,dname from DEPT;
    loop
    fetch rc_emp_list_cur into v_id,v_name;
    exit when rc_emp_list_cur%notfound; 
    DBMS_OUTPUT.PUT_LINE('There employee is in deptid:- ' || v_id||' having department '||v_name);
    end loop;
    close rc_emp_list_cur;
end;
/

---REF Cursor strongly typed means having explicitly return type

DECLARE
type ref_cur_type is REF CURSOR return emp%rowtype;--if we write dept 2nd part of query will work
rc_emp_list_cur ref_cur_type;
v_emp_row emp%rowtype;
v_dept_row dept%rowtype;
BEGIN
    
    open rc_emp_list_cur for select * from emp;
    DBMS_OUTPUT.PUT_LINE('There employees list are:- ');
    loop
    fetch rc_emp_list_cur into v_emp_row;
    exit when rc_emp_list_cur%notfound; 
    DBMS_OUTPUT.PUT_LINE(v_emp_row.ename);
    end loop;
    close rc_emp_list_cur;
    /*
    open rc_emp_list_cur for select * from DEPT;
    loop
    fetch rc_emp_list_cur into v_dept_row;
    exit when rc_emp_list_cur%notfound; 
    DBMS_OUTPUT.PUT_LINE('There employee is in deptid:- ' || v_dept_row.deptno||' having department '||v_dept_row.dname);
    end loop;
    close rc_emp_list_cur;
    ---this will throw an error because this one is strongly typed ref cursor
    */
end;
/

--'type ref_cur_type is REF CURSOR'  this whole line is define as 'sys_refcursor' by oracle
--we can call it as weekly typed cursor (sys_refcursor)

--use case of sys_refcursor in return statement of the function for returning multiple outputs
create or replace function fnc_Emp_Details(p_deptno number)
return sys_refcursor is
lc_emp_list SYS_REFCURSOR;
BEGIN
    open lc_emp_list for select ename from emp where DEPTNO=p_deptno;
    return lc_emp_list;
end;
/

DECLARE
lv_ref_cursor SYS_REFCURSOR;
v_name varchar2(100);
BEGIN
    lv_ref_cursor:=fnc_Emp_Details(10);
    loop
    fetch lv_ref_cursor into v_name;
    exit when lv_ref_cursor%notfound;
    DBMS_OUTPUT.PUT_LINE('The employee names are:- '||v_name);
    end loop;
    close lv_ref_cursor;
end;
/
















    


