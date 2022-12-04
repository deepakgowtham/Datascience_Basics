# SQL Basics

## Distinct
```sql
select count(distinct (country)) as count_distinct_countries from films
```

## Operators

- Arithmetic Operator

- Comparison Operators

![image](https://user-images.githubusercontent.com/47908891/205485678-e44b0eaf-4ee1-46f6-9b6c-bebff4452d90.png
- Logical Operator
  AND, OR, NOT,
  BETWEEN(inclusive --results also include the begin and end values)

## Filter
- LIKE, NOT LIKE,
  used with wild card characters
  %  match zero, one or many characters
  _  match single character

## Aggregate functions
- AVG(), SUM(), MIN(), MAX(), COUNT()

![image](https://user-images.githubusercontent.com/47908891/205485986-0ace8590-dd1a-4191-90fa-dfa62b8f2b05.png)

![image](https://user-images.githubusercontent.com/47908891/205486003-3f15fe3a-4153-4925-a8b0-a8827cc28c9a.png)

### Count

![image](https://user-images.githubusercontent.com/47908891/205485908-4809d264-971e-4d33-9eac-8bf2f7e8f840.png)


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


## Order of execution
SQL is not executed in the order we write the code.

- first **FROM**  table
- then **WHERE** condition
- then **SELECT** (Alias is also executed here)
- then grouping like order by, limit 

As the alias the we mention in the select will not work in where clause because where is executed first in order of execution.

![image](https://user-images.githubusercontent.com/47908891/205485362-fbc838aa-5fa4-48f6-b475-dc97b8756260.png)

