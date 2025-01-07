--------------------------TechTFQ YT Channel --SQL Views Tutorial | VIEWS in SQL Complete Tutorial--------------------------
-- Create the tb_customer_data table
CREATE TABLE tb_customer_data (
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(50),
    phone NUMBER(10),
    email VARCHAR2(50),
    address VARCHAR2(250)
);

-- Insert data into the tb_customer_data table
INSERT INTO tb_customer_data (cust_id, cust_name, phone, email, address) VALUES (1, 'Mohan Kumar', 9900807090, 'mohan@demo.com', 'Bangalore');
INSERT INTO tb_customer_data (cust_id, cust_name, phone, email, address) VALUES (2, 'James Xavier', 8800905544, 'james@demo.com', 'Mumbai');
INSERT INTO tb_customer_data (cust_id, cust_name, phone, email, address) VALUES (3, 'Priyanka Verma', 9900223333, 'priyanka@demo.com', 'Chennai');
INSERT INTO tb_customer_data (cust_id, cust_name, phone, email, address) VALUES (4, 'Eshal Maryam', 9900822111, 'eshal@demo.com', 'Delhi');
commit;

-- Create the tb_product_info table
CREATE TABLE tb_product_info (
    prod_id VARCHAR2(10) PRIMARY KEY,
    prod_name VARCHAR2(50),
    brand VARCHAR2(50),
    price INTEGER
);

-- Insert data into the tb_product_info table
INSERT INTO tb_product_info (prod_id, prod_name, brand, price) VALUES ('P1', 'Samsung S22', 'Samsung', 800);
INSERT INTO tb_product_info (prod_id, prod_name, brand, price) VALUES ('P2', 'Google Pixel 6 Pro', 'Google', 900);
INSERT INTO tb_product_info (prod_id, prod_name, brand, price) VALUES ('P3', 'Sony Bravia TV', 'Sony', 600);
INSERT INTO tb_product_info (prod_id, prod_name, brand, price) VALUES ('P4', 'Dell XPS 17', 'Dell', 2000);
INSERT INTO tb_product_info (prod_id, prod_name, brand, price) VALUES ('P5', 'iPhone 13', 'Apple', 800);
INSERT INTO tb_product_info (prod_id, prod_name, brand, price) VALUES ('P6', 'Macbook Pro 16', 'Apple', 5000);
commit;

-- Create the tb_order_details table
CREATE TABLE tb_order_details (
    ord_id NUMBER PRIMARY KEY,
    quantity INTEGER,
    prod_id VARCHAR2(10),
    cust_id VARCHAR2(10),
    disc_percent INTEGER,
    order_date DATE
);

-- Insert data into the tb_order_details table
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (1, 1, 'P1', 'C1', 0, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (2, 2, 'P2', 'C2', 0, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (3, 10, 'P2', 'C3', 20, TO_DATE('2020-02-01', 'YYYY-MM-DD'));
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (4, 0, 'P3', 'C1', 0, TO_DATE('2020-02-01', 'YYYY-MM-DD'));
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (5, 3, 'P3', 'C1', 0, TO_DATE('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (6, 6, 'P3', 'C1', 25, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (7, 7, 'P3', 'C2', 0, TO_DATE('2020-05-01', 'YYYY-MM-DD'));
INSERT INTO tb_order_details (ord_id, quantity, prod_id, cust_id, disc_percent, order_date)
VALUES (8, 0, 'P5', 'C2', 0, TO_DATE('2020-02-01', 'YYYY-MM-DD'));
COMMIT;


-- What is the main purpose of using a view / advantages of views.
--1) Security
-- Views can restrict access to specific columns or rows, providing a layer of security.
-- They allow clients to access only the data they need without exposing the underlying table structure.
-- By granting access to views instead of tables, you can control which data clients can see and manipulate.

--2) To simplfiy complex sql queries.--- Views can simplify complex queries by encapsulating them into a single object. So that every time we don't need to write the same query again and again.
/*
create role james
login
password 'james';
grant select on order_summary to james;
*/

--3) Create or Replacle view
-- Note: When using CREATE OR REPLACE VIEW, particularly in replace you cannot change the existing the column name, data types or the order of columns in the view. Instead we can add new columns at the end of all columns where are already there in views.

-- Reset the password for the user and update the password policy
--ALTER USER TechTFQ IDENTIFIED BY <password>;
--ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

-- But we can rename the view by using alter view command.

--alter view order_summary rename column date to order_date;--In oracle we use alter view
--alter view order_summary rename to order_summary_2;--this option not feasible in oracle
--alter view order_summary_2 add column product_config varchar2(100);---In oracle we can use alter view

--4) We can drop the view by using drop view command.
--drop view order_summary_2;

