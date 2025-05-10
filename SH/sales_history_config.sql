----Configure SH sales_hitory schema------

login in system/pass@orclpd

to check container name 
SHOW CON_NAME;--If orclpdb not showing then run below script

ALTER SESSION SET CONTAINER = orclpdb;

then run sh_install.sql. it is in installed directory of oracle in demo/schema/sales_hitory

if it creates table and populate data then no need to do anything if it is not populating the data then.

login in SH user then 
run sh_populate.sql

If still there are some csv file data which is not populate in table because oracle design the query to run in live sql not for sqlplus. 

Then we need to import csv data through sql developer tool if it showing any error then check the error it might be contraint error then we need to disable those constraints and then we need to populate the data. Then we need to re-enable the constraints with novalidate. 