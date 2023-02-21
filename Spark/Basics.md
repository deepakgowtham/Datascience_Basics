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
