# Basics

## Create RDD
```python
list_data =[1, 2, 3, 4]
rdd1= sc.parallelize (list_data)  # give python array as input or .
rdd2 =sc.parallelize (list_data, 4) # second argument is the number of partitions, default is 8
rdd_file  =sc.textFile('/location/filename') # read from text file, default partitions is 2

```

## print data
```python
rdd1.collect() #get data from all partitions and display
rdd1.top()
rdd1.take(5) # display first 5 values
rdd1.glom().collect() # glom display data partition wise
 
```

## partition info

rdd_file.getNumPartitions()


## Save to target

rdd.saveAsTextFile()
