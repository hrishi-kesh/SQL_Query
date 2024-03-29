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
