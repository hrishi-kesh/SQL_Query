---------------------------Leetcode---------------------------
---------------------All Leetcode questions are in Leetcode tablespace and separate user and schema---
/*
262. Trips and Users

The cancellation rate is computed by dividing the number of cancelled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.

Input: 
Trips table:
+----+-----------+-----------+---------+---------------------+------------+
| id | client_id | driver_id | city_id | status              | request_at |
+----+-----------+-----------+---------+---------------------+------------+
| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
| 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
| 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
| 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
| 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
| 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
| 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
+----+-----------+-----------+---------+---------------------+------------+

Users table:
+----------+--------+--------+
| users_id | banned | role   |
+----------+--------+--------+
| 1        | No     | client |
| 2        | Yes    | client |
| 3        | No     | client |
| 4        | No     | client |
| 10       | No     | driver |
| 11       | No     | driver |
| 12       | No     | driver |
| 13       | No     | driver |
+----------+--------+--------+
Output: 
+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 | 0.33              |
| 2013-10-02 | 0.00              |
| 2013-10-03 | 0.50              |
+------------+-------------------+
*/

-- Create the Trips table
CREATE TABLE Trips (
    id INT,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR2(50),
    request_at date -- Using VARCHAR2 to match Oracle's data type
);

-- Insert data into the Trips table
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (1, 1, 10, 1, 'completed', TO_DATE('2013-10-01', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (2, 2, 11, 1, 'cancelled_by_driver', TO_DATE('2013-10-01', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (3, 3, 12, 6, 'completed', TO_DATE('2013-10-01', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (4, 4, 13, 6, 'cancelled_by_client', TO_DATE('2013-10-01', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (5, 1, 10, 1, 'completed', TO_DATE('2013-10-02', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (6, 2, 11, 6, 'completed', TO_DATE('2013-10-02', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (7, 3, 12, 6, 'completed', TO_DATE('2013-10-02', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (8, 2, 12, 12, 'completed', TO_DATE('2013-10-03', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (9, 3, 10, 12, 'completed', TO_DATE('2013-10-03', 'YYYY-MM-DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (10, 4, 13, 12, 'cancelled_by_driver', TO_DATE('2013-10-03', 'YYYY-MM-DD'));

commit;

-- Create the Users table
CREATE TABLE Users (
    users_id INT,
    banned VARCHAR2(3),
    role VARCHAR2(10) CHECK (role IN ('client', 'driver'))
);

-- Insert data into the Users table
INSERT INTO Users (users_id, banned, role) VALUES (1, 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (2, 'Yes', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (3, 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (4, 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (10, 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES (11, 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES (12, 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES (13, 'No', 'driver');
commit;

-- Query to calculate the cancellation rate
select t.request_at as Day,
        round(sum(case when t.status in ('cancelled_by_driver','cancelled_by_client') then 1 else 0 end)/count(t.id),2) as cancellation_rate
from Trips t inner join Users u1 on t.client_id = u1.users_id and u1.BANNED = 'No'
             inner join Users u2 on t.driver_id = u2.users_id and u2.BANNED = 'No'
where t.request_at BETWEEN DATE '2013-10-01' AND DATE '2013-10-03'
group by t.request_at
order by t.request_at;

/*
Write a solution to find the customer_number for the customer who has placed the largest number of orders.

Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
*/

-- Create the Orders table in Oracle
CREATE TABLE Orders (
    order_number NUMBER,
    customer_number NUMBER
);

INSERT INTO Orders (order_number, customer_number) VALUES (1, 1);
INSERT INTO Orders (order_number, customer_number) VALUES (2, 2);
INSERT INTO Orders (order_number, customer_number) VALUES (3, 3);
INSERT INTO Orders (order_number, customer_number) VALUES (4, 3);
commit;

WITH cte AS (
    SELECT 
        COUNT(customer_number) AS c,
        customer_number
    FROM Orders
    GROUP BY customer_number
)
SELECT customer_number
FROM cte 
ORDER BY c DESC
FETCH FIRST 1 ROW ONLY;

--2nd way
SELECT  customer_number FROM (SELECT customer_number, COUNT(*)
FROM orders GROUP BY  customer_number  ORDER BY  2 DESC)
WHERE  ROWNUM = 1;
--3rd way without rownum and fetch first
SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(*) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM Orders
        GROUP BY customer_number
    )
);

/*
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
*/

-- Create the Weather table in Oracle
CREATE TABLE Weather (
    id NUMBER,
    recordDate DATE,
    temperature NUMBER
);

-- Insert data into the Weather table using multiple inserts

INSERT INTO Weather (id, recordDate, temperature) VALUES (1, DATE '2015-01-01', 10);
INSERT INTO Weather (id, recordDate, temperature) VALUES (2, DATE '2015-01-02', 25);
INSERT INTO Weather (id, recordDate, temperature) VALUES (3, DATE '2015-01-03', 20);
INSERT INTO Weather (id, recordDate, temperature) VALUES (4, DATE '2015-01-04', 30);
commit;

-- Query to find all dates id with higher temperatures compared to its previous dates (yesterday)
with cte
as
(select w.id as id, lag(w.temperature,1, temperature) over(order by w.recordDate) as l_temperature, w.temperature from weather w)
select id from cte where l_temperature < temperature;

/*
 Important Ads Performance
-- Ads CTR calculation (Click-Through Rate)
-- CTR = (Clicks / (Clicks + Views)) * 100, ignoring 'Ignored' actions

-- Sample Ads table:
-- +-------+---------+---------+
-- | ad_id | user_id | action  |
-- +-------+---------+---------+
-- | 1     | 1       | Clicked |
-- | 2     | 2       | Clicked |
-- | 3     | 3       | Viewed  |
-- | 5     | 5       | Ignored |
-- | 1     | 7       | Ignored |
-- | 2     | 7       | Viewed  |
-- | 3     | 5       | Clicked |
-- | 1     | 4       | Viewed  |
-- | 2     | 11      | Viewed  |
-- | 1     | 2       | Clicked |
-- +-------+---------+---------+

-- Result:
-- +-------+-------+
-- | ad_id | ctr   |
-- +-------+-------+
-- | 1     | 66.67 |
-- | 3     | 50.00 |
-- | 2     | 33.33 |
-- | 5     | 0.00  |
-- +-------+-------+

-- For ad_id = 1, ctr = (2/(2+1))*100 = 66.67
-- For ad_id = 2, ctr = (1/(1+2))*100 = 33.33
-- For ad_id = 3, ctr = (1/(1+1))*100 = 50.00
-- For ad_id = 5, ctr = 0.00 (no clicks or views)
-- Only 'Clicked' and 'Viewed' actions are considered
*/

-- Create Ads table
CREATE TABLE Ads (
    ad_id NUMBER,
    user_id NUMBER,
    action VARCHAR2(10) CHECK (action IN ('Clicked', 'Viewed', 'Ignored'))
);

-- Insert data into Ads table
INSERT INTO Ads (ad_id, user_id, action) VALUES (1, 1, 'Clicked');
INSERT INTO Ads (ad_id, user_id, action) VALUES (2, 2, 'Clicked');
INSERT INTO Ads (ad_id, user_id, action) VALUES (3, 3, 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES (5, 5, 'Ignored');
INSERT INTO Ads (ad_id, user_id, action) VALUES (1, 7, 'Ignored');
INSERT INTO Ads (ad_id, user_id, action) VALUES (2, 7, 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES (3, 5, 'Clicked');
INSERT INTO Ads (ad_id, user_id, action) VALUES (1, 4, 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES (2, 11, 'Viewed');
INSERT INTO Ads (ad_id, user_id, action) VALUES (1, 2, 'Clicked');
commit;

-- Query to calculate CTR
select ad_id, 
       round(
         sum(case when action='Clicked' then 1 else 0 end) /
         nullif(sum(case when action in ('Clicked','Viewed') then 1 else 0 end), 0) * 100, 2
       ) as ctr --NULLIF returns NULL if the denominator is 0, preventing division by zero error
from Ads 
group by ad_id
order by ad_id;

/*
Imprtant Friendly Movies streamed list
-- Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020. Return the result table in any order. The query result format is in the following example.

-- TVProgram table:
-- +--------------------+--------------+-------------+
-- | program_date       | content_id   | channel     |
-- +--------------------+--------------+-------------+
-- | 2020-06-10 08:00   | 1            | LC-Channel  |
-- | 2020-05-11 12:00   | 2            | LC-Channel  |
-- | 2020-05-12 12:00   | 3            | LC-Channel  |
-- | 2020-05-13 14:00   | 4            | Disney Ch   |
-- | 2020-06-18 14:00   | 4            | Disney Ch   |
-- | 2020-07-15 16:00   | 5            | Disney Ch   |
-- +--------------------+--------------+-------------+

-- Content table:
-- +------------+----------------+---------------+---------------+
-- | content_id | title          | Kids_content  | content_type  |
-- +------------+----------------+---------------+---------------+
-- | 1          | Leetcode Movie | N             | Movies        |
-- | 2          | Alg. for Kids  | Y             | Series        |
-- | 3          | Database Sols  | N             | Series        |
-- | 4          | Aladdin        | Y             | Movies        |
-- | 5          | Cinderella     | Y             | Movies        |
-- +------------+----------------+---------------+---------------+

-- Result table:
-- +--------------+
-- | title        |
-- +--------------+
-- | Aladdin      |
-- +--------------+
-- "Leetcode Movie" is not a content for kids.
-- "Alg. for Kids" is not a movie.
-- "Database Sols" is not a movie
-- "Alladin" is a movie, content for kids and was streamed in June 2020.
-- "Cinderella" was not streamed in June 2020.
*/

-- Create TVProgram table
CREATE TABLE TVProgram (
    program_date TIMESTAMP,
    content_id NUMBER,
    channel VARCHAR2(50)
);
-- Insert data into TVProgram table
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_TIMESTAMP('2020-06-10 08:00', 'YYYY-MM-DD HH24:MI'), 1, 'LC-Channel');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_TIMESTAMP('2020-05-11 12:00', 'YYYY-MM-DD HH24:MI'), 2, 'LC-Channel');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_TIMESTAMP('2020-05-12 12:00', 'YYYY-MM-DD HH24:MI'), 3, 'LC-Channel');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_TIMESTAMP('2020-05-13 14:00', 'YYYY-MM-DD HH24:MI'), 4, 'Disney Ch');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_TIMESTAMP('2020-06-18 14:00', 'YYYY-MM-DD HH24:MI'), 4, 'Disney Ch');
INSERT INTO TVProgram (program_date, content_id, channel) VALUES (TO_TIMESTAMP('2020-07-15 16:00', 'YYYY-MM-DD HH24:MI'), 5, 'Disney Ch');

commit;
-- Create Content table
CREATE TABLE Content (
    content_id NUMBER,
    title VARCHAR2(50),
    Kids_content VARCHAR2(1) CHECK (Kids_content IN ('Y', 'N')),
    content_type VARCHAR2(50) CHECK (content_type IN ('Movies', 'Series'))
);
-- Insert data into Content table
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES (1, 'Leetcode Movie', 'N', 'Movies');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES (2, 'Alg. for Kids', 'Y', 'Series');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES (3, 'Database Sols', 'N', 'Series');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES (4, 'Aladdin', 'Y', 'Movies');
INSERT INTO Content (content_id, title, Kids_content, content_type) VALUES (5, 'Cinderella', 'Y', 'Movies');
commit;
-- Query to find distinct titles of kid-friendly movies streamed in June 2020
select distinct c.title
from TVProgram t inner join content c on t.content_id = c.content_id
where c.Kids_content = 'Y' and c.content_type = 'Movies' and to_char(t.program_date,'mon yyyy')= 'jun 2020';

select * from TVProgram where to_char(program_date, 'mon yyyy') = 'jun 2020';

SELECT TO_CHAR(DATE '2020-07-15', 'DAY') FROM DUAL; --show the day of the week

/*
 -- Important Game Play Analysis 2
-- Write a SQL query that reports the device that is first logged in for each player. The query result format is in the following example:

-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+

-- Result table:
-- +-----------+-----------+
-- | player_id | device_id |
-- +-----------+-----------+
-- | 1         | 2         |
-- | 2         | 3         |
-- | 3         | 1         |
-- +-----------+-----------+

*/
-- Create Activity table
CREATE TABLE Activity (
    player_id NUMBER,
    device_id NUMBER,
    event_date DATE,
    games_played NUMBER
); 
-- Insert data into Activity table
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES (1, 2, DATE '2016-03-01', 5);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES (1, 2, DATE '2016-05-02', 6);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES (2, 3, DATE '2017-06-25', 1);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES (3, 1, DATE '2016-03-02', 0);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES (3, 4, DATE '2018-07-03', 5);
commit;
-- Query to find the first device logged in for each player

--1st way
with cte 
AS
(select player_id, device_id, row_number() over(partition by player_id order by event_date) rnk from Activity)
select player_id, device_id
from cte
where rnk = 1;

--2nd way --correlated subquery
select player_id, device_id
from Activity a
where event_date = (select min(event_date) from Activity where player_id = a.player_id);--correlated subquery
--This is a common pattern in SQL when you need to find attributes associated with extremes (first, last, highest, lowest) within groups.
--A correlated subquery is a subquery that references a column from the outer query. It is evaluated once per row of the outer query.
--3rd way ---- This solution uses an inline view (subquery in the FROM clause) with the analytic function ROW_NUMBER().
select player_id, device_id
from (select player_id, device_id,
             row_number() over(partition by player_id order by event_date) as rnk
      from Activity)
where rnk = 1;

/*
-- Important Group sold products by the date

-- Write an SQL query to find for each date, the number of distinct products sold and their names. The sold-products names for each date should be sorted lexicographically(Basically dictionar order). Return the result table ordered by sell_date. The query result format is in the following example.

-- Activities table:
-- +------------+-------------+
-- | sell_date  | product     |
-- +------------+-------------+
-- | 2020-05-30 | Headphone   |
-- | 2020-06-01 | Pencil      |
-- | 2020-06-02 | Mask        |
-- | 2020-05-30 | Basketball  |
-- | 2020-06-01 | Bible       |
-- | 2020-06-02 | Mask        |
-- | 2020-05-30 | T-Shirt     |
-- +------------+-------------+

-- Result table:
-- +------------+----------+------------------------------+
-- | sell_date  | num_sold | products                     |
-- +------------+----------+------------------------------+
-- | 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
-- | 2020-06-01 | 2        | Bible,Pencil                 |
-- | 2020-06-02 | 1        | Mask                         |
-- +------------+----------+------------------------------+
*/

-- Create Activities table
CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR2(50)
);
-- Insert data into Activities table
INSERT INTO Activities (sell_date, product) VALUES (DATE '2020-05-30', 'Headphone');
INSERT INTO Activities (sell_date, product) VALUES (DATE '2020-06-01', 'Pencil');
INSERT INTO Activities (sell_date, product) VALUES (DATE '2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES (DATE '2020-05-30', 'Basketball');
INSERT INTO Activities (sell_date, product) VALUES (DATE '2020-06-01', 'Bible');
INSERT INTO Activities (sell_date, product) VALUES (DATE '2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES (DATE '2020-05-30', 'T-Shirt');
commit;

-- 1st way using listagg  Query to find the number of distinct products sold and their names for each date
select sell_date, 
       count(distinct product) as num_sold, 
       listagg(distinct product, ',') within group (order by product) as products
from activities 
group by sell_date 
order by sell_date;

/*
-- The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 
-- If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

-- Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.

-- Delivery table:
-- +-------------+-------------+------------+-----------------------------+
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  |
-- | 2           | 5           | 2019-08-02 | 2019-08-02                  |
-- | 3           | 1           | 2019-08-11 | 2019-08-11                  |
-- | 4           | 3           | 2019-08-24 | 2019-08-26                  |
-- | 5           | 4           | 2019-08-21 | 2019-08-22                  |
-- | 6           | 2           | 2019-08-11 | 2019-08-13                  |
-- +-------------+-------------+------------+-----------------------------+

-- Result table:
-- +----------------------+
-- | immediate_percentage |
-- +----------------------+
-- | 33.33                |
-- +----------------------+
-- The orders with delivery id 2 and 3 are immediate while the others are scheduled.
*/

-- Create Delivery table
CREATE TABLE Delivery (
    delivery_id NUMBER,
    customer_id NUMBER,
    order_date DATE,
    customer_pref_delivery_date DATE
);
-- Insert data into Delivery table
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (1, 1, DATE '2019-08-01', DATE '2019-08-02');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (2, 5, DATE '2019-08-02', DATE '2019-08-02');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (3, 1, DATE '2019-08-11', DATE '2019-08-11');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (4, 3, DATE '2019-08-24', DATE '2019-08-26');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (5, 4, DATE '2019-08-21', DATE '2019-08-22');
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (6, 2, DATE '2019-08-11', DATE '2019-08-13');
commit;
-- 1st way Query to find the percentage of immediate orders
select round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) / count(delivery_id) * 100, 2) as immediate_percentage
from Delivery;

--2nd way using avg 
Select 
Round(avg(case when order_date=customer_pref_delivery_date then 1 else 0 end)*100,2) as immediate_percentage
from delivery;--looks weird but works 
--let suppose we have 3 immediate orders and 6 scheduled orders then the average will be (1+1+1+0+0+0)/6 = 0.5*100 = 50% immediate orders
--3rd way using count only 

select round(count(case when order_date = customer_pref_delivery_date then 1 end) / count(delivery_id) * 100, 2) as immediate_percentage
from Delivery;

/* 
-- Important Reformat department table
-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month. The query result format is in the following example:

-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+

-- Result table:
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+
*/
-- Create Department table
CREATE TABLE Department (
    id NUMBER,
    revenue NUMBER,
    month VARCHAR2(3) CHECK (month IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))
);
-- Insert data into Department table
INSERT INTO Department (id, revenue, month) VALUES (1, 8000, 'Jan');
INSERT INTO Department (id, revenue, month) VALUES (2, 9000, 'Jan');
INSERT INTO Department (id, revenue, month) VALUES (3, 10000, 'Feb');
INSERT INTO Department (id, revenue, month) VALUES (1, 7000, 'Feb');
INSERT INTO Department (id, revenue, month) VALUES (1, 6000, 'Mar');
commit;

-- 1st way Query to reformat the table
-- Shift+alt+a for multi line comment

select id,
       max(case when month = 'Jan' then revenue end) as Jan_Revenue,
       max(case when month = 'Feb' then revenue end) as Feb_Revenue,
       max(case when month = 'Mar' then revenue end) as Mar_Revenue,
       max(case when month = 'Apr' then revenue end) as Apr_Revenue,
       max(case when month = 'May' then revenue end) as May_Revenue,
       max(case when month = 'Jun' then revenue end) as Jun_Revenue,
       max(case when month = 'Jul' then revenue end) as Jul_Revenue,
       max(case when month = 'Aug' then revenue end) as Aug_Revenue,
       max(case when month = 'Sep' then revenue end) as Sep_Revenue,
       max(case when month = 'Oct' then revenue end) as Oct_Revenue,
       max(case when month = 'Nov' then revenue end) as Nov_Revenue,
       max(case when month = 'Dec' then revenue end) as Dec_Revenue
from Department
group by id 
order by id;

/*
-- Important Sales Analysis 2
-- Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.

-- The query result format is in the following example:

-- Product table:
-- +------------+--------------+------------+
-- | product_id | product_name | unit_price |
-- +------------+--------------+------------+
-- | 1          | S8           | 1000       |
-- | 2          | G4           | 800        |
-- | 3          | iPhone       | 1400       |
-- +------------+--------------+------------+

-- Sales table:
-- +-----------+------------+----------+------------+----------+-------+
-- | seller_id | product_id | buyer_id | sale_date  | quantity | price |
-- +-----------+------------+----------+------------+----------+-------+
-- | 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
-- | 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
-- | 2         | 1          | 3        | 2019-06-02 | 1        | 800   |
-- | 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |
-- +-----------+------------+----------+------------+----------+-------+

-- Result table:
-- +-------------+
-- | buyer_id    |
-- +-------------+
-- | 1           |
-- +-------------+
-- The buyer with id 1 bought an S8 but didn't buy an iPhone. The buyer with id 3 bought both.
*/
-- Create Product table
CREATE TABLE Product (
    product_id NUMBER,
    product_name VARCHAR2(50),
    unit_price NUMBER
);

-- Insert data into Product table
INSERT INTO Product (product_id, product_name, unit_price) VALUES (1, 'S8', 1000);
INSERT INTO Product (product_id, product_name, unit_price) VALUES (2, 'G4', 800);
INSERT INTO Product (product_id, product_name, unit_price) VALUES (3, 'iPhone', 1400);
commit;
-- Create Sales table
CREATE TABLE Sales (
    seller_id NUMBER,
    product_id NUMBER,
    buyer_id NUMBER,
    sale_date DATE,
    quantity NUMBER,
    price NUMBER
);
-- Insert data into Sales table
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (1, 1, 1, DATE '2019-01-21', 2, 2000);
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (1, 2, 2, DATE '2019-02-17', 1, 800);
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (2, 1, 3, DATE '2019-06-02', 1, 800);
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (3, 3, 3, DATE '2019-05-13', 2, 2800);
commit;
-- 1st way Query to find buyers who bought S8 but not iPhone
select buyer_id
from Sales
group by buyer_id
having sum(case when product_id = 1 then 1 else 0 end) > 0
    and sum(case when product_id = 3 then 1 else 0 end) = 0;







