declare
 n integer:=&m;
 f integer:=1;
begin
 while(n>0)
 loop
 f:=f*n;
 n:=n-1;
 end loop;
 dbms_output.put_line(f);
end;