DW design or dimension modeling

<img width="385" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1e06641d-70d7-4f9d-bcc2-49ddd34fda0a">

# Principles of Dimensionality

To make data driven decision we need
- one or more measurements.
- Dimensional context for each measurement.

<img width="449" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ec2c98f1-516d-4ade-a6eb-68a3adc94fef">


<img width="454" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5f9e05af-e141-4136-b06c-7609491e5b35">

<img width="431" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/2c360bf1-86e6-44d6-931e-f25145f072a3">

Dimensional Context most often answer question by ? and for?

<img width="425" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/bdfb983c-11fa-49be-8318-42de07ae28a6">

<img width="444" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7f1d33a5-f047-4836-9e64-79d3abe7979e">

<img width="422" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/98e787de-c709-4e63-99ab-4e9fe383982a">

**If we organize data by measurements, filtered and grouped by context it will help us to make data driven decisions.**

- OLAP is key part of BI, OLAP means dimensional analysis.
- Dimensional analysis is done using dimensional data.
- Dimensional data means = facts, dimensions, fact tables and dimension tables.
# Facts
- Measurements = Facts
- **Numeric** and quantifiable
- Mostly a metric
- Logical fact not equal to Data warehouse fact
- Facts are stored in fact table
- Fact is not equal to Fact table
# Dimension
- context for a fact = dimension
  
<img width="444" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/02de5faf-9266-4227-8f0d-fbb18c65fcd8">

## Hierachical vs flat dimension.
- Dimension having a hierarchy
- here faculty dimension has a defined hierarchy where as student table doesnt fit in any of this hierarchy
![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/14ebe23e-9569-437f-bcaf-5640f8f8b37e)


# Dimension tables
 - Provide key data warehousing subject areas.
 - subject areas that provide context to measurements.
 - all or most meaningful information.
 - one-stop shop for the dimensional subject.
# Types of dimension tables
1. Junk Dimension table  
2. Conformed Dimension table (commonly used)
3. Degenerate Dimension table
4. Rapidly changing Dimension table
5. Role playing Dimension table
6. Inferred Dimension table
7. Shrunken dimension table
8. static Dimension table
9. Slow changing dimension table. (commonly used)

## Junk Dimension table
-  A single table includes a compilation of unrelated and different attributes
-  often generated to handle foreign keys generated by rapidly changing dimensions.
-  Mostly contains boolean or flags 

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a7274006-b83b-4ea0-8cef-5c051e2a73f2">

## Conformed Dimension table
- Conformed dimension connects multiple fact tables
- Dimension table used in more than one dimension model.
- consistent analysis of different business process

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6a1887b4-2d61-4e77-a221-2d13a2c04a47">

## Degenerate Dimension table
- a special dimension table  with invoice number, check number that is an identifier
- it does not have important attributes like name, as they are already part of other dimensions
- Looks like fact table but actually dimension table
- eg sales header (degenerate dim), sales line (fact)

## Rapidly changing dimension table
- used to store attributes that is changing frequently.
- SCD type 2 will be difficult to implement as new rows added will make table size very large

## Role playing Dimension table
- a dimension table that acts as multiple dimension.
- mulitple foriegn keys in fact table and acts differently for each key attribute.
- eg  date, ship date, due date, order date 

<img width="122" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/dbeb1035-27aa-4c31-afc7-7df80365f02c">

## Static Dimension table
- Dimension table that is prepared in data warehouse and is not available at source.
- the data is prepared once and does not change as it is not present at source
- Eg. type of source table

<img width="401" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/15602509-4d79-4453-93ea-df3cf3b44ad9">

# Inferred dimension table
- in a scenario where fact table has to be loaded first before dimension data, we assume some data to the dimension table and load the fact table.
- create a surrogate key with a null  value for entire other attributes.
- also called as early coming fact or late arrival dimension


## Shrunken dimension table.
- subset for other dimension.
- time could be shrunken into hours dimension, minute dimension, second dimension.


