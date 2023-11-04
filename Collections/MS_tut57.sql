declare
 type books is table of number
 index by varchar2(20);
 isbn books;
 flag varchar2(20);
begin
 isbn('Oracle Database'):=1234;
 isbn('MySQL'):=9876;
 isbn('MySQL'):=1010;
 isbn('SQL Server'):=999;
 flag:=isbn.first;
 while flag is not null
 loop
 dbms_output.put_line('key-> '||flag||' value-> '||isbn(flag));
 flag:=isbn.next(flag);
 end loop;
 end;
/