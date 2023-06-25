Script Name
Simple Explain Plan
Description
--This script explains the plan for a query of the sh.sales and sh.products tables. Both statements must be executed at the same time in order to get the proper plan.
Area
Performance and Tuning
Contributor
Oracle
Created
Monday October 05, 2015
Statement 1
--EXPLAIN PLAN for query of sales and products tables

EXPLAIN PLAN FOR  
SELECT prod_category, AVG(amount_sold)  
FROM   sales s, products p  
WHERE  p.prod_id = s.prod_id  
GROUP BY prod_category
Statement processed.
Statement 2
This query shows the execution plan that the optimizer will chose when certain conditions are true, for example, any bind variables are treated as VARCHARs, and the SQL statement is not already in the shared pool with a different plan.
Use DBMS_XPLAN to display the execution plan

SELECT plan_table_output  
FROM TABLE(DBMS_XPLAN.DISPLAY('plan_table',null,'typical'))
PLAN_TABLE_OUTPUT
Plan hash value: 1197568639
-------------------------------------------------------------------------------------------------------------------------
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time | Pstart| Pstop |
-------------------------------------------------------------------------------------------------------------------------
| 0 | SELECT STATEMENT | | 5 | 255 | 654 (8)| 00:00:01 | | |
| 1 | HASH GROUP BY | | 5 | 255 | 654 (8)| 00:00:01 | | |
|* 2 | HASH JOIN | | 72 | 3672 | 653 (8)| 00:00:01 | | |
| 3 | VIEW | VW_GBC_5 | 72 | 2160 | 651 (8)| 00:00:01 | | |
| 4 | HASH GROUP BY | | 72 | 648 | 651 (8)| 00:00:01 | | |
| 5 | PARTITION RANGE ALL | | 918K| 8075K| 613 (2)| 00:00:01 | 1 | 28 |
| 6 | TABLE ACCESS STORAGE FULL | SALES | 918K| 8075K| 613 (2)| 00:00:01 | 1 | 28 |
| 7 | VIEW | index$_join$_002 | 72 | 1512 | 2 (0)| 00:00:01 | | |
|* 8 | HASH JOIN | | | | | | | |
| 9 | INDEX STORAGE FAST FULL SCAN| PRODUCTS_PK | 72 | 1512 | 1 (0)| 00:00:01 | | |
| 10 | INDEX STORAGE FAST FULL SCAN| PRODUCTS_PROD_CAT_IX | 72 | 1512 | 1 (0)| 00:00:01 | | |
-------------------------------------------------------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
2 - access("P"."PROD_ID"="ITEM_1")
8 - access(ROWID=ROWID)

23 rows selected.