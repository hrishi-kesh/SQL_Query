create tablespace LeetcodeTB datafile
'C:\ORACLE19C\ORADATA\ORCL\ORCLPDB\LeetcodeDF.dbf' size 100 m;---created by login sys as sysdba
----watch it_expert tutorial 30---
select tablespace_name from user_tablespaces;
select Tablespace_name,File_name,bytes/1024/1024 Data_File_size from dba_data_files;
alter session set "_ORACLE_SCRIPT"=true;---this script let you create user
create user Leetcode identified
by pass---pass can be anything
default tablespace LeetcodeTB
temporary tablespace temp
quota unlimited on LeetcodeTB;
create role LeetcodeDemo;
grant connect to Leetcode;
grant all PRIVILEGES to Leetcode;
grant LeetcodeDemo to Leetcode;
CREATE table Emp_Details(id number,name varchar2(20));
INSERT into Emp_details values(1,'abc1');
INSERT into Emp_details values(2,'abc2');
INSERT into Emp_details values(3,'abc3');
commit;
--grant create table,create session to Demo;
--grant Demo to Hrishi;
alter tablespace Test add datafile 'C:\ORACLE19C\ORADATA\ORCL\ORCLPDB\Test2.dbf' size 25 m;
