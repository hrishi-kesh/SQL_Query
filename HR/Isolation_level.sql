---Edredo for Learners     from youtube channel "Isolation Levels in Database Management Systems"

-- In Oracle Database, isolation levels are a key part of the database's concurrency control mechanism, defining the degree to which the operations of one transaction are isolated from those of other transactions. They determine how data is read and modified, helping to ensure data consistency and integrity in a multi-user environment. 



-- 1. Read Committed
-- Characteristics:

-- This is the default isolation level in Oracle.
-- It ensures that any data read during a transaction is committed at the time it is read. It uses shared locks to block other transactions from modifying the data being read but does not prevent other transactions from reading the same data.
-- This level allows for non-repeatable reads (i.e., if a transaction reads the same row twice, it may see different data each time if another transaction modifies and commits the data between the reads).
-- Use Cases:

-- Suitable for most OLTP (Online Transaction Processing) applications where the balance between data consistency and concurrency is necessary.
-- 2. Serializable
-- Characteristics:

-- Ensures complete isolation from other transactions. A transaction operating at this level will see a consistent snapshot of the data as it existed at the start of the transaction.
-- Prevents other transactions from inserting, updating, or deleting rows that would affect rows read by the current transaction. It uses range locks to achieve this isolation.
-- This level avoids phenomena like dirty reads, non-repeatable reads, and phantom reads (i.e., rows that appear or disappear from a result set of a query because another transaction inserted or deleted them).
-- Use Cases:

-- Suitable for scenarios requiring high data integrity and consistency, such as financial applications.
-- 3. Read Only
-- Characteristics:

-- A special mode that ensures a transaction can only read data but cannot modify it.
-- The transaction sees a consistent snapshot of the data as it existed at the start of the transaction, similar to the Serializable level.
-- Use Cases:

-- Useful for reporting or analytic queries that need to run without interfering with other transactions.
-- 4. Read Consistency in Oracle
-- Oracle also provides a read consistency model, which ensures that:

-- Each user sees consistent data as of the point in time at which a query or transaction begins.
-- Any changes made by a transaction are not visible to other transactions until the transaction is committed.
-- Even within the default Read Committed isolation level, Oracle uses mechanisms like undo data to maintain read consistency.
-- Phenomena Prevented by Isolation Levels
-- Different isolation levels prevent different types of anomalies in concurrent transaction environments:

-- Dirty Reads: Reading uncommitted changes made by another transaction.

-- Prevented by Read Committed and Serializable levels.
-- Non-repeatable Reads: Reading a row, and then reading it again later, only to find that the data has been changed by another committed transaction.

-- Prevented by the Serializable level.
-- Phantom Reads: A query yields different results if it is executed multiple times within the same transaction, because rows were added or removed by other transactions.

-- Prevented by the Serializable level.
-- Implementing Isolation Levels in Oracle
-- In Oracle, you can set the isolation level for a session or a transaction using SQL commands. For example:

-- To set the isolation level to Serializable for a session:

-- ALTER SESSION SET ISOLATION_LEVEL SERIALIZABLE;

-- To set the isolation level to Read Committed for a specific transaction:

-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- To set the transaction to Read Only:

-- SET TRANSACTION READ ONLY;