--JOIN
--Inner join
SELECT cities.name as city, countries.name as country, countries.region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- Inner join with alias 
-- if a column is present in only one table alias may not be required.
select c.code as country_code , c.name, e.year, e.inflation_rate
FROM countries AS c
-- Join to economies (alias e)
inner join economies as e
-- Match on code field using table aliases
on c.code=e.code

-- inner join with using keyword
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
using (code);

-- Types of Relationship
-- one to many relationship -- author table and books table
-- one to one relationship -- employee and brithday table
-- many to many relationship -- country and languages table

-- Multiple join
-- when using multiple join the result of the first join acts as a table on itself which is joined by the third table
SELECT c.name, p.year, p.fertility_rate, e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
inner join economies as e 
-- Match on country code
using(code);


--- Care should be taken to avoid cross entries
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
	and  p.year= e.year;
	
-- Left Join
-- all the rows from left table and matching rows from right table
-- left join is also called **left outer join**
SELECT 
	c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
-- Join right table (with alias)
left join countries as c2 
ON c1.country_code = c2.code
ORDER BY code DESC;

-- Right join
-- all the rows from right table and matching row from left
-- null values for empty record from left table
-- left join is more commonly used than right join as both can do same work
SELECT countries.name AS country, languages.name AS language, percent
FROM languages
right JOIN countries
USING(code)
ORDER BY language;

-- Join and group by
select region, avg(gdp_percapita) as avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
-- Group by region
GROUP BY region;


-- Full Join
-- All the data from both the table
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
full join currencies 
USING (code)
-- Where region is North America or name is null
WHERE region = 'North America' or name is NULl
ORDER BY region;

-- Cross join
-- Create all possible combination of records
-- no need to use on or using for condition
select name, language
from countries 
cross join languages


-- self join
-- join a table with itself
-- there is no "self join" keyword in sql we need use alias 
-- you are interested in finding out how much the populations for each country changed from 2010 to 2015.
SELECT 
	p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year =(p2.year-5)
    
-- here we first joined the table on itself and then eliminated the rows that are not required depending on our condition using where clause


