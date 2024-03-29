create tablespace Test datafile
'C:\ORACLE19C\ORADATA\ORCL\Test1.dbf' size 50 m;
----watch it_expert tutorial 30---
select tablespace_name from user_tablespaces;
select Tablespace_name,File_name,bytes/1024/1024 Data_File_size from dba_data_files;
alter session set "_ORACLE_SCRIPT"=true;---this script let you create user
create user Hrishi identified
by pass
default tablespace Test
temporary tablespace temp
quota unlimited on Test;
create role Demo;
grant create table,create session to Demo;
grant Demo to Hrishi;
alter tablespace Test add datafile 'C:\ORACLE19C\ORADATA\ORCL\Test2.dbf' size 25 m;'
