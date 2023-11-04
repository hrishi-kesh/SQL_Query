declare
 type inBlock_vry is varray(5)of number;
 vry_obj inBlock_vry:=inBlock_vry(null,null,null,null,null);
begin
 for i in 1 .. vry_obj.limit
 loop
 vry_obj(i) := 10*i;
 dbms_output.put_line(vry_obj(i));
 end loop;
 end;
/
---simple by using extend method
declare
 type inBlock_vry is varray(5)of number;
 vry_obj inBlock_vry:=inBlock_vry();
begin
 vry_obj.extend(5);
 for i in 1 .. vry_obj.limit
 loop
 vry_obj(i) := 10*i;
 dbms_output.put_line(vry_obj(i));
 end loop;
 end;
/
---using extend inside loop to dynamically taking value
declare
 type inBlock_vry is varray(5)of number;
 vry_obj inBlock_vry:=inBlock_vry();
begin
 for i in 1 .. vry_obj.limit
 loop
  vry_obj.extend;
 vry_obj(i) := 10*i;
 dbms_output.put_line(vry_obj(i));
 end loop;
 end;
/
