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

- Creating the connection is as simple as creating an instance of the `SparkContext` class
- The class constructor takes a few optional arguments that allow you to specify the attributes of the cluster you're connecting to.
- An object holding all these attributes can be created with the `SparkConf()`constructor.


```python
print(sc) # verify that there's a SparkContext in your environment.

print(sc.version)
```


- Spark's core data structure is the `Resilient Distributed Dataset (RDD)`. This is a low level object that lets Spark work its magic by splitting data across multiple nodes in the cluster. However, RDDs are hard to work with directly, so the Spark DataFrame abstraction built on top of RDDs.
- The Spark DataFrame was designed to behave a lot like a SQL table
- with Spark DataFrames, you first have to create a `SparkSession` object from your `SparkContext`.
- You can think of the SparkContext as your connection to the cluster and the SparkSession as your interface with that connection.
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

## To Pandas
- Convert pyspark to pandas dataframe
```python
query = "SELECT origin, dest, COUNT(*) as N FROM flights GROUP BY origin, dest"
flight_counts = spark.sql(query)
pd_counts = flight_counts.toPandas()
```

