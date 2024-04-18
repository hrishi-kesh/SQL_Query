create tablespace SivaTB datafile
'C:\ORACLE19C\ORADATA\ORCL\ORCLPDB\SivaDF.dbf' size 100 m;---created by login sys as sysdba
----watch it_expert tutorial 30---
select tablespace_name from user_tablespaces;
select Tablespace_name,File_name,bytes/1024/1024 Data_File_size from dba_data_files;
alter session set "_ORACLE_SCRIPT"=true;---this script let you create user
create user SivaAcademy identified
by pass---pass can be anything
default tablespace SivaTB
temporary tablespace temp
quota unlimited on SivaTB;
create role SivaDemo;
grant connect to SivaAcademy;
grant all PRIVILEGES to SivaAcademy;
grant SivaDemo to SivaAcademy;
--grant create table,create session to Demo;
--grant Demo to Hrishi;
alter tablespace Test add datafile 'C:\ORACLE19C\ORADATA\ORCL\ORCLPDB\Test2.dbf' size 25 m;
