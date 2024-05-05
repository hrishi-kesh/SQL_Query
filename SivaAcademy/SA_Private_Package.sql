---Subscriber Comments Reply Video 5  by Siva Academy 
---Private procedure in Package---Private 
---ctrl+shift+L to make changes in all instances of highlighted word
---private procedure only be called inside the same package outside not accessible
---private procedure only created inside package body

---Standalone procedure:-it is creating using create or replace keyword and can be saved in DB
---packaged procedure:- which is declare and define inside package
---local procedure:- proc which is defined under declare section see example at the end of this script

create or replace PACKAGE test_pkg1
As
procedure p1_proc;
procedure p2_proc;
end;
/

create or replace PACKAGE body test_pkg1
as
procedure priv_proc
is
begin
  dbms_output.PUT_LINE('Printing from priv_proc');
end priv_proc;
procedure p1_proc
is
begin
  dbms_output.PUT_LINE('Printing from p1_proc');
  priv_proc;
end p1_proc;
procedure p2_proc
is
begin
  dbms_output.PUT_LINE('Printing from p2_proc');
  priv_proc;
end p2_proc;
end;
/

execute test_pkg1.p1_proc;

---local procedure:- proc which is defined under declare section of anonymous block or inside the declaration section of standalone procedure see example at the end of this script
--we can call n no. of times local procedure

DECLARE
 procedure my_proc1 as
 begin
    DBMS_OUTPUT.PUT_LINE('Printing from my_proc1');
 end my_proc1;
BEGIN
  my_proc1;
end;

create or replace procedure proc1
As
PROCEDURE print(pin in VARCHAR2)
is
BEGIN
    DBMS_OUTPUT.PUT_LINE(pin);
end;
BEGIN
  print('hello');
  print('welcome to the procedure world');
end;
/

EXECUTE proc1;
