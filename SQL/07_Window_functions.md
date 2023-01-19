# Window Fucntions
- If we need to columns that are not aggregate, we need to use subquery but instead of that we can use window function
![image](https://user-images.githubusercontent.com/47908891/213381331-2c65a47e-d113-4c03-9f49-9a7f3959c5da.png)

Non Aggregate column

![image](https://user-images.githubusercontent.com/47908891/213380448-b876c61e-a522-4193-8158-f93e84c79e9b.png)

We usually subqueries for this

![image](https://user-images.githubusercontent.com/47908891/213381495-5ffc242e-79eb-47b3-ab91-38cb466eb481.png)

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

## Differences in window function
- window functions are processed after the entire query except the final ORDER BY statement. Thus, the window function uses the result set to calculate information, as opposed to using the database directly.
-  it's important to know that window functions are available in PostgreSQL, Oracle, MySQL, but not in SQLite.
- 
