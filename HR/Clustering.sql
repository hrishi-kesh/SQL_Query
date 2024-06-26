---Beenum Learning youtube "How to create a Table Cluster, Cluster Key in Oracle Database | Oracle Live SQL"

----A table cluster is a group of tables that share common columns and store related data in the same blocks.

-- When tables are clustered, a single data block can contain rows from multiple tables. For example, a block can store rows from both the employees and departments tables rather than from only a single table.

CREATE CLUSTER employees_departments_cluster
   (department_id NUMBER(4))
SIZE 512;

CREATE INDEX idx_emp_dept_cluster 
   ON CLUSTER employees_departments_cluster;

CREATE TABLE employees_c (department_id NUMBER(4))
   CLUSTER employees_departments_cluster (department_id);
 
CREATE TABLE departments_c (department_id NUMBER(4))
   CLUSTER employees_departments_cluster (department_id);

select * from user_tables;

drop index idx_emp_dept_cluster;

DROP CLUSTER employees_departments_cluster INCLUDING TABLES;



