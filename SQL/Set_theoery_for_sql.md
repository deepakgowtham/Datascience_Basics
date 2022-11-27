# set theory for sql
3 operations can be performed
- Union, union all
- intersect
- Except

![image](https://user-images.githubusercontent.com/47908891/204124439-31f2fc55-583c-4333-b077-cfc79c20a1cb.png)

**The number of selected columns and data types must be identical in both the tables** <br>
**If we alias the first table the same alias is used for the second table as well as we stacking tables**

- The result is an unordered list 


## Union
- takes two tables as input and returns all the records that are present in both the tables
- if a record is present in both the table it is shown only once
- if a record is present in only one table it is shown

![image](https://user-images.githubusercontent.com/47908891/204124450-f685a380-c797-4030-9cfa-127b9ddf66cc.png)

**No on keyword is required for union as data is not checked, but is stacked on top on each other**

```sql
select * from economies2015    
union
select * from economies2019
ORDER BY code, year;

````
write the queries on either side of the operation first, and then call the set operator

### Union all
- includes duplicates
- if a record is present in both tables it is shown twice

```sql
select code, year from economies
union all
select country_code, year from populations
order by code,year

````
if country_code is used in orderby clause it will not work as we need to use the name from first table

## Intersect
- returns the record common to both tables.

![image](https://user-images.githubusercontent.com/47908891/204125014-5a64321f-0300-40fb-b89f-3955d8f23dc7.png)

- City names that are also country names.

```sql
select name from cities
intersect
select name from countries
```


### Comparing inner join and intersect
- if the left table had duplicates inner join will carry it to result where as uninon will not
- both have different use cases, care should be taken when choosing them

![image](https://user-images.githubusercontent.com/47908891/204125106-d3592996-4e06-4c38-8ed0-4c4b5ac2ea5f.png)

## Except
- Returns data present only in left table and not in right table

![image](https://user-images.githubusercontent.com/47908891/204125260-1fd8c1cf-696f-4d86-9272-47107e2731b3.png)

-cities that do not have the same name as a
```sql
select name from cities
except
select name from countries
ORDER BY name;
```





