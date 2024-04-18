declare
a number(20):=2;
begin
for b in 1 .. 10 loop
dbms_output.put_line('Table of a:' ||a*b);
end loop;
end;


