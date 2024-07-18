--------------techTFQ------- SQL Window Function----

select e.*, max(salary) over() as max_sal from employee e; ---here over() act as a windows function with aggregate function
select e.*, max(salary) over(partition by e.DEPT) as max_sal from employee e; ---showing department wise max sal
--find the two new employees joined in each department
select * from (select e.*, row_number() over(partition by e.DEPT order by e.id) as rn from employee e) x where x.rn<3; 

select * from employee e;