# Star vs Snowflake
- We represent fact and dimensions in either Star schema or snowflake schema
## Star Schema
- In star schema we put all the 3 information about product in a single dimension table called Product hierarchy dimension table.
- 3 dimension(from same hierarchy) in 1 dimension table
<img width="451" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b4f828cb-1ffd-4b4f-bd1a-c9ef5c3613e5">
<img width="472" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/296fd23c-2b95-4edf-a1f2-f851849681e5">

## Snowflake Schema
- 3 dimension = 3 dimension table
<img width="452" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/55cc3fce-9d30-4f7b-9e97-6f784d0144bb">
<img width="464" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/2d3b3b54-4353-4ced-91f1-d9978346fd8a">

**Both start and snowflake has same data but represented in different forms.**

<img width="461" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/2a0196eb-fe99-45ba-a30d-799abd52c197">
<br>
<img width="464" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/488f56a4-0f3f-432d-b2b5-327fd3be1521">

# Forms of Additivity
 A datawarehouse fact can be
 1. Additive  Fact == can be added under all circumstances eg. Salary. here we can add veritically salary of all employees
  <img width="288" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a47b0a2d-45d3-4b7f-88c4-eefef2854b1e">
  
also horizontally salary of same person across time
    
  <img width="467" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/186c1381-f4a1-4acf-9f5b-fe0bc4f24f6e">

  3. Non- Additive - example GPA we cant add GPA of all the students in class, ratios, calculated Average.
     - For a Non additive fact store the underlying component (eg. marks) in fact tables.
     - we can also store the non- additive fact as an additional row for easy access.
      
  4. Semi- Additive
     - we can add them sometimes but cannot add them other times.


# Database Keys.
## Primary Key
  - unique key
 
## foreign Key
  - some other table's primary
  - used to denote logical relationship

  <img width="446" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/59be0bfa-9d48-4df1-9acc-952bf79f5e42">

## Natural Key
  - Might be cryptic (roll_no, employee_id) or might be undestandable (department name, job role)
  - They are not generated in data warehouse, they travel from the source system with the data
## Surogate key
 - No business meaning, but simply generated in random
 - Usually a cryptic, but not same as natural key
 - Generated by the database itself or using a supplemental key management system.
 - Preferred over a natural key in data warehouse
 - should be used for the primary keys of the dimension tables
 - In below example Faculty_key is the surrogate key that is generated. usually used with _key in column name.

<img width="400" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ce867c2f-56f6-4109-84a3-ba3b0bc41c70">


<img width="466" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/868e1530-9f35-493d-a8d5-3d8667d19296">
<br>
<img width="495" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7ace79f9-7547-4f77-9c20-25a0a3921007">

# PTR
- Data in user access layer should be structured dimensionaly (Fact table and dimension table)
- Fact and dimension tables provide the foundation for the user access layer, and supply the dimensionality

# Faculty dimension  table 
## In Star schema

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/88527114-ac54-4ee2-95f4-22b690848c4e">


Here though there are 3 natural keys Faculty_id, Dept_id, college_id we are using the faculty_key which is a surrogate key for the dimension table.

## In snowflake schema.
  
  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/91ca49fc-9b53-4031-9502-2db78569c7b3">

- Each table has its own primary key (surogate key) though there is natural key present.
- We will also have foreign key connecting to higher level
- the college_Dim will not have foreign key because there is no higher level
- the dimension table is arranged in a hierarchy starting from lower level to higher



<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/d5907514-d817-44a9-bc35-d396cc4b9ce1">

## Example 2

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/d08d1f54-3150-4de3-9f1f-4189c62791ba">

- Fact table with split dimension here month can be part of Fiscal calender or Academic calender.
- When branching is involved at the branching table we will have foreign key of both the tables in the higher dimension.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/98aa5a47-24ce-409f-b9d2-e033c0edd6eb">

  
  
