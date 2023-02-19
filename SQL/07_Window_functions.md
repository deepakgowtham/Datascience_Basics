# Window Functions

![image](https://user-images.githubusercontent.com/47908891/218248649-19ec7f47-f775-4048-81e3-ab8b4e3cb493.png)

- If we need to columns that are not aggregate, we need to use subquery but instead of that we can use window function
![image](https://user-images.githubusercontent.com/47908891/213381331-2c65a47e-d113-4c03-9f49-9a7f3959c5da.png)


Non Aggregate column

![image](https://user-images.githubusercontent.com/47908891/213380448-b876c61e-a522-4193-8158-f93e84c79e9b.png)

We usually subqueries for this

![image](https://user-images.githubusercontent.com/47908891/213381495-5ffc242e-79eb-47b3-ab91-38cb466eb481.png)

- Unlike a subquery in SELECT, your window function will calculate the aggregate from the result dataset that is obtained and not on the entire table.



## Over Clause 
- The OVER clause indicates that a function is a window function. The parentheses after OVER can be empty, just like the previous example, but they can also contain subclauses

![image](https://user-images.githubusercontent.com/47908891/218248836-48c1aff8-0511-4205-a2bb-eb220074b769.png)
- These subclauses radically change the window function's output


![image](https://user-images.githubusercontent.com/47908891/213381624-87c67938-df34-41d4-857b-40b6f9a12fb3.png)

- Here the over clause passes the aggregate value over the existing result set
- it uses a simpler syntax and faster procesing
```sql
SELECT 
	-- Select the id, country name, season, home, and away goals
	m.id, 
    c.name AS country, 
    m.season,
	m.home_goal,
	m.away_goal,
    -- Use a window to include the aggregate average in each row
	avg(m.home_goal + m.away_goal) over() AS overall_avg
FROM match AS m
LEFT JOIN country AS c ON m.country_id = c.id;
```
## Row number

- Basic operation for which window function is useful for is Row Number.
- Row number acts as the index
- the row number can be used to call specific row.

![image](https://user-images.githubusercontent.com/47908891/218248762-7d4007b1-4905-4e4a-8c2b-30e7ebcfcd63.png)

### Row number in ascending order.

```sql
SELECT
  Year,

  -- Assign numbers to each year
  row_number() over() AS Row_N
FROM (
  SELECT distinct year
  FROM Summer_Medals
  ORDER BY Year ASC
) AS Years
ORDER BY Year ASC;

```

### Order by (subclause of over)
- change the order of row number ascending or descending 
- can order by multiple columns as well
- You can ORDER both inside and outside OVER at the same time. In this query, row numbers are assigned based on the year and the event, but the ordering outside OVER orders by country and row. How will these two orders be executed? First, ROW_NUMBER will assign numbers based on the order within OVER. So the row numbers are given after sorting the table by year and event. After that, the ORDER outside of OVER takes over, and sorts the results of the table by Country and row number. Notice that the first row in the result isn't the row with number 1, because the two orders are based on different columns. From that, you can conclude that the ORDER inside OVER takes effect before the ORDER outside of it.
 
 ```sql
 WITH Athlete_Medals AS (
  SELECT
    -- Count the number of medals each athlete has earned
    Athlete,
    COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Athlete)

SELECT
  -- Number each athlete by how many medals they've earned
  athlete,
  row_number() OVER (ORDER BY medals DESC) AS Row_N
FROM Athlete_Medals
ORDER BY Medals DESC;
```

## LAG to find Reigning Chamption
- reigning champion = who won in both previous year and current year competition
- Form a new column containing champions from previous year.

 ![image](https://user-images.githubusercontent.com/47908891/219857017-e1353767-ca03-46a0-bcce-fb5cf7a8db45.png)
 
 ![image](https://user-images.githubusercontent.com/47908891/219857068-54af8dfb-a18e-4906-a875-d3ffb8f4fce9.png)

- as the first row doesnt contain previous year the last champion column is null.

```sql
WITH Weightlifting_Gold AS (
  SELECT
    -- Return each year's champions' countries
    Year,
    Country AS champion
  FROM Summer_Medals
  WHERE
    Discipline = 'Weightlifting' AND
    Event = '69KG' AND
    Gender = 'Men' AND
    Medal = 'Gold')

SELECT
  Year, Champion,
  -- Fetch the previous year's champion
  lag(Champion, 1) OVER
    (order by year ASC) AS Last_Champion
FROM Weightlifting_Gold
ORDER BY Year ASC;
```
## Four fetching fuctions

![image](https://user-images.githubusercontent.com/47908891/219933471-ee10aa6a-4b2a-44ca-9492-5f098cb91e39.png)


```sql

SELECT
  -- For each year, fetch the current and future medalists
  year,
  Athlete,
  lead(Athlete,3) OVER (ORDER BY year ASC) AS Future_Champion
FROM Discus_Medalists
ORDER BY Year ASC;

SELECT
  Year,
  City,
  -- Get the last city in which the Olympic games were held
  last_value(city) OVER (
   ORDER BY year ASC
   RANGE BETWEEN
     UNBOUNDED PRECEDING AND
     UNBOUNDED FOLLOWING
  ) AS Last_City
FROM Hosts
ORDER BY Year ASC;
```



## Rank
- Creates a new column numbering your dataset from highest to lowest or lowest to highest
- use RANK() clause followed by OVER clause, inside OVER  include the order by and columns that we want to generate rank
- default order is ascending, to change it we can include DESC inside the OVER

![image](https://user-images.githubusercontent.com/47908891/213382377-30442194-623f-41d3-9ccb-cacb3ccb4c54.png)
```sql
SELECT 
	-- Select the league name and average goals scored
	l.name AS league,
    avg(m.home_goal + m.away_goal) AS avg_goals,
    -- Rank leagues in descending order by average goals
    RANK() OVER(Order by avg(m.home_goal + m.away_goal) desc) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
-- Order the query by the rank you created
order by league_rank;
```
### RANK function types
![image](https://user-images.githubusercontent.com/47908891/219933773-08ff243c-7e74-47dd-a366-0976bfbe20fd.png)

![image](https://user-images.githubusercontent.com/47908891/219933856-ab6ed4fb-f351-4f0c-a6e2-283a5f12fa0e.png)



## Differences in window function
- window functions are processed after the entire query except the final ORDER BY statement. Thus, the window function uses the result set to calculate information, as opposed to using the database directly.
-  it's important to know that window functions are available in PostgreSQL, Oracle, MySQL, but not in SQLite.
- Unlike GROUP BY results, window functions don't reduce the number of rows in the output.
- Window functions can fetch values from other rows into the table, whereas GROUP BY functions cannot.
- Window functions can calculate running totals and moving averages, whereas GROUP BY functions cannot.

## Partition by
- Partition results over a particular column(category)
- calculate different aggregate values within one column of data, and pass them down a data set, instead of having to calculate them in different columns.

- When we use row number and partition by each partition row will start from 1 

![image](https://user-images.githubusercontent.com/47908891/216971812-0f415cb1-f2f4-4e78-ac13-f3e3f8efec74.png)

In below example each row has different average.
![image](https://user-images.githubusercontent.com/47908891/216972143-be5fe303-5d1f-4b1d-b0ff-c2fe5e47ef97.png)

```sql
SELECT 
	date,
	season,
	home_goal,
	away_goal,
	CASE WHEN hometeam_id = 8673 THEN 'home' 
         ELSE 'away' END AS warsaw_location,
	-- Calculate average goals partitioned by season and month
    avg(home_goal) over(partition by  season, 
         	EXTRACT(month FROM date)) AS season_mo_home,
    avg(away_goal) over(partition by season, 
            EXTRACT(month FROM date)) AS season_mo_away
FROM match
WHERE 
	hometeam_id = 8673
    OR awayteam_id = 8673
ORDER BY (home_goal + away_goal) DESC;

```

```sql
WITH Athletics_Gold AS (
  SELECT DISTINCT
    Gender, Year, Event, Country
  FROM Summer_Medals
  WHERE
    Year >= 2000 AND
    Discipline = 'Athletics' AND
    Event IN ('100M', '10000M') AND
    Medal = 'Gold')

SELECT
  Gender, Year, Event,
  Country AS Champion,
  -- Fetch the previous year's champion by gender and event
  lag(country) OVER (partition by gender, event
            ORDER BY Year ASC) AS Last_Champion
FROM Athletics_Gold
ORDER BY Event ASC, Gender ASC, Year ASC;
```

## Paging 

![image](https://user-images.githubusercontent.com/47908891/219934194-91b7a1a5-7a23-4bc8-b2b2-92943d7374cf.png)

![image](https://user-images.githubusercontent.com/47908891/219934243-2e4b7f2d-f718-45a3-8f13-beda05a9e835.png)

```sql
WITH Athlete_Medals AS (
  SELECT Athlete, COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Athlete
  HAVING COUNT(*) > 1),
  
  Thirds AS (
  SELECT
    Athlete,
    Medals,
    NTILE(3) OVER (ORDER BY Medals DESC) AS Third
  FROM Athlete_Medals)
  
SELECT
  -- Get the average medals earned in each third
  third,
  avg(medals) AS Avg_Medals
FROM Thirds
GROUP BY Third
ORDER BY Third ASC;

```
## Running Aggregates
- when we use the aggregate function along with window function it becomes running aggregates
- it is used to calculate the cumulative sum, cumulative average, running max (max till the current row)

Running Max

![image](https://user-images.githubusercontent.com/47908891/219934926-50616794-621c-4452-bff9-20dfd92c6caf.png)

Can be also combined with Partition by

![image](https://user-images.githubusercontent.com/47908891/219934981-b4f104c7-ca25-4f74-972d-847d61364563.png)

- the maximum medals earned so far for each country, ordered by year in ascending order.
```sql
WITH Country_Medals AS (
  SELECT
    Year, Country, COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country IN ('CHN', 'KOR', 'JPN')
    AND Medal = 'Gold' AND Year >= 2000
  GROUP BY Year, Country)

SELECT
  -- Return the max medals earned so far per country
  year,
  country,
  medals,
  max(medals) OVER (PARTITION BY country
                ORDER BY year ASC) AS Max_Medals
FROM Country_Medals
ORDER BY Country ASC, Year ASC;
```


## Sliding Windows
- window functions  can also be used to calculate information that changes with each subsequent row in a data set.
- Sliding windows are functions that perform calculations relative to the current row of a data set
- Always starts with ROWS BETWEEN or RANGE BETWEEN
- Frames (sliding window) enable you to change the behavior of a window function by defining what rows the window function takes as input.
- Frames allow you to restrict the rows passed as input to your window function to a sliding window for you to define the start and finish.
- Frames allow you to "peek" forwards or backward without first using the relative fetching functions, LAG and LEAD, to fetch previous rows' values into the current row.

Adding a frame to your window function allows you to calculate "moving" metrics, inputs of which slide from row to row.

![image](https://user-images.githubusercontent.com/47908891/216981264-8565caf2-2399-4327-8359-38404975c492.png)

![image](https://user-images.githubusercontent.com/47908891/219935509-2cdb4aee-c3f8-44d5-80a5-3fc28a93a190.png)


![image](https://user-images.githubusercontent.com/47908891/216981432-c9442eaf-d29e-4970-b713-d8c15012355e.png)

![image](https://user-images.githubusercontent.com/47908891/216981536-fc57b548-f767-4576-9927-571fd4597e85.png)

- here the max is chaning in the max_medals_last column as the data is compared between previous row and current row

![image](https://user-images.githubusercontent.com/47908891/219935578-2bb38d80-d97d-46c8-b2d7-c1bcb0a51e8e.png)


```sql
SELECT
  -- Select each year's medals
  year,
  Medals,
  -- Get the max of the current and next years'  medals
  max(Medals) OVER (ORDER BY year ASC
             ROWS BETWEEN current row
             AND 1 following) AS Max_Medals
FROM Scandinavian_Medals
ORDER BY Year ASC;

SELECT 
	date,
	home_goal,
	away_goal,
    -- Create a running total and running average of home goals
    sum(home_goal) over(ORDER BY date 
         ROWS BETWEEN UNBOUNDED  PRECEDING AND CURRENT ROW) AS running_total,
    avg(home_goal) OVER(ORDER BY date 
         ROWS BETWEEN UNBOUNDED  PRECEDING AND CURRENT ROW) AS running_avg
FROM match
WHERE 
	hometeam_id = 9908 
	AND season = '2011/2012';
```

![image](https://user-images.githubusercontent.com/47908891/219935913-1be3a4a2-7665-4622-b416-8e5f7aadc4c5.png)

```sql
SELECT
  Year, Country, Medals,
  -- Calculate each country's 3-game moving total
  avg(medals) OVER
    (PARTITION BY country
     ORDER BY Year ASC
     ROWS BETWEEN
     2 preceding AND current row) AS Medals_MA
FROM Country_Medals
ORDER BY Country ASC, Year ASC;
```

### Range between
- considers duplicate as a same entity
- not generally preferred when compared to rows between

![image](https://user-images.githubusercontent.com/47908891/219936055-0c0e3ae6-a091-4334-90e5-8311f83a5786.png)



## Transform tables with window functions

### Pivot query Cross tab
- should import tablefunc
-
![image](https://user-images.githubusercontent.com/47908891/219937793-4c7f8321-06a5-4813-901c-51543eb1d817.png)

```sql
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
  SELECT
    Gender, Year, Country
  FROM Summer_Medals
  WHERE
    Year IN (2008, 2012)
    AND Medal = 'Gold'
    AND Event = 'Pole Vault'
  ORDER By Gender ASC, Year ASC;
-- Fill in the correct column names for the pivoted table
$$) AS ct (Gender VARCHAR,
           "2008" VARCHAR,
           "2012" VARCHAR)

ORDER BY Gender ASC;


```

```sql
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
  WITH Country_Awards AS (
    SELECT
      Country,
      Year,
      COUNT(*) AS Awards
    FROM Summer_Medals
    WHERE
      Country IN ('FRA', 'GBR', 'GER')
      AND Year IN (2004, 2008, 2012)
      AND Medal = 'Gold'
    GROUP BY Country, Year)

  SELECT
    Country,
    Year,
    RANK() OVER
      (PARTITION BY Year
       ORDER BY Awards DESC) :: INTEGER AS rank
  FROM Country_Awards
  ORDER BY Country ASC, Year ASC;
-- Fill in the correct column names for the pivoted table
$$) AS ct (Country VARCHAR,
           "2004" INTEGER,
           "2008" INTEGER,
           "2012" INTEGER)

Order by Country ASC;
```

### ROLLUP

- To calculate the group total and grand total together
- ROLLUP is a sub clause of GROUP BY
- it is hierarchical
![image](https://user-images.githubusercontent.com/47908891/219938174-b1d8b4a7-7689-453a-8ab9-5f534242d442.png)

![image](https://user-images.githubusercontent.com/47908891/219938197-693e1528-7bca-41af-a41a-0368fe73c8ea.png)

![image](https://user-images.githubusercontent.com/47908891/219938498-f39b3937-d70f-455f-9b17-cf8ba182c5bb.png)

### CUBE
- similar to rollup but not hierarchical

![image](https://user-images.githubusercontent.com/47908891/219938545-dcebccb9-6469-49af-b429-6e7702c91950.png)
![image](https://user-images.githubusercontent.com/47908891/219938575-e0e22e00-7e2b-4f80-9545-9325c492af37.png)
![image](https://user-images.githubusercontent.com/47908891/219938641-6042365a-1c33-4f80-85b6-f268a633d1e1.png)





