-------------------Configuration of sample schema (HR)through sqlplus---------------------------------------

c:\users\Hrishikesh>sqlplus \ as sysdba
connected
sql>alter session set container=orclpdb;
Session altered.
SQL> column name format a15
SQL> select name,open_mode from v$pdbs;

NAME            OPEN_MODE
--------------- ----------
ORCLPDB         MOUNTED

SQL> alter pluggable database orclpdb save state;

Pluggable database altered.

SQL> @C:\Oracle19c\WINDOWS.X64_193000_db_home\demo\schema\human_resources\hr_main.sql [pass for HR user] [default TABLESPACE for HR user (users)] 
[temp tablespace(temp)] [pass for system user] 
[path of logs can be any path (C:\Oracle19c\WINDOWS.X64_193000_db_home\demo\schema\] [connect string(localhost:1521/orclpdb)]

-------------------------------------------------------------------------------------------
----------------------How to connect with HR schema---------------------------------
SQL>select banner form v$version;
oracle version it will show
sql>column name format a15
sql>select name, con_id from v$pdbs;
NAME
--------------------------------------------------------------------------------
    CON_ID:- container id
----------
PDB$SEED
         2
ORCLPDB
         3
sql>cl scr ---clear the screen
sql>select name as "service_name" from v$active_services where con_id=3;
service_name
----------------------------------------------------------------
orclpdb


---network configuration-----------
1.search netca
2.select local net service name configuration 
3.select ADD
4.service name which "orclpdb"
5.select protocol "TNS"
6.hostname "localhost" port_number "1521"
7.Yes, to test  ---put system user and pass
8.name of service "orclpdb"
9.would u like select another service  ---select "No"
10.configuration completed

open sqlplus 
c:\users\Hrishikesh>SQLPLUS hr/[Hr schema pass]@orclpdb [pluggable db service name]
sql>show user;
HR
sql>connect [another schema]/[pass]@orclpdb; ---to switch from one schema to another schema



-------------------Configuration of sample schema (CO) through sqlplus----------------------------------------------

1. SQL> alter pluggable database orclpdb save state;
2. sql>select name, con_id from v$pdbs;
3. sql>alter session set "_ORACLE_SCRIPT"=true; 
4. sql>@C:\WINDOWS.X64_193000_db_home\demo\schema\customer_orders\co_install.sql pass users temp pass C:\WINDOWS.X64_193000_db_home\demo\schema\ connect string(localhost:1521/orclpdb)
5. similary run for co_create then co_populate.sql

---------------------Reset password of any schema under pluggable database-------------------
