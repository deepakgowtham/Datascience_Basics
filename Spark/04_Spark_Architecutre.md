# Master slave architecture

## master node/ header /driver /metadata /name node
- driver node splits the data into blocks based on block size and places in worker node
- creates block names and has the data file location
- default replication is 3
- by default data is stored in compressed format, with compression ratio of about 70 to 80%
  
## slave node /worker /data node

# HDFS 
- Write Once and Read Many times (WORM)
- divide big file into blocks and distribute , store multiple copies
- MapReduce - java processing system to read data from hdfs and process it

## Reading data in a distributed file system.

- the data read request is made by the dfs to the master node.
- master node returns the file name and location information.
- data is read from the slave node with location information provided.

## Writing data

- to write data the first the replication and block size is retrived from the master node.
- the data is written in the slave nodes
- then the ack containing the file information is sent to the master node.

  <img width="583" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/58800b91-a235-460e-b78e-5da9af122f3e">


# Map /Reduce
- works on disk for operations
- disk I/o for each step impacting performance.
  
<img width="565" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5326c66b-2404-4784-bde9-3488ac947ebd">

<img width="604" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/0852718d-6e4d-4df7-888d-35ec82feb4ed">

<img width="536" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c85be384-a20d-41f9-a16a-d8dc3f9b932f">

# Spark Components

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/95328270-3387-4b99-a3ce-89433662b85e">


- Spark core API
   API to interact with Python, sql, R, java, Scala languages.

# Architecture

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1e5a1025-3863-49be-be21-0df1a4d892ab)


Job  -> Stage -> Task

## Job
- a piece of code executed in spark is a job.
- Spark application is broken down into Jobs for each and every action
- 
## Stage
- a job is divided into stages
- stages are divided based on computational boundaries, computations that can be completed in a single step is placed together in a stage.
- Jobs are broken down into stages for every wider shuffle transformation
- A Stage is a collection of tasks that share the same shuffle dependencies, meaning that they must exchange data with one another during execution.
- Each stage is composed of one or more tasks that can be executed in parallel across multiple nodes in a cluster. Stages are executed sequentially, with the output of one stage becoming the input to the next stage.
- Stages are important because they allow Spark to perform parallel computation efficiently. By breaking down a job into stages, Spark can schedule tasks in a way that maximizes parallelism while minimizing the amount of data that needs to be shuffled between nodes. 

### Narrow stage
- Narrow stages are stages where the data does not need to be shuffled. Each task in a narrow stage operates on a subset of the partitions of its parent RDD. Narrow stages are executed in parallel and can be pipelined.

### Wide stage
- Wide stages are stages where the data needs to be shuffled across the nodes in the cluster. This is because each task in a wide stage operates on all the partitions of its parent RDD. Wide stages involve a data shuffle and are typically more expensive than narrow stages.

## Task

- One task per one Partition of data.
- one task on one partition is executed in one executor
- stages are broken into tasks.

