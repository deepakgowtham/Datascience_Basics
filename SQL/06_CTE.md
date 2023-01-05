# CTE
![image](https://user-images.githubusercontent.com/47908891/210717053-40379016-9d39-4091-b3e5-581aae382b49.png)
- Declare the CTE at the start of the query
- then use the CTE as a table in database where ever required.
- we can have multiple CTE's in a query seperated by commas

```sql
-- Set up your CTE
with match_list as (
    SELECT 
  		country_id, 
  		id
    FROM match
    WHERE (home_goal + away_goal) >= 10)
-- Select league and count of matches from the CTE
SELECT
    l.name AS league,
    COUNT(match_list.id) AS matches
FROM league AS l
-- Join the CTE to the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;
```

![image](https://user-images.githubusercontent.com/47908891/210723544-e72a712d-0dc1-4ca8-8b17-43f789711aff.png)

![image](https://user-images.githubusercontent.com/47908891/210723816-46a4fbff-0309-4dc9-adef-5df4c86df01c.png)

```sql
WITH home AS (
  SELECT m.id, m.date, 
  		 t.team_long_name AS hometeam, m.home_goal
  FROM match AS m
  LEFT JOIN team AS t 
  ON m.hometeam_id = t.team_api_id),
-- Declare and set up the away CTE
away as (
  SELECT m.id, m.date, 
  		 t.team_long_name AS awayteam, m.away_goal
  FROM match AS m
  LEFT JOIN team AS t 
  ON m.awayteam_id = t.team_api_id)
-- Select date, home_goal, and away_goal
SELECT 
	home.date,
    home.hometeam,
    away.awayteam,
    home.home_goal,
    away.away_goal
-- Join away and home on the id column
FROM home
INNER JOIN away
ON home.id = away.id;
```
