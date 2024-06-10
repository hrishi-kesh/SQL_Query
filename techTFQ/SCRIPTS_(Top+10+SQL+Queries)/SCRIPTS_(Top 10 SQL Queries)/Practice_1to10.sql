--Q.3 Find the actual distance travel by car

select * from CAR_TRAVELS c;
select (c.cumulative_distance-lag(c.cumulative_distance,1,0) over(partition by c.cars order by c.days)) distance_travelled from car_travels c;

--Q.4 Convert the given input to expected output--
select * from SRC_DEST_DISTANCE s;

with cte
AS
(select s.source,s.destination,s.distance,row_number() over(order by s.SOURCE ) as rn from SRC_DEST_DISTANCE s)
select c1.source,c1.destination,c1.distance from cte c1,cte c2 where c1.rn<c2.rn and c1.source=c2.destination and c1.destination=c2.source;

--Q.5 Ungroup the given input data
-- don't write level which is already a keyword
select * from travel_items;
WITH cte (id, item_name, total_count,lev) AS (
    SELECT id, item_name, total_count, 1 AS lev
    FROM travel_items
    UNION ALL
    SELECT cte.id, cte.item_name, cte.total_count - 1, cte.lev + 1
    FROM cte
    WHERE cte.total_count > 1
)
SELECT id, item_name,lev
FROM cte order by 3;

--Q.6 Derive IPL matches
--1. Write an sql query such that each team play with each other just once.
--2. Write an sql query such that each team play with each other twice.
--each team play with each other just once.
select * from teams t;
with cte
as
(select row_number() over(order by team_name) as id,t.*
from teams t)
select team.team_name as team, opponent.team_name as opponent from cte team
inner join cte opponent on team.id<opponent.id
order by team;--here we use cte for row_number() we can't use rownum here because 'rownum' is assigned after the rows are fetched and sorted.

--we can use this as well for above prog
SELECT team.team_name AS team, opponent.team_name AS opponent 
FROM 
    (SELECT team_name, ROW_NUMBER() OVER (ORDER BY team_name) AS rnum FROM teams) team
INNER JOIN 
    (SELECT team_name, ROW_NUMBER() OVER (ORDER BY team_name) AS rnum FROM teams) opponent 
ON team.rnum < opponent.rnum
ORDER BY team.team_name;

--each team play with each other twice.
select * from teams t;
with cte
as
(select row_number() over(order by team_name) as id,t.*
from teams t)
select team.team_name as team, opponent.team_name as opponent from cte team
inner join cte opponent on team.id<>opponent.id
order by team;

--Q.7 Convert row level data to column level data
--it's lengthy please check in solution page
--Q.8 Employee working under particular employee using hirarchical query
--Already aware 
--Q9. Find the average sales
--write a query to find the diff in avg sales of each month of 2003 and 2004
select * from sales_order;

with Cte
AS
(select year_id,month_id,to_char(order_date,'Mon') as mon
,avg(sales) avg_sales_per_month from SALES_ORDER s
where year_id in (2003,2004)
group by year_id,month_id,to_char(order_date,'Mon'))
select y03.mon, round(abs(y03.avg_sales_per_month-y04.avg_sales_per_month),2) diff
from cte y03
inner join cte y04
on y03.mon=y04.mon
where y03.year_id=2003
and y04.year_id=2004
order by y03.month_id;

--Q.10 Pizza Delivery Status
--A pizza company is taking orders from customers, and each pizza ordered is added to their database as a separate order.
--Each order has an associated status, "CREATED or SUBMITTED or DELIVERED'. 
--An order's Final_ Status is calculated based on status as follows:
--Write a query to report the customer_name and Final_Status of each customer's arder. Order the results by customer name

select * from cust_orders;

select distinct cust_name customer_name, 'COMPLETED' Status
from cust_orders d
where d.STATUS='DELIVERED' and 
not exists (select 1 from cust_orders d2 where d2.cust_name=d.cust_name and d2.status in ('SUBMITTED','CREATED'))
UNION
select distinct cust_name customer_name, 'IN PROGRESS' Status
from cust_orders d
where d.STATUS='DELIVERED' and 
exists (select 1 from cust_orders d2 where d2.cust_name=d.cust_name and d2.status in ('SUBMITTED','CREATED'))
UNION
select distinct cust_name customer_name, 'AWAITING PROGRESS' Status
from cust_orders d
where d.STATUS='SUBMITTED' and 
not exists (select 1 from cust_orders d2 where d2.cust_name=d.cust_name and d2.status in ('DELIVERED'))
UNION
select distinct cust_name customer_name, 'AWAITING SUBMISSION' Status
from cust_orders d
where d.STATUS='CREATED' and 
not exists (select 1 from cust_orders d2 where d2.cust_name=d.cust_name and d2.status in ('DELIVERED','SUBMITTED'));