--5) Updatable views i.e which views can be used to insert, update and delete the data from the view.
-- Note: In order to make a view updatable, the view must meet certain criteria:

-- Updatable views
--1) View should be created using a single table/view only.
create or replace view expensive_products
as
select * from tb_product_info where price > 1000;

select * from expensive_products;

update expensive_products
set prod_name = 'Airpods Pro', brand = 'Apple'
where prod_id = 'P6';
COMMIT;

create or replace view order_summary
as
select o.ord_id, o.order_date, p.prod_name, c.cust_name
, (p.price * o.quantity) - ((p.price * o.quantity) * disc_percent / 100) as cost
, c.cust_id
from tb_customer_data c
join tb_order_details o on o.cust_id = c.cust_id
join tb_product_info p on p.prod_id = o.prod_id;---Update will not work because view is created using multiple tables.

SELECT * from order_summary;


--2) View on that are updating should not contain distinct, group by, having, start with, connect by, set operators, subqueries, rownum, rowid, or pseudocolumns.

--3) If view contains with clause then we can't update the view.
--4) If view contains windows functions then we can't update the view.

-- With check option

CREATE VIEW apple_products AS
SELECT * FROM tb_product_info WHERE brand = 'Apple';

insert into apple_products
values ('P20', 'Note 20', 'Samsung', 2500);
commit;-- Since this view is created using only Apple products, we can't insert any other brand products into this view. But if we can insert other products brand as well. So to avoid this we can use check option.

select * from apple_products;

CREATE or replace VIEW apple_products AS
SELECT * FROM tb_product_info WHERE brand = 'Apple'
WITH CHECK OPTION;--This will not allow to insert any other brand products into this view, it is checking the where clause condition.

insert into apple_products
values ('P22', 'Note 22', 'Samsung', 2500);-- This will show "view with check option where clause violated" error *cause An INSERT or UPDATE statement was attempted on a view created with the CHECK OPTION. This would have resulted in the creation of a row that would not satisfy the view's WHERE clause.

--6) Materialized views
-- Materialized views are precomputed views that store the results of a query in a physical table.
-- They are useful for improving query performance by reducing the need to recompute the results of a query each time it is executed.
-- Materialized views can be refreshed on demand or on a schedule to keep the data up to date.

-- Create a new table for Retail data
CREATE TABLE Retail_Data (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(50),
    Category VARCHAR2(50),
    Price NUMBER,
    Quantity_Sold NUMBER,
    Sale_Date DATE
);


-- Create a materialized view on top of the Retail_Data table
-- Create a materialized view log on the Retail_Data table
CREATE MATERIALIZED VIEW LOG ON Retail_Data
WITH PRIMARY KEY, ROWID (Category, Price, Quantity_Sold)
INCLUDING NEW VALUES;-- Record both old and new values of the changed rows
-- Include the primary key and ROWID for tracking changes

CREATE MATERIALIZED VIEW MV_Retail_Sales
BUILD IMMEDIATE -- BUILD IMMEDIATE: The materialized view is populated immediately when the view is created.
REFRESH FAST ON DEMAND -- REFRESH FAST: Uses incremental changes to refresh the materialized view. ON DEMAND: Refreshes the view only when explicitly requested.
AS
SELECT 
    Category,
    SUM(Price * Quantity_Sold) AS Total_Sales,
    COUNT(*) AS Number_Of_Products
FROM 
    Retail_Data
GROUP BY 
    Category;

-- Other BUILD options:
-- BUILD DEFERRED: The materialized view is not populated at the time of creation. It will be populated later when it is refreshed.

-- Other REFRESH options:
-- REFRESH COMPLETE: Recomputes the entire materialized view.
-- REFRESH FORCE: Attempts a fast refresh. If a fast refresh is not possible, it performs a complete refresh.
-- ON COMMIT: Refreshes the materialized view whenever a transaction on the base tables is committed.
-- ON DEMAND: Refreshes the materialized view only when explicitly requested.

-- Query the materialized view
SELECT * FROM MV_Retail_Sales;

-- Refresh the materialized view
EXEC DBMS_MVIEW.REFRESH('MV_Retail_Sales', 'C');

-- Update the Retail_Data table
UPDATE Retail_Data SET Quantity_Sold = Quantity_Sold + 10 WHERE Product_ID = 1;

-- Refresh the materialized view again to reflect the changes
EXEC DBMS_MVIEW.REFRESH('MV_Retail_Sales', 'C');

-- Query the materialized view again to see the updated data
SELECT * FROM MV_Retail_Sales;



















