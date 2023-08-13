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
