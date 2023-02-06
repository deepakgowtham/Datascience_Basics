# Window Fucntions
- If we need to columns that are not aggregate, we need to use subquery but instead of that we can use window function
![image](https://user-images.githubusercontent.com/47908891/213381331-2c65a47e-d113-4c03-9f49-9a7f3959c5da.png)

Non Aggregate column

![image](https://user-images.githubusercontent.com/47908891/213380448-b876c61e-a522-4193-8158-f93e84c79e9b.png)

We usually subqueries for this

![image](https://user-images.githubusercontent.com/47908891/213381495-5ffc242e-79eb-47b3-ab91-38cb466eb481.png)
- Unlike a subquery in SELECT, your window function will apply the filter that you include in your WHERE clause
## Over Clause 
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
- 

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


