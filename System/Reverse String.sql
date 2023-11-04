declare
 s varchar2(10):='&m';
 rev_str varchar2(10);
 len number;
begin
 len:=length(s);
 for i in reverse 1 .. len
 loop
 rev_str:=rev_str||substr(s,i,1);
 end loop;
 dbms_output.put_line(rev_str);
end;