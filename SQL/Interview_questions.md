
<img width="443" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5aeee907-e353-4f89-8644-bb42e927f006">

answers
```sql
select salary, salary_rank from 
(select salary, dense_rank() over(order by salary desc) as salary_rank from employees) where salary_rank =5

select salary, salary_rank from 
(select salary, dense_rank() over(order by salary desc) as salary_rank from employees) where salary_rank >4
select * from 
(select *, count() over (partition by manager) as emp_count from employees) where emp_count >1

min salary without using min

select * from employee where salary not  in (
select e1.salary from employee e1 inner join e2 where e1.salary > e2.salary ) -- in this subquery all salary except min salary is fetched, then we filter 


select e1.salary from employee e1 inner join employee 2 where e1.salaray < e2. salary order by e1.salary asc limit 1;

select * from employee where salary not  in (
select e1.salary from employee e1 inner join e2 where e1.salary > e2.salary )




select *, row_number() over() as row_number  from employees where row_number %2 =0
```
