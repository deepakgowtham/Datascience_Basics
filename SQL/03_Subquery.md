- All the previous join that we have seen so far are **additive** i.e, rows or columns are always added when we use a join
# Subquery
![image](https://user-images.githubusercontent.com/47908891/210240163-572c0cf4-7f8e-432c-bcfb-286b25e6a380.png)
```sql
SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014); 
```

## Semi Join (where in )
- chooses records in first table where a condition is met in the second table

![image](https://user-images.githubusercontent.com/47908891/205436966-6b5cab1f-195f-4e69-902c-4300b88085e5.png)

- identify languages spoken in the Middle East.
```sql
SELECT DISTINCT name
FROM languages
where code in 
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;
```


## Anti Join (not in)
- chooses records in first table where a condition is not equal in the second table

```sql
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
and code not in 
    (SELECT code
    FROM currencies);
```

## Subqueries in select 
![image](https://user-images.githubusercontent.com/47908891/210324793-7932e503-e7ea-402e-b75a-9816807df43d.png)

- subquery in select can be used instead of group by if the data need to group by is present in another table
- both the queries produce same result.

![image](https://user-images.githubusercontent.com/47908891/210324944-5ebcbef6-5578-4e0f-8753-be9e88590857.png)


```sql
-- Find top nine countries with the most cities
select countries.name as country, count(cities.name) as cities_num
 from countries left join cities on countries.code=cities.country_code
 group by country
-- Order by count of cities as cities_num
order by cities_num desc limit 9;
```

```sql
SELECT countries.name AS country,
-- Subquery that provides the count of cities 
  (select count(cities) from cities where cities.country_code =countries.code ) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;
```
- instead of using group by and left join we can use subquery in select

## Subquery inside from
- subquery is used as a temporary table and then select from it
- Subqueries inside FROM can help us select columns from multiple tables in a single query

![image](https://user-images.githubusercontent.com/47908891/210322639-67bf26bd-54ae-46d8-bbfe-12f63da8ab46.png)


![image](https://user-images.githubusercontent.com/47908891/205438881-9fb37e0f-c84b-4f86-8e70-eb5f9e2b6702.png)

- here duplicates are shown in the first if we use distinct duplicates are not shown
```sql
select local_name , sub.lang_num
 from countries,
  (SELECT code, COUNT(*) AS lang_num
  FROM languages
  GROUP BY code) AS sub
-- Where codes match
 where countries.code =sub.code
ORDER BY lang_num DESC;
```

## Correlated Subquery
- Correlated subqueries are subqueries that reference one or more columns in the main query. Correlated subqueries depend on information in the main query to run, and thus, cannot be executed on their own.

- Correlated subqueries are evaluated in SQL once per row of data retrieved -- a process that takes a lot more computing power and time than a simple subquery.

![image](https://user-images.githubusercontent.com/47908891/210346471-207533cc-a5a1-40b4-afac-dde482aa42b7.png)
![image](https://user-images.githubusercontent.com/47908891/210346499-bb05bb61-2b5a-436e-ac4a-1b5b12a62546.png)
![image](https://user-images.githubusercontent.com/47908891/210346554-c45a7b2e-f242-41ae-b0fe-7e0c5eed42fc.png)


## Nested Subquery



