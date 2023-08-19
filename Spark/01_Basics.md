# Spark Basics
- Spark is a distriuted computing library from Apache.
- key big data distributed processing frameworks
- An Apache Spark application consists of two main components: a driver, which converts the user's code into multiple tasks 
that can be distributed across worker nodes, and executors

## Intro

- The first step in using Spark is connecting to a cluster.
- In practice, the cluster will be hosted on a remote machine that's connected to all other nodes.
- There will be one computer, called the master that manages splitting up the data and the computations.
- The master is connected to the rest of the computers in the cluster, which are called worker. 
- The master sends the workers data and calculations to run, and they send their results back to the master.

## Spark Architecture
- A Spark Application consists of a Driver Program and a group of Executors on the cluster. The Driver is a process that executes the main program of your Spark application and creates the SparkContext that coordinates the execution of jobs (more on this later). The executors are processes running on the worker nodes of the cluster which are responsible for executing the tasks the driver process has assigned to them.

![image](https://user-images.githubusercontent.com/47908891/237017661-f8f01353-f3ea-4147-8aee-3d4678952df8.png)



The cluster manager (such as Mesos or YARN) is responsible for the allocation of physical resources to Spark Applications.

- Creating the connection is as simple as creating an instance of the `SparkContext` class
- The class constructor takes a few optional arguments that allow you to specify the attributes of the cluster you're connecting to.
- An object holding all these attributes can be created with the `SparkConf()`constructor.
### Difference between spark Context and Spark Session.
- Every Spark Application needs an entry point that allows it to communicate with data sources and perform certain operations such as reading and writing data. In Spark 1.x, three entry points were introduced: **SparkContext, SQLContext and HiveContext. Since Spark 2.x, a new entry point called SparkSession has been introduced that essentially combined all functionalities available in the three aforementioned contexts.** Note that all contexts are still available even in newest Spark releases, mostly for backward compatibility purposes.


Since Spark 2.x+, tow additions made HiveContext redundant:

a) SparkSession was introduced that also offers Hive support

b) Native window functions were released and essentially replaced the Hive UDAFs with native Spark SQL UDAFs(User-Defined Aggregate Functions)

