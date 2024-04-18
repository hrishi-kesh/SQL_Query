create table Emp_Details
(Name varchar2(30) primary key,
Job varchar2(10) Not null,
Sal Number(20) Not null,
Dept_No Number(10) Not null);

select * from EMP_DETAILS;
---How to load data from text or csv file to database table using SQL Loader

1.create any text file or csv file with data
2. create control file using this script
options(skip=1)
LOAD DATA
INFILE 'Sample_Data.csv'
DISCARDFILE 'Sample_Data_Discarded.txt'
TRUNCATE INTO TABLE Emp_Details
when DEPT_NO="10"
FIELDS TERMINATED BY ','
(NAME,
JOB,
SAL,
DEPT_NO)

Control_File.ctl;

---save this file as .ctl file
3. run the script in cmd in pluggable database schema HR or CO it will not run in any system or sys schema
F:\PLSQL\HR\SQL Loader>sqlldr hr/"pass"@orclpdb Control_File.ctl

4. control_file.log containing information data processed FAILED
5. Sample_Data_Discarded file contains row which don't satisfy the condition
6. emp_details.bad file contails failed record data and reason why those rows got failed will update in log file
