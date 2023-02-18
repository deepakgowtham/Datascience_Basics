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
## Differences in window function
- window functions are processed after the entire query except the final ORDER BY statement. Thus, the window function uses the result set to calculate information, as opposed to using the database directly.
-  it's important to know that window functions are available in PostgreSQL, Oracle, MySQL, but not in SQLite.
- Unlike GROUP BY results, window functions don't reduce the number of rows in the output.
- Window functions can fetch values from other rows into the table, whereas GROUP BY functions cannot.
- Window functions can calculate running totals and moving averages, whereas GROUP BY functions cannot.

## OVER with a partition
- Partition results over a particular column(category)
- calculate different aggregate values within one column of data, and pass them down a data set, instead of having to calculate them in different columns.
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
## Sliding Windows
- window functions can also be used to calculate information that changes with each subsequent row in a data set.
- Sliding windows are functions that perform calculations relative to the current row of a data set

![image](https://user-images.githubusercontent.com/47908891/216981264-8565caf2-2399-4327-8359-38404975c492.png)

![image](https://user-images.githubusercontent.com/47908891/216981432-c9442eaf-d29e-4970-b713-d8c15012355e.png)

![image](https://user-images.githubusercontent.com/47908891/216981536-fc57b548-f767-4576-9927-571fd4597e85.png)

```sql
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
