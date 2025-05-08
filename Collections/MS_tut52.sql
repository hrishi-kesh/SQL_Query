create or replace type my_nested_table is table of varchar2(10);

create table my_tut52(
sub_id number,
sub_name varchar2(20),
sub_schedule_day my_nested_table)
nested table sub_schedule_day store as sub_schedule_day_tab;

insert into my_tut52 values(1,'ram',my_nested_table('mon','wed','fri'));
insert into my_tut52 values(2,'shyam',my_nested_table('tue','thu'));

commit;

SELECT * FROM my_tut52;