declare
 num number:=&m;
 reverse_num number:=0;
begin 
 while(num>0)
 loop
 reverse_num:=(reverse_num*10)+mod(num,10);
 num:=trunc(num/10);
 end loop;
 dbms_output.put_line(reverse_num);
end;