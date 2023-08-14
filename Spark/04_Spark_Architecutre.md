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

