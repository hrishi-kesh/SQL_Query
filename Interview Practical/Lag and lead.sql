SELECT * FROM orders order by 1,2;
--lag--prev data
--lead--after data
--order by mandatory but partion by optional
select status, min(status_date) from_date, max(status_date) to_date
from orders
group by status
order by 2;
select   
  order_id,
  status_date,
  status,
  lag(status,1) over 
    (partition by order_id order by status_date) lag_status
from ORDERS
order by 1,2;
select   
  order_id,
  status_date,
  status,
  lag(status,1) over (partition by order_id order by status_date) lag_status,
  lead(status,1) over (partition by order_id order by status_date) lead_status
from ORDERS
order by 1,2;
