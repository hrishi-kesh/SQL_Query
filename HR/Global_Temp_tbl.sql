---Beenum Learning---
---How to create Global and Private Temporary table in Oracle Database | Oracle Live SQL | Oracle SQL

--Global Temporary Tables (GTT)
-- Global temporary tables are permanent database objects that store session-specific data. The table definition is shared among all sessions, but the data is private to the session that inserts it.

-- Characteristics of GTT:
-- The table structure is permanent, but data is temporary.
-- Data is automatically deleted at the end of a transaction or session, depending on the table's creation options.
-- Data can be accessed only by the session that inserted it.

CREATE GLOBAL TEMPORARY TABLE gtt_example (
    id NUMBER,
    description VARCHAR2(50)
) ON COMMIT DELETE ROWS;---The ON COMMIT DELETE ROWS clause specifies that data will be deleted at the end of each transaction. Alternatively, you can use ON COMMIT PRESERVE ROWS to retain the data until the end of the session.

-- Insert data into the GTT
INSERT INTO gtt_example (id, description) VALUES (1, 'Temporary Data 1');
INSERT INTO gtt_example (id, description) VALUES (2, 'Temporary Data 2');

-- Query data from the GTT
SELECT * FROM gtt_example;
COMMIT;-- At the end of the transaction, data will be deleted if ON COMMIT DELETE ROWS was used.

--Session A inserts data:
INSERT INTO gtt_example (id, description) VALUES (1, 'Session A Data 1');
INSERT INTO gtt_example (id, description) VALUES (2, 'Session A Data 2');

-- Query data in Session A
SELECT * FROM gtt_example;
-- Output will be:
-- 1  | Session A Data 1
-- 2  | Session A Data 2
--Session B inserts data:
INSERT INTO gtt_example (id, description) VALUES (3, 'Session B Data 1');
INSERT INTO gtt_example (id, description) VALUES (4, 'Session B Data 2');

-- Query data in Session B
SELECT * FROM gtt_example;
-- Output will be:
-- 3  | Session B Data 1
-- 4  | Session B Data 2
-- Isolation of Data:

-- When Session A queries the GTT, it only sees the rows it has inserted (id 1 and 2).
-- When Session B queries the GTT, it only sees the rows it has inserted (id 3 and 4).
-- Neither session can see the data inserted by the other session.

--Private Temporary Tables (PTT)
-- Private temporary tables are session-specific tables that exist only for the duration of the session. They are defined in memory and are not visible to other sessions.

CREATE PRIVATE TEMPORARY TABLE ORA$PTT_example (
    id NUMBER,
    description VARCHAR2(50)
);

-- Characteristics of PTT:
-- The table is visible only within the session that created it.
-- The table and its data are automatically dropped at the end of the session.
-- PTTs are defined using the CREATE PRIVATE TEMPORARY TABLE statement.

-- Insert data into the PTT
INSERT INTO ORA$PTT_example (id, description) VALUES (1, 'Private Temp Data 1');
INSERT INTO ORA$PTT_example (id, description) VALUES (2, 'Private Temp Data 2');

-- Query data from the PTT
SELECT * FROM ORA$PTT_example;-- The table and its data will be dropped at the end of the session

-- Storage:
-- GTT: Data is stored in temporary tablespaces.
-- PTT: Data is stored in memory, providing faster access.

select e.TABLE_NAME,e.TABLESPACE_NAME,e.CLUSTER_NAME,e.TEMPORARY,PARTITIONED,clustering,TABLE_LOCK from user_tables e where e.TABLE_NAME='GTT_EXAMPLE';--here for PTT db won't store table str














