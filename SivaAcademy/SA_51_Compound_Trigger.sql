--This section of SivaAcademy covered in this SivaAcademy Schema
--Syntax of compound Trigger
--It is nothing but combination of DML row and statement level trigger

Create or replace Trigger <Trigger_name>
for insert or update or delete
on <table name> Compound Trigger
---Global variable declaration
before statement is
---variable declaration
BEGIN
    ---before statement section
end before statement;

before each row is
---variable declaration
BEGIN
    --before each row section
end before each row;

after each row is
---variable declaration
BEGIN
    --after each row section
end after each row;

after statement is
---variable declaration
BEGIN
    ---before statement section
end after statement;

end Emp_Comp_Trigger;
/

select * from Emp_Details;

create or replace Trigger Emp_Comp_Trigger FOR 
insert or update or delete on Emp_Details Compound Trigger

g_var varchar2(50):='Demo of compound trigger';

before statement is
l_var varchar2(50):=' before statement ';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_var||g_var);
end before statement;

before each row is
l_var varchar2(50):=' before each row ';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_var||g_var);
end before each row;

after each row is
l_var varchar2(50):=' after each row ';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_var||g_var);
end after each row;

after statement is
l_var varchar2(50):=' after statement ';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_var||g_var);
end after statement;

end Emp_Comp_Trigger;

select * from Emp_Details;
insert into Emp_Details values(13,'abc13');
commit;






