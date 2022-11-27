-- Inner join
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
-- one to one relationshipt -- employee and brithday table
-- many to many relationship -- country and languages table

-- Multiple join
-- when using multiple join the result of the first join as a table on itself which is joined by the third table
SELECT c.name, p.year, p.fertility_rate, e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
inner join economies as e 
-- Match on country code
using(code);


--- Care should be taken to avoid duplicate entries.
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
	and  p.year= e.year;