- [Reference article](https://towardsdatascience.com/sparksession-vs-sparkcontext-vs-sqlcontext-vs-hivecontext-741d50c9486a)

```python
print(sc) # verify that there's a SparkContext in your environment.

print(sc.version)
```

- Creating multiple SparkSessions and SparkContexts can cause issues, so it's best practice to use the SparkSession.builder.getOrCreate() method. This returns an existing SparkSession if there's already one in the environment, or creates a new one if necessary!

```python
from pyspark.sql import SparkSession
my_spark = SparkSession.builder.getOrCreate()
print(my_spark)
```
- SparkSession has an attribute called catalog which lists all the data inside the cluster. This attribute has a few methods for extracting different pieces of information.
```python
print(spark.catalog.listTables())
```

- Spark's core data structure is the `Resilient Distributed Dataset (RDD)`. This is a low level object that lets Spark work its magic by splitting data across multiple nodes in the cluster. However, RDDs are hard to work with directly, so the Spark DataFrame abstraction built on top of RDDs.
- The Spark DataFrame was designed to behave a lot like a SQL table

## Basics
- Print the first few lines in the dataframe
```python
df.show() 
```
### Filter method
- Spark counterpart of SQL's WHERE clause. The .filter() method takes either an expression that would follow the WHERE clause of a SQL expression as a string, or a Spark Column of boolean (True/False) values.

```python
flights.filter("air_time > 120").show()
flights.filter(flights.air_time > 120).show() # boolean values


# Remove missing values
model_data = model_data.filter("arr_delay is not NULL and dep_delay is not NULL and air_time is not NULL and plane_year is not NULL")


```

## To Pandas
- Convert pyspark to pandas dataframe
```python
query = "SELECT origin, dest, COUNT(*) as N FROM flights GROUP BY origin, dest"
flight_counts = spark.sql(query)
pd_counts = flight_counts.toPandas()
```

## Pandas To Spark

- .createDataFrame() takes a pandas Dataframe and returns a spark Dataframe
-  **The output of this method is stored locally, not in the SparkSession catalog. This means that you can use all the Spark DataFrame methods on it, but you can't access the data in other contexts.**
-  a SQL query (using the .sql() method) that references your DataFrame will throw an error. To access the data in this way, you have to save it as a temporary table.
-  **.createTempView()** Spark DataFrame method, which takes as its only argument the name of the temporary table you'd like to register. Creates a local temporary view with this DataFrame.The lifetime of this temporary table is tied to the SparkSession that was used to create this DataFrame
-  **.createOrReplaceTempView()**. This safely creates a new temporary table if nothing was there before, or updates an existing table if one was already defined

![image](https://user-images.githubusercontent.com/47908891/230019422-91e69a77-e4d7-406a-97fd-93f8ac35e9e2.png)


```python
# Create pd_temp
pd_temp = pd.DataFrame(np.random.random(10))

# Create spark_temp from pd_temp
spark_temp = spark.createDataFrame(pd_temp)

# Examine the tables in the catalog
print(spark.catalog.listTables())

# Add spark_temp to the catalog
spark_temp.createOrReplaceTempView('temp')

# Examine the tables in the catalog again
print(spark.catalog.listTables())
```

## Read a csv file directly

```python
airports = spark.read.csv(file_path, header=True)
```

## Read from Table in catalog.
- spark.table('flights') creates a DataFrame containing the values of the flights table in the .catalog

```python
flights = spark.table('flights')
```

## withColumn() and select()
### withColumn()

- .withColumn() method takes two arguments, First, a string with the name of your new column, and second the new column itself.
- Spark DataFrame is immutable columns can't be updated in place.
- so withColumn() and similar methods return a new dataframe, to overwrite a column we must reassign the returned DataFrame

```python
flights = flights.withColumn('duration_hrs', flights.air_time/60)
model_data = model_data.withColumn("plane_age", model_data.year - model_data.plane_year)

# Add a new column called splits separated on whitespace
voter_df = voter_df.withColumn('splits', F.split(voter_df.VOTER_NAME, '\s+'))

# Create a new column called first_name based on the first item in splits
voter_df = voter_df.withColumn('first_name', voter_df.splits.getItem(0) )

# Get the last entry of the splits list and create a column called last_name
voter_df = voter_df.withColumn('last_name', voter_df.splits.getItem(F.size('splits') - 1))

# Drop the splits column
voter_df = voter_df.drop('splits')

# Show the voter_df DataFrame
voter_df.show()
```
### select()

- This method takes multiple arguments - one for each column you want to select. These arguments can either be the column name as a string (one for each column) or a column object (using the df.colName syntax). When you pass a column object, you can perform operations like addition or subtraction on the column to change the data contained in it, much like inside .withColumn()

```python
selected1 = flights.select("tailnum", "origin", "dest")
selected2 =flights.select(["tailnum", "origin", "dest"])
temp = flights.select(flights.origin, flights.dest, flights.carrier)
```

### Difference
-  The difference between .select() and .withColumn() methods is that .select() returns only the columns you specify, while .withColumn() returns all the columns of the DataFrame in addition to the one you defined


## Alias 
-  rename a column you're selecting
```python
flights.select((flights.air_time/60).alias("duration_hrs"))
```

## selectExpr()
-  takes SQL expressions as a string
-  we can rename columns without the alias 
```python
flights.selectExpr("air_time/60 as duration_hrs")
```

## Group by and aggregation
- Using group by only to aggregate
```python
# Find the shortest flight from PDX in terms of distance
flights.filter(flights.origin == 'PDX').groupBy().min('distance').show()

# Find the longest flight from SEA in terms of air time
flights.filter(flights.origin=='SEA' ).groupBy().max('air_time').show()

# Average duration of Delta flights
flights.filter(flights.carrier == "DL").filter(flights.origin == "SEA").groupBy().avg("air_time").show()

# Total hours in the air
flights.withColumn("duration_hrs", flights.air_time/60).groupBy().sum("duration_hrs").show()
```
- Group by

```python
flights.groupBy("tailnum").count().show()
flights.groupBy('origin').avg('air_time').show()
```
- GroupBy by using functions
- .agg() method lets you pass an aggregate column expression that uses any of the aggregate functions from the pyspark.sql.functions submodule

```python
import pyspark.sql.functions as F
flights.groupBy('month', 'dest').agg(F.stddev('dep_delay')).show()
```

## withColumnRenamed()
- first arguement the column to be renamed, new name
```python
airports = airports.withColumnRenamed('faa','dest')
```

## Join()

```python
flights.join(airports, on='dest', how='leftouter')
```
## Cast()
- used to assign proper data types

### Data Types
- Numberic
  1. Integer
  2. Double

- can be used in combination with withColumn()
- that .cast() works on columns, while .withColumn() works on DataFrames.

```python
model_data = model_data.withColumn("arr_delay", model_data.arr_delay.cast('integer'))

#another way

from pyspark.sql.functions import col

newdf =csvdf.withColumn('requests', col('requests').cast('string'))
```


## SparkUDF
- Define a function
- wrap the function and store it in a variable for later use. We'll use the pyspark.sql.functions.udf() method. It takes two arguments - the name of the method you just defined, and the Spark data type it will return. This can be any of the options in pyspark.sql.types, and can even be a more complex type, including a fully defined schema object. 
- Specify the datatype of return of the user defined function.
- store the udf using a name

```python
def getFirstAndMiddle(names):
  # Return a space separated string of names
  return ' '.join(names[:-1])

# Define the method as a UDF
udfFirstAndMiddle = F.udf(getFirstAndMiddle, StringType())

# Create a new column using your UDF
voter_df = voter_df.withColumn('first_and_middle_name', udfFirstAndMiddle(voter_df.splits))

# Show the DataFrame
voter_df.show()
```

### Another way to register udf
```python
spark.udf.register('udfname', custom_func, StringType())

```

### Disadv of UDF
- Pyspark internally converts pyspark code to java code
 1. catlyst optimizer doesnt understand the custom function.
 2. in addition to JVM the udf code also requires python workers in each executor node.


# Repartition vs Coalesce vs partitionby
## Repartition
- can be used for increasing or decreasing partitions
- recreate new partitions from scratch and perform shuffle to move data
- creates unbalanced partitions or may contain empty partition.
- Wide transformation

## Coalesce 
- can be only to decrease partitions
- combine nearby partitions or adjust using existing partitions
- cannot create new partitions
- creations balanced partitions
- Narrow transformation

## PartitionBy
- partition based on condition or using a categorical column
