--Press Ctrl+Shift+P (or Cmd+Shift+P on Mac) to open the Command Palette.

/*
Type Preferences: Configure User Snippets and select it.
Choose sql.json (or create a new global snippet file if it doesn't exist).

whenever you type sf in a SQL file in VSCode and press Tab, it will expand to SELECT * FROM with the cursor positioned to enter the table name.

in sql.json file
"Select All": {
        "prefix": "sf",
        "body": [
            "SELECT * FROM $1;"
        ],
        "description": "Shortcut for SELECT * FROM"
*/

---Here we use HR schema for Table partioning from BEENUM LEARNING youtube chanel
/*
Partition strategy are of two types one is horizontal partioning and another one is vertical Partitioning
1. Horizontal Partitioning
Horizontal partitioning involves dividing a table into multiple tables where each table contains the same number of columns, but fewer rows. Essentially, it splits the rows of a table into smaller tables, each containing a subset of the rows.
      Types of Horizontal Partitioning
1.1 Range Partitioning: Divides rows based on a range of values in a particular column.
1.2 List Partitioning: Divides rows based on a predefined list of values.
1.3 Hash Partitioning: Divides rows using a hash function on one or more columns.
1.4 Composite Partitioning: Combines two or more horizontal partitioning methods.

2. Vetical Partitioning
Vertical partitioning involves dividing a table into multiple tables where each table contains a subset of the columns. Each row in the original table is split across these smaller tables based on the columns they hold.
Types of Vertical Partitioning
2.1 Normalization: A form of vertical partitioning where the table is decomposed to eliminate redundancy and dependency by creating separate tables for logically related attributes.
2.1 Columnar Storage: In columnar databases, tables are vertically partitioned where each column is stored separately, which can be highly efficient for certain types of queries, particularly analytical ones.
*/

select * from sales;

--1.1 Range Partitioning
/*
In range partitioning, the database maps rows to partitions based on ranges of values of the partitioning key. Range partitioning is the most common type of partitioning and is often used with dates.

Suppose that you create time_range_sales as a partitioned table using the following SQL statement, with the time_id column as the partition key:
*/
CREATE TABLE time_range_sales
   ( prod_id        NUMBER(6)
   , cust_id        NUMBER
   , time_id        DATE  ---This one is called partition key it can be one or more column
   , channel_id     CHAR(1)
   , promo_id       NUMBER(6)
   , quantity_sold  NUMBER(3)
   , amount_sold    NUMBER(10,2)
   )
PARTITION BY RANGE (time_id)
 (PARTITION SALES_1998 VALUES LESS THAN (TO_DATE('01-JAN-1999','DD-MON-YYYY')),
  PARTITION SALES_1999 VALUES LESS THAN (TO_DATE('01-JAN-2000','DD-MON-YYYY')),
  PARTITION SALES_2000 VALUES LESS THAN (TO_DATE('01-JAN-2001','DD-MON-YYYY')),
  PARTITION SALES_2001 VALUES LESS THAN (MAXVALUE)
 ); 


select * from time_range_sales;

select table_name,iot_name,iot_type,external,partitioned,temporary,cluster_name from user_tables;

select * from sales;
delete from sales;
-- Backup the original sales table (optional)
CREATE TABLE sales_backup AS SELECT * FROM sales;

-- Update the time_id column to use 4-digit years

INSERT INTO time_range_sales (prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold)
SELECT prod_id, cust_id, TO_DATE(TO_CHAR(time_id, 'DD-MON-YYYY'), 'DD-MON-YYYY'), channel_id, promo_id, quantity_sold, amount_sold
FROM sales;

commit;

SELECT *
FROM time_range_sales
WHERE time_id = TO_DATE('05-JUN-1999', 'DD-MON-YYYY');--it takes less time than direct fetching from sales

select * from time_range_sales partition (SALES_1999)
where time_id = TO_DATE('05-JUN-1999', 'DD-MON-YYYY');---

--1.2 List partitioning

--In list partitioning, the database uses a list of discrete values as the partition key for each partition. The partitioning key consists of one or more columns.

CREATE TABLE list_sales
   ( prod_id        NUMBER(6)
   , cust_id        NUMBER
   , time_id        DATE
   , channel_id     CHAR(1)    ---This one is called partition key
   , promo_id       NUMBER(6)
   , quantity_sold  NUMBER(3)
   , amount_sold    NUMBER(10,2)
   )
PARTITION BY LIST (channel_id)
 ( PARTITION even_channels VALUES ('2','4'),
   PARTITION odd_channels VALUES ('3','9')
 ); 

INSERT INTO list_sales (prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold)
SELECT prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold
FROM sales;
commit;

select * from list_sales partition (even_channels) where list_sales.CHANNEL_ID=4;
select * from list_sales where list_sales.CHANNEL_ID=4;
select * from sales where sales.CHANNEL_ID=4;

--1.3 Hash Partitioning

--In hash partitioning, the database maps rows to partitions based on a hashing algorithm that the database applies to the user-specified partitioning key.
--The destination of a row is determined by the internal hash function applied to the row by the database. When the number of partitions is a power of 2, the hashing algorithm creates a roughly even distribution of rows across all partitions.

--Hash partitioning is useful for dividing large tables to increase manageability. Instead of one large table to manage, you have several smaller pieces. The loss of a single hash partition does not affect the remaining partitions and can be recovered independently. Hash partitioning is also useful in OLTP systems with high update contention. For example, a segment is divided into several pieces, each of which is updated, instead of a single segment that experiences contention.

--Assume that you create the partitioned hash_sales table using the following statement, with the prod_id column as the partition key:

CREATE TABLE hash_sales
   ( prod_id        NUMBER(6)
   , cust_id        NUMBER
   , time_id        DATE
   , channel_id     CHAR(1)
   , promo_id       NUMBER(6)
   , quantity_sold  NUMBER(3)
   , amount_sold    NUMBER(10,2)
   )
PARTITION BY HASH (prod_id)
PARTITIONS 2; 

INSERT INTO hash_sales (prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold)
SELECT prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold
FROM sales;
commit;

select * from hash_sales;
SELECT PARTITION_NAME, HIGH_VALUE, NUM_ROWS
FROM USER_TAB_PARTITIONS
WHERE TABLE_NAME = 'HASH_SALES';































