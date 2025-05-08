create or replace type object_type as object(
obj_id number,
obj_name varchar2(10)
);
/
create or replace type my_nt is table of object_type;
/

create table base_table
(
tab_id number,
tab_ele my_nt
) nested table tab_ele store as base_tab1;

