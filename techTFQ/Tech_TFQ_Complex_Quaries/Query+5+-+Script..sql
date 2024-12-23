-- Query 5: Imp Question

--From the login_details table, fetch the users who logged in consecutively 3 or more times.

--Table Structure:

--drop table login_details;
create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

delete from login_details;
insert all
 into login_details values(101, 'James', current_date)
 into login_details values(102, 'James', current_date)
 into login_details values(103, 'Stewart', current_date+1)
 into login_details values(104, 'Stewart', current_date+1)
 into login_details values(105, 'Stewart', current_date+1)
 into login_details values(106, 'Michael', current_date+2)
 into login_details values(107, 'Michael', current_date+2)
 into login_details values(108, 'Stewart', current_date+3)
 into login_details values(109, 'Stewart', current_date+3)
 into login_details values(110, 'James', current_date+4)
 into login_details values(111, 'James', current_date+4)
 into login_details values(112, 'James', current_date+5)
 into login_details values(113, 'James', current_date+6)
select * from dual;
commit;

select * from login_details;

--Firstly look into the sub queries then ext query

--Solution:

select distinct repeated_names
from (
select e.*,
case when e.user_name = lead(e.user_name) over(order by e.login_id)
 and  e.user_name = lead(e.user_name,2) over(order by e.login_id)
 then e.user_name else null end as repeated_names
from login_details e) x
where x.repeated_names is not null;






