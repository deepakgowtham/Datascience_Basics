# SQL Basics

## Distinct
```sql
select count(distinct (country)) as count_distinct_countries from films
```
## Aggregate functions
- AVG(), SUM(), MIN(), MAX(), COUNT()

![image](https://user-images.githubusercontent.com/47908891/205485986-0ace8590-dd1a-4191-90fa-dfa62b8f2b05.png)

![image](https://user-images.githubusercontent.com/47908891/205486003-3f15fe3a-4153-4925-a8b0-a8827cc28c9a.png)

### Count

![image](https://user-images.githubusercontent.com/47908891/205485908-4809d264-971e-4d33-9eac-8bf2f7e8f840.png)

## Operators

### Arithmetic Operator
 +,-, *,/
 
 ![image](https://user-images.githubusercontent.com/47908891/205486276-cf4764c9-acce-40bb-a7f4-e92709bd4e13.png)
 ![image](https://user-images.githubusercontent.com/47908891/205486342-9f4a1170-7ab8-4e4a-a355-d6fd489c77a1.png)

```sql
SELECT count(deathdate) * 100.0 / count(*) AS percentage_dead
FROM people;
```

 
### Comparison Operators

![image](https://user-images.githubusercontent.com/47908891/205486637-2edd27f4-60c6-4ede-961c-9e4ce3815c64.png)

### Logical Operator
  AND, OR, NOT,
  BETWEEN(inclusive --results also include the begin and end values)

## Filter
- LIKE, NOT LIKE,
  used with wild card characters
  %  match zero, one or many characters
  _  match single character




## Handling Null values
- IS NULL, IS NOT NULL

```sql
select count(title) as count_language_known from films where language is not null;
```
## Round()
 ![image](https://user-images.githubusercontent.com/47908891/205486170-db13ed95-3abd-4cec-9cb6-44fe020effa1.png)
 - default decimal place is 0
 - we can also give negative decimal place which rounds the number left of decimal point eg round(41250, -3) = 41000
 - only works on numerical fields

## Order by
```sql
select certification, release_year, title from films
order by certification asc, release_year desc
```
## Order of execution
SQL is not executed in the order we write the code.

- first **FROM**  table
- group by (if present)
- then **WHERE** condition
- then **SELECT** (Alias is also executed here)
- then grouping like order by,
- then limit 

As the alias the we mention in the select will not work in where clause because where is executed first in order of execution.

![image](https://user-images.githubusercontent.com/47908891/205485362-fbc838aa-5fa4-48f6-b475-dc97b8756260.png)




## Group by
- Using a aggregate function on by grouping variables into categories.

```sql
select release_year, avg(duration) as avg_duration from films
group by release_year
```

### Filtering grouped data
- cant filter aggregate function using where clause, it would result in error
- Here **HAVING** should be used


![image](https://user-images.githubusercontent.com/47908891/206704843-4fc87297-eb25-4bdb-a353-0021c01601d8.png)

here the order of execution is
- from 
- where
- group by
- having
- select 
- order by
- limit

as in the order of execution where is executed first before group by and aggregation, so we cant filter aggregate using where clause so we need to use having

![image](https://user-images.githubusercontent.com/47908891/206706241-38165ae3-4577-4c32-962e-250dc381dc70.png)
```sql
select country, count(distinct(certification)) as certification_count from films
group by country
having count(distinct(certification)) >10;
```




