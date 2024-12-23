--All prog are solved in TechTFQ schema using oracle
-- Query 1:
/*
Change extension using linux or wsl command
wsl -d Ubuntu-22.04   ---to goto wsl linuz

#!/bin/bash
exclude="Tech_TFQ_Complex_Queries.pdf"
newext=".sql"

for file in *; do
    if [[ "$file" != "$exclude" && -f "$file" ]]; then
        mv "$file" "${file%.*}.$newext"
    fi
done
*/

--Write a SQL query to fetch all the duplicate records from a table.

--Tables Structure:

--drop table users;
create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

INSERT ALL
    INTO users (user_id, user_name, email) VALUES (1, 'Sumit', 'sumit@gmail.com')
    INTO users (user_id, user_name, email) VALUES (2, 'Reshma', 'reshma@gmail.com')
    INTO users (user_id, user_name, email) VALUES (3, 'Farhana', 'farhana@gmail.com')
    INTO users (user_id, user_name, email) VALUES (4, 'Robin', 'robin@gmail.com')
    INTO users (user_id, user_name, email) VALUES (5, 'Robin', 'robin@gmail.com')
SELECT * FROM dual;
commit;


select * from users;

---My Solution
--way 1
with cte
as
(select user_id, user_name, email,ROW_NUMBER() over(partition by user_name order by user_id desc) rn from users where user_name in (select user_name from users group by user_name having count(user_name)>1))
select * from cte where rn<>1;

--way 2
select * from users where rowid not in (select max(rowid) from users group by user_name);

-- Solution 1:

-- Replace ctid with rowid for Oracle, MySQL and Microsoft SQLServer
select *
from users u
where u.ctid not in (
select min(ctid) as ctid
from users
group by user_name
order by ctid);


-- Solution 2: Using window function.

select user_id, user_name, email
from (
select *,
row_number() over (partition by user_name order by user_id) as rn
from users u
order by user_id) x
where x.rn <> 1;
