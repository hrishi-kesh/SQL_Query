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


