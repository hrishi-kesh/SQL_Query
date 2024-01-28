--To load csv file data in postgres table
create table Emp_Details (Email character varying(150),Emp_id int, Pass character varying(150),First_name character varying(150),Last_name character varying(150),Department character varying(150),Location_name character varying(150));

alter table tab2 add column name varchar(30);

SELECT * FROM Emp_Details;

copy Emp_Details from 'F:\PLSQL\Postgres\Data Load\Emp_Det.csv' Delimiter ',' csv Header;

