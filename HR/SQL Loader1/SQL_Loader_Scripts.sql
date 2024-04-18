create table Movie_Directory
(Sr_No Number primary key,
Film_Name varchar2(100),
Film_Details clob,
image1 blob,
image2 blob,
image3 blob);

select * from MOVIE_DIRECTORY;

---How to load data from text or csv file to database table using SQL Loader

1.create any text file or csv file with data
2. create control file using this script
options(skip=1)
load data
infile 'Data_File.txt'
truncate into Table Movie_Directory
Fields terminated by ','
(Sr_No,
Film_Name,
Titanic_Info Filler char(100),
Film_Details lobfile(Titanic_Info) terminated by EOF,
Titanic_Poster Filler char(100),
Image1 lobfile(Titanic_Poster) terminated by EOF,
Actor Filler char(100),
Image2 lobfile(Actor) terminated by EOF,
Actress Filler char(100),
Image3 lobfile(Actress) terminated by EOF)

---we can use insert,append and replace in place of truncate
---truncate:-it will delete all records and then insert
---insert:- it will insert new data in empty table
---append:- it will add more rows in existing records table
---replace is same as truncate but it is not DDL
---save this file as .ctl file
3. run the script in cmd in pluggable database schema HR or CO it will not run in any system or sys schema
F:\PLSQL\HR\SQL Loader1>sqlldr hr/"pass"@orclpdb Control_File.txt

--- to run same command in vs code add extension oracle sql and plsql developer then open terminal
go to F:\PLSQL\HR\SQL Loader1
then sqlldr 'hr/"pass"@orclpdb Control_File.txt'
 
4. control_file.log containing information data processed FAILED
5. Sample_Data_Discarded file contains row which don't satisfy the condition
6. emp_details.bad file contails failed record data and reason why those rows got failed will update in log file
