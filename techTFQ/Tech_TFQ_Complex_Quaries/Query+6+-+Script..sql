-- Query 6:

--From the students table, write a SQL query to interchange the adjacent student names.

--Note: If there are no adjacent student then the student name should stay the same.

--Table Structure:

--drop table students;
create table students
(
id int primary key,
student_name varchar(50) not null
);

insert all
 into students values(1, 'James')
 into students values(2, 'Michael')
 into students values(3, 'George')
 into students values(4, 'Stewart')
into students values(5, 'Robin')
select * from dual;
commit;

select * from students;

--Solution:

select id,student_name,
case when id%2 <> 0 then lead(student_name,1,student_name) over(order by id)
when id%2 = 0 then lag(student_name) over(order by id) end as new_student_name
from students;
