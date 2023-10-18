declare
 type my_nested_table is table of number;
 v_tut my_nested_table:=my_nested_table(9,18,27,36,45,54,63,72,81,90);
begin
 for i in 1 .. v_tut.count loop
 dbms_output.put_line('the value at index'||(i)||'='||v_tut(i));
 end loop;
end;
/