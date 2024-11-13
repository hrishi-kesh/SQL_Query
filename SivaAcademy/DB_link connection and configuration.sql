---------Steps to link Oracle DB to Postgres using DB link-----
1. check for this file which is already in oracle 19c "dg4odbc" which is nothing but oracle odbc gateway
2. goto start check for ODBC Data Source Administrator select 64 bit and run as admin
3. Now add DNS source name PostgreSQL35W(showing already there) then database name (check in postrges) then
  server name which is localhost(to verify check in services.msc search postressql if running means on localhost)
  run in cmd:- netstat -an | findstr 5432
  If you see an entry like 127.0.0.1:5432 in the results, PostgreSQL is running on localhost.
  If you see an entry like 0.0.0.0:5432  in the results, PostgreSQL is running on all IP on any network.
  
4. Port is 5432 and username is postres 
5. Now test and on if successful

-----------------------------------------------------
1. Navigate to the $ORACLE_HOME\hs\admin\ directory (typically located in C:\WINDOWS.X64_193000_db_home\hs\admin\).
Locate and edit the initdg4odbc.ora file to configure the connection to your external database. Set the following parameter in the file:
plaintext
Copy code
HS_FDS_CONNECT_INFO = your_dsn_name (PostgreSQL35W)
Replace your_dsn_name with the name of the DSN you created in the ODBC Data Source Administrator.

--set PATH=C:\Program Files\PostgreSQL\16\lib;%PATH%  instead of this use environment variable and set path in system
set ODBCINI=C:\Windows\ODBC.INI
set PGPASSWORD=securecode ---dont use this set 
--instead use Under System Variables, click New.
--Enter PGPASSWORD as the Variable name and (your password) as the Variable value.

---------------------------------------------------------------in listener.ora file------
1. Update the Listener Configuration
Go to your listener.ora file (typically in $ORACLE_HOME\network\admin\).
Add an entry for the DG4ODBC service, like this:
plaintext
Copy code
(SID_DESC =
    (SID_NAME = dg4odbc)
    (ORACLE_HOME = C:\WINDOWS.X64_193000_db_home)
    (PROGRAM = dg4odbc)
)
2. using cmd admin
lsnrctl stop
lsnrctl start

------------------------------make entry in tnsname.ora file-------------------------
dg4odbc =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
    (CONNECT_DATA = (SID = dg4odbc))
    (HS = OK)
  )

--------------------------------------------------------------
1. Create a Database Link in Oracle
Open your SQL*Plus or Oracle SQL Developer and create a database link to access the ODBC data source:


CREATE PUBLIC DATABASE LINK your_db_link_name(should be name for remote db link)---postgres_db_link ---PUBLIC to access by all schema
CONNECT TO your_user IDENTIFIED BY your_password
USING 'dg4odbc';
Replace your_db_link_name, your_user, and your_password with your connection details.
or

CREATE PUBLIC DATABASE LINK postgres_db_link CONNECT TO postgres IDENTIFIED BY securecode USING 'dg4odbc';

CREATE PUBLIC DATABASE LINK postgres_db_link CONNECT TO postgres IDENTIFIED BY "" USING 'PostgreSQL35W';
drop PUBLIC DATABASE LINK postgres_db_link 
--created in sys schema

5. Test the Connection
Run a query using the database link to confirm the setup:
 SELECT * FROM your_table_name@your_db_link_name;
 SELECT * FROM EMP@POSTGRES_db_link;
to check your db_link name
SELECT * FROM DBA_DB_LINKS WHERE DB_LINK = 'POSTGRES_DB_LINK';

replaced with md5 for scram-sha-256 
in this file "pg_hba.conf"  directory:- C:\Program Files\PostgreSQL\16\data
--vice versa

configure in netca

postgres version
postgresql-x64-16

net stop postgresql-x64-16
net start postgresql-x64-16


lsnrctl stop
lsnrctl start



	