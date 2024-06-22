--------Packages in PL/SQL | Oracle PL/SQL Tutorial Videos | Mr.Vijay Kumar by Naresh i Technology----

---Apart from procedure and function inside packages specification what else we can write.
--Constants Types Cursors Variables Exceptions Subtypes Pragma directives 
--Pragma directives: Pragma directives provide instructions to the compiler about the behavior of the package or its elements.
create table emp_NIT as select empno,ename,job,sal,deptno from emp;
select * from EMP_NIT;
create or replace package HR
as
procedure hire(e in number,n in varchar2,j in varchar2,s in number,d in number);
procedure fire(e in number);
end;
/

create or replace package body HR
as
procedure hire(e in number,n in varchar2,j in varchar2,s in number,d in number)
is
BEGIN
    insert into emp_NIT(empno,ename,job,sal,deptno) values(e,n,j,s,d);
    commit;
end hire;
procedure fire(e in number)
is
BEGIN
    delete from emp_NIT where empno=e;
end fire;
end;
/

execute hr.HIRE(555,'AAA','CLERK',5000,20);
select * from EMP_NIT;
execute hr.FIRE(555);

-----Overloading in Packages in PL/SQL | Oracle PL/SQL Tutorial Videos | Mr.Vijay Kumar by Naresh i technologies----
--In package overloading two or more procedure or function with same name but different number of parametrs or different datatypes in parameter

create or replace package MyPack
as
function addNum(a in number,b in number)
return number;
function addNum(a in number,b in number,c in number)
return number;
end;
/

create or replace package body MyPack
as
function addNum(a in number,b in number)
return number
is
begin
     return a+b;
end addNum;
function addNum(a in number,b in number,c in number)
return number
is
begin
     return a+b+c;
end addNum;
end;
/



select MYPACK.ADDNUM(2,3) from dual;---calling function through sql select statement 

DECLARE
a number;
BEGIN
    a:=MyPack.addNum(3,5);
    dbms_output.PUT_LINE(a);---calling function through expression or plsql block
END;
/

create or replace package MyPack1
as
function addNum(a in number,b in number)
return varchar2;
function addNum(a in number,b in varchar2)
return varchar2;
end;
/

create or replace package body MyPack1
as
function addNum(a in number,b in number)
return varchar2
is
begin
     return a+b;
end addNum;
function addNum(a in number,b in varchar2)
return varchar2
is
begin
     return a||b;
end addNum;
end;
/

select MYPACK1.ADDNUM(2,4) from dual;
select MYPACK1.ADDNUM(2,'abc') from dual;
