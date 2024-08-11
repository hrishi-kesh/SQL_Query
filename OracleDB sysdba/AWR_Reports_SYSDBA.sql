------------------DBA GENESIS youtube channel----------------------------
---------How to Read Oracle AWR Report | Oracle Automatic Workload Repository--------
----AWR Report:- It is useful to check performance of the database-----Automated Workload Repository----
/*
1. In SQL developer  -->view-->DBA-->connect SYSDBA-->Performance-->AWR-->AWR Report Viewer
2. In SQL PLUS     ---in vs code terminal goto ->cd C:\WINDOWS.X64_193000_db_home\bin then -->sqlplus / as sysdba --> @$ORACLE_HOME/rdbms/admin/awrrpt.sql 
3. it will ask for report format:- html/text by default it will take html
4. specify the no. of days of snapshots to choose from:- 3(whatever u <=7)
5. Enter value to begin snap:- snap id and enter value to end snap:- snap id
6. It will generate reports at same location if we want to change name we can do it

1. AWR reports is having retension period of 7 days.
2. It is generated at every 1 hour interval if someone ask for particular interval then also we can generate
3. let suppose db is down at particular interval so for that time it will throw an error
4. If we generate only one report between internal it only shows basic and if we generate multiple then it will show in detail

Analysing of AWR Report
Load Profile
1. DB time:-the total time foreground sessions spend in a database call, whether they're actively working or waiting

2. Parse(SQL):- It is useful in oltp system
3. Physical read(blocks): It is high in reporting related DB
4. Physical write(blocks): It is high in data warehousing
5. Transactions: more means more no. of DML

Instance Efficiency Percentages(Target 100%)
If all shows 90% above means no issues except Parse CPU to Parse Elapsed % which should be less

Shared Pool Statistics
It should be fin between 60-80%
Buffers:- Anything inside memory
Sectors:- Anything inside hard disk


1. Top 10 Foreground Events by Total wait time
--We concentrate on Total Wait Time not on waits
--db file scattered read:- While doing full table scan  
2. Wait classes by Total Wait Time

Main Reports
1. SQL statatics
   sql order by CPU time
   --let support you insert 10000 record using loop and commit transaction every time it will log switch
   --due to these many log switches CPU utilization time will increase
   --use commit at end of all transaction or after certain no. of records
*/

