# Case statements in sql

##  Case statement
- Form a new categorical column based on the values present in other column
- similar to if else statement
- results are stored in a new variable (column)
- In some case can be used instead of join as it is more efficient to identify more than one columns at a time.

![image](https://user-images.githubusercontent.com/47908891/206720716-0431a04c-6623-4a76-a3a1-42bfabc3dcdb.png)


```sql

SELECT 
	case when hometeam_id = 10189 then 'FC Schalke 04'
        when hometeam_id = 9823 then  'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
	COUNT(id) AS total_matches
FROM matches_germany
GROUP BY home_team;
```
### CASE statements comparing column values
```sql
SELECT 
	m.date,
	t.team_long_name AS opponent,
    -- Complete the CASE statement with an alias
	case when m.home_goal > m.away_goal then 'Barcelona win!'
        when m.home_goal < m.away_goal then 'Barcelona loss :(' 
        else 'Tie' end as outcome 
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.awayteam_id = t.team_api_id
-- Filter for Barcelona as the home team
WHERE m.hometeam_id = 8634; 
```
## Adding Logical test to case 
![image](https://user-images.githubusercontent.com/47908891/208030094-4ee86f6e-11d8-44d0-8427-70bc0adef211.png)
- If we dont use the where condition in the above query then matches of all the other teams will considered as Loss or Tie

mulitple case statements together.
```sql
SELECT 
	date,
	-- Identify the home team as Barcelona or Real Madrid
	case when hometeam_id = 8634 then 'FC Barcelona' 
        else 'Real Madrid CF' end as home,
    -- Identify the away team as Barcelona or Real Madrid
	case when awayteam_id = 8634 then 'FC Barcelona' 
        else 'Real Madrid CF' end as away
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);
```
Combining multiple case statements again.
```sql
SELECT 
	date,
	CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as home,
	CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
         ELSE 'Real Madrid CF' END as away,
	-- Identify all possible match outcomes
	case when home_goal > away_goal and hometeam_id = 8634 then 'Barcelona win!'
        WHEN home_goal > away_goal and hometeam_id = 8633 then 'Real Madrid win!'
        WHEN home_goal < away_goal and awayteam_id = 8634 then 'Barcelona win!'
        WHEN home_goal < away_goal and awayteam_id = 8633 then 'Real Madrid win!'
        else 'Tie!' end as outcome
FROM matches_spain
WHERE (awayteam_id = 8634 OR hometeam_id = 8634)
      AND (awayteam_id = 8633 OR hometeam_id = 8633);
```


## Focusing on Else clause
- if we dont mention any else condition the entries that dont meet the criteria are stored as null
Both the below queries produce identical results where null is included in the result for values which dont match the condition.
![image](https://user-images.githubusercontent.com/47908891/208030679-d200d92e-ac50-4e1c-9d1e-5572a29cb547.png)

- Should the else clause contain null or should it filter and leave the data which is null??
- To filter the null values we can use the entire case statement in where clause without the alias 
- here we dont need to filter the teams by id as well
![image](https://user-images.githubusercontent.com/47908891/208035315-dd64719d-f9cd-4c41-97e7-13a1a0817b10.png)
- we need to add **end is not null** to remove the null entries

## Case statement with Aggregate Functions






