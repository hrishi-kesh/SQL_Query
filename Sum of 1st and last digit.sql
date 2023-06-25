declare
 n integer:=&m;
 First_digit integer:=0;
 last_digit integer:=0;
 s integer;
begin
 if(n>9) then
 s:=substr(n,1,1)+substr(n,length(n),1);
 else
 s:=n;
 end if;
 dbms_output.put_line(s);
end;