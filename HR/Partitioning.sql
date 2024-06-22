---Here we use HR schema for Table partioning
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

*/