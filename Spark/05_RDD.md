# Basics
- Resilient Distributed Datasets
- Two types
- 1. Parallelized scala collections
  2. Hadoop datasets
## Create RDD
```python
list_data =[1, 2, 3, 4]
rdd1= sc.parallelize (list_data)  # give python array as input or .
rdd2 =sc.parallelize (list_data, 4) # second argument is the number of partitions, default is 8
rdd_file  =sc.textFile('/location/filename') # read from text file, default partitions is 2

```

## Print data
```python
rdd1.collect() #get data from all partitions and display
rdd1.top()
rdd1.take(5) # display first 5 values
rdd1.glom().collect() # glom display data partition wise
 
```

## Partition info

rdd_file.getNumPartitions()


## Save to target

rdd.saveAsTextFile()
rdd.saveAsPickleFile()
rdd_pickle =sc.pickleFile() 

## Transformation
### Map
- apply a function to each element in the rdd
- map is a narrow transformation
- return a new distributed dataset formed by passing each element of the source through a function func
```python
map(func) #pass a function as arugment.
rdd2 =rdd1.map(lambda a:a+10)
```


### Filter
- filter(func)
- return a new dataset formed by selecting those elements of the source on which the func returns true

```python
even_rdd =rdd2.filter(lambda a:a%2 ==0) # check for every element if mod 2 is zero
```
## Wide transformation
Union - same as union all - Narrow
Intersect - inner join  - wide
subtract - a-b = remove common data and save only data from A - wide

<img width="391" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/23f65d26-62d8-4059-8f2f-1dea8455ebe3">

