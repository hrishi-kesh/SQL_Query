--------Vishal Jaiswal youtube channel -Crack Database Technical Interviews----
--------Whatsapp group -Lets Nail It- SQL/PLSQL----

---B26 Interview2---
/*
1. Can we sort the data without using order by clause
Yes, we can by using index organized table

2. Diff bw char and varchar2 datatype
char-It is a fixed length datatype if we insert less characters then its size then it is automatically padding with
spaces
Varchar2- It is a variable length datatype where if we insert less characters then it size it will release the
empty spaces

3. What is negative scale in datatype
A- number(5,-2)  5-Precision -2 is scale
Data will insert max 5 but last two digit will be converted 00 or nearest 100
i.e 1349 ---1300  1350 ---1400
number(5,2)
-Two char will be after decimal(Before and after decimal characters sum has to be 5)
i.e 134.456 ---134.46  134.434 ---134.43

4. modify coulumn size
--ALTER TABLE employees 
MODIFY (employee_name VARCHAR2(100));
5. convert data type
--In alter table we can't convert the data type of column
--SELECT CAST(hire_date AS VARCHAR2(20)) AS hire_date_string 
FROM employees;--it will conver varchar2(20) to date format
SELECT TO_CHAR(hire_date, 'YYYY-MM-DD') AS hire_date_string 
FROM employees;--this will convert date to string
6. add or drop column
--ALTER TABLE employees 
ADD (email VARCHAR2(150));

--ALTER TABLE employees 
DROP COLUMN email;
--In any any organization we are not directly droping the column if it contains the data it may takes time so for that one we 
need to se unused the column then we drop
--ALTER TABLE employees 
SET UNUSED (email);--mark that column unused 
--ALTER TABLE employees 
DROP UNUSED COLUMNS;

7. invisible column
ALTER TABLE employees 
ADD (salary NUMBER(8,2) INVISIBLE);-- Invisible column will show in table str but while using select * it won't show
--If we already know that column name then we can give in select statement then it will show.
8. Any ddl after the dml will auto commit the code

9. How to add any column at specific position in table
--mark that particular place column and onwards column as as invisible by using modify in alter command and then mark as visible
10. Virtual column
-- new colum value auto populated based on prev records.
create table person (id_1 number, id_2 mumber, id_3 mumber,
all_id generated always as (id_1+id_2+id_3) virtual )
insert into person (id_1, id_2, id_3) values (1,2,3)
--We can't insert any value to virtual column

11. Delete will not reset the high water mark value to 0 truncate will do it.
High Water mark is the last block till where the data is retain
If we deleted the data the select statement will search the data till where the data was retained earlier 

12. Delete 5 m data from 10m
--Delete will take lots of time because it insert first in redo log buffer
--truncate we can't use.
--by creating temp table then truncate the table
13. If there is duplicate data already there in particular column then how it provent for any new duplicate entry.
--i want to prevent further duplication , how to achieve it.
alter table xyz add constraint pk_vishal primary key (id) deferrable novalidate;

*/

--------------------Tables in Oracle-----------------
--If we create any table from another table by using select the structure copied like datatypes but not
--contraints or any index created on that table except not null contraints
create table emp1 as select * from employees where 1=2;
desc emp1;
/*
--Heap Organized table:- A Heap Organized Table is the default type of table in Oracle. In this type, rows are stored in no particular order. Data is inserted where there is space, and no specific sorting of rows is maintained unless an index is applied separately.
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100),
    hire_date DATE
);

Index organized table:- An Index Organized Table stores rows in a sorted order based on the primary key, making retrieval of rows by primary key faster because data is stored in an index structure. Unlike heap tables, the data is sorted and stored directly within the index.

CREATE TABLE employees_iot (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100),
    hire_date DATE
) ORGANIZATION INDEX;

--Data is stored sorted by primary key in the index.
--Fast retrieval when querying by the primary key.
--Slower performance for large insertions or updates.

-- To generate .csv file from sqlplus
SQL> SET COLSEP ','
SQL> SET PAGESIZE 0
SQL> SET LINESIZE 200
SQL> SET FEEDBACK OFF
SQL> SET TRIMSPOOL ON
SQL> SPOOL employees_data.csv
SQL>
SQL> SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id, manager_id
   FROM (SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id, manager_id
   FROM employees
  WHERE ROWNUM <= 100);
  SPOOL OFF;

External Table:- An External Table allows you to access data stored outside the database, typically in flat files (e.g., CSV). The data is not stored in the database but is instead accessed when needed through SQL queries.

CREATE TABLE employees_ext (
    employee_id NUMBER,
    employee_name VARCHAR2(100),
    hire_date DATE
)
ORGANIZATION EXTERNAL
(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS
    (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ','
        (employee_id, employee_name, hire_date)
    )
    LOCATION ('employees.csv')
);

--Data remains in external files; it is not loaded into the database.
--Queries are executed directly against the file.
--Uses the ORACLE_LOADER or ORACLE_DATAPUMP access drivers to read the data.
--Suitable for reading external data without permanently storing it in Oracle.
--Can be used in ETL processes where loading the data may not be required.

Key difference between Oracle SQL Loader and External Table is that
--SQL*Loader is used when you want to load data from external files into Oracle tables.
--External Tables are used when you want to query external files directly without loading them into Oracle.

Temporary table:-A Temporary Table is used to store intermediate results that are required only for the duration of a session or transaction. Data in a temporary table is private to the session and is automatically dropped when the session ends.

CREATE GLOBAL TEMPORARY TABLE temp_employees (
    employee_id NUMBER,
    employee_name VARCHAR2(100),
    hire_date DATE
) ON COMMIT DELETE ROWS;---some case on commit preserve rows is there

private temporary table is also there

*/

--External table example with employees.csv available in sivaacademy directory
-- Step 1: Create the directory object
CREATE OR REPLACE DIRECTORY ext_dir AS 'D:\PLSQL\SivaAcademy';

-- Step 2: Grant permissions to the user
--GRANT READ, WRITE ON DIRECTORY ext_dir TO SivaAcademy;--you may not GRANT/REVOKE privileges to/from yourself

CREATE TABLE employees_ext (
    emp_id NUMBER,            -- Define as NUMBER to store numeric values
    first_name VARCHAR2(255),
     job_id VARCHAR2(255)            -- Change to DATE if the format is valid
)
ORGANIZATION EXTERNAL
(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS
    (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        (
            emp_id,
            first_name,
             job_id           
        )
    )
    LOCATION ('employees_data1.csv')
);
select * from employees_ext;


