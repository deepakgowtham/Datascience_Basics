# Master slave architecture

## master node/ header /driver /metadata /name node
- driver node splits the data into blocks based on block size and places in worker node
- creates block names and has the data file location
- default replication is 3
- by default data is stored in compressed format, with compression ratio of about 70 to 80%
  
## slave node /worker /data node

## HDFS 
- Write Once and Read Many times (WORM)
- divide big file into blocks and distribute , store multiple copies
- MapReduce - java processing system to read data from hdfs and process it
