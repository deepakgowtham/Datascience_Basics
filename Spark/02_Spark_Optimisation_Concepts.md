# Monotonically increasing IDs
## Disadv of sequential ids in distributed computing.
- Relational databases tend to have a field used to identify the row, whether it is for an actual relationship reference, or just for data identification.
- These IDs are typically an integer that increases in value, is sequential, and most importantly unique.
- The problem with these IDs is they're not very parallel in nature. Given that the values are given out sequentially, if there are multiple workers, they must all refer to a common source for the next entry.
- This is OK in a single server environment, but in a distributed platform such as Spark, it creates some undue bottlenecks.


  - Spark has a built-in function called monotonically_increasing_id(), designed to provide an integer ID that increases in value and is unique. These IDs are not necessarily sequential - there can be gaps, often quite large, between values
  
<img width="353" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/bfd44c34-2aeb-46e9-b651-6ebcaec10070">

- Unlike a normal relational ID, Spark's is completely parallel - each partition is allocated up to 8 billion IDs that can be assigned. Notice that the ID fields in the sample table are integers, increasing in value, but are not sequential. It's a little out scope, but the IDs are a 64-bit number effectively split into groups based on the Spark partition. Each group contains 8.4 billion IDs, and there are 2.1 billion possible groups, none of which overlap.

```python
# Select all the unique council voters
voter_df = df.select(df["VOTER NAME"]).distinct()

# Count the rows in voter_df
print("\nThere are %d rows in the voter_df DataFrame.\n" % voter_df.count())

# Add a ROW_ID
voter_df = voter_df.withColumn('ROW_ID', F.monotonically_increasing_id())

# Show the rows with 10 highest IDs in the set
voter_df.orderBy(voter_df.ROW_ID.desc()).show(10)
```
**The id generated here depends on the number of partitions in the dataframe**
  - Once you define a Spark process, you'll likely want to use it many times. Depending on your needs, you may want to start your IDs at a certain value so there isn't overlap with previous runs of the Spark task.

```python
# Determine the highest ROW_ID and save it in previous_max_ID
previous_max_ID = voter_df_march.select('ROW_ID').rdd.max()[0]

# Add a ROW_ID column to voter_df_april starting at the desired value
voter_df_april = voter_df_april.withColumn('ROW_ID', F.monotonically_increasing_id() + previous_max_ID)

# Show the ROW_ID from both DataFrames and compare
voter_df_march.select('ROW_ID').show()
voter_df_april.select('ROW_ID').show()
```

# Caching.
- Caching in Spark refers to storing the results of a DataFrame in memory or on disk of the processing nodes in a cluster.
- Caching improves the speed for subsequent transformations or actions as the data likely no longer needs to be retrieved from the original data source. Using caching reduces the resource utilization of the cluster
- there is less need to access the storage, networking, and CPU of the Spark nodes as the data is likely already present

## Disadv of caching
- There are a few disadvantages of caching you should be aware of. Very large data sets may not fit in the memory reserved for cached DataFrames. Depending on the later transformations requested, the cache may not do anything to help performance. If a data set does not stay cached in memory, it may be persisted to disk. Depending on the disk configuration of a Spark cluster, this may not be a large performance improvement. If you're reading from a local network resource and have slow local disk I/O, it may be better to avoid caching the objects. Finally, the lifetime of a cached object is not guaranteed. Spark handles regenerating DataFrames for you automatically, but this can cause delays in processing.

  <img width="523" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/96308d9b-ae5b-476a-850e-94b35a03c1b9">

  ## How to cache
  - use the .cache() method in dataframe before an action.

```python
df.cache.count()

df =df.cache()
df.show()
# to check if df is cached
df.is_cached

#to uncache
df.unpersist()
```
# Improve load time
- More obects to read is better than reading few larger file objects as multiple process can act on it simultaneously
- If the objects are of same size spark will perform better when compared to few large and few very small files
- Schema predefined will reduce import time and also provide import validation.

# Configuration options
- Type of clusters
- single node
- stand alone - managed 
- managed - managed by third party app like(yarn, mesos kubernetes,)
 ```python
spark.conf.get()
spark.conf.set()
# Name of the Spark application instance
app_name = spark.conf.get('spark.app.name')

# Driver TCP port
driver_tcp_port = spark.conf.get('spark.driver.port')

# Number of join partitions
num_partitions = spark.conf.get('spark.sql.shuffle.partitions')
```
- driver is responsible for task assignment, result consolidation, shared data access
- so double memory for driver when compared to executos
- fast local storage
- More worker nodes often better when compared to large worker


# Performance imporovements.
df.explain()

## Limit shuffling
- limit use of .repartition() and use .coalesce()
## Broadcast

- when use join() use broadcast()

  <img width="401" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6d6bd307-7f17-477f-99ad-fca5361df99d">
  
- When we have one larger dataframe and one smaller dataframe to join, Broadcast the smaller DataFrame. The larger the DataFrame, the more time required to transfer to the worker nodes.
- broadcast will make operation slower for very small data frames. On small DataFrames, it may be better skip broadcasting and let Spark figure out any optimization on its own.
- If you look at the query execution plan, a **broadcastHashJoin** indicates you've successfully configured broadcasting.
```python
from pyspark.sql.functions import broadcast
broadcast_join_df= flights_df.join(broadcast(airports, flights_df['dest'] ==airports['IATA']))
```
