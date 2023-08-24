# Serialization and Deserialization
- when file is stored programatically it is serialized into byte codes
- byte codes cant read through text editor, has to be read programatically
- files are stored in db in serialized form

# Object storage.
- Store the file as is in native format.
- files are distributed in different physical nodes.
- doesnt suppport transaction
- can be accesssed using HTTPS interface

# Block storage.
- File is split and stored in fixed sized blocks
- Suitable for applications which require high IOPS, database and transactional data.
- should be accessed using a program
- better performance when compared to object storage.


# Distributed File system 

- can process mulitple process simultaneously.
- file should be stored in blocks
- default block size 128MB
- suitable for applications with high IOPS like database, analytic processing.
- in a scenario where there is a 100 Gb file, in DFS the 100GB file is split into 102400 mb /128  =800 blocks, depending on the number of compute resources present, we can process file simultaneously.
- in case if the file was processed as a single block it would take more time as it processed by a single compute process.
- if the number of compute resources are more it is called **massively parallel processing**

6vs
volume + velocity+ variety +veracity(who much we can trust the data or quality of data) + viablity (relavance + feasability or retention) = Value

# VCPU and cores

- in PC no of cores =4 and logical processors =8 means it can run 32 process or it has 32 vcpus
- in cloud compute 1 core = 1 process 2 cores cpu runs 2 v cpus

# File format

- ORC
- parquet
- avro

## ORC
- Optimized row columnar
- Column storage
- by default uses snappy compression in databricks
- Provides best compression when compared to other file formats
- orginated in hive platform

## parquet
- column storage
- data is stored in header(format information), body (data in encoded form), footer (index and metadata  as json)
- the schema information is present in JSON format in footer


## Avro
- row storage format
- mostly used in streaming applications like kafka sources.not preferred for storage as it is row based (slower read)
- data is stored in header(format information, schema as json), body (data in encoded form), footer (index )
- spark.read.format('avro') - direct api is not available for avio
- for column storage data spark job contains a step to convert from column to row(dataframe is displayed in row format)

<img width="485" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/46fadace-f0b4-4d20-aae2-f1ff9b26d64e">


## JSON
- semi structured
- web based api
- can be multi line json

## XML
- mostly middleware applications.

