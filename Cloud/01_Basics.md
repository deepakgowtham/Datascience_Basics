# Data center

<img width="473" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a86a77da-003a-4974-8a62-01f8be93d099">

Geography : India <br>
Regions : Central India, India south Central, South India <br>
Location : Chennai <br>
Availability zone : within a region there will be multiple availablity zone <br>

[Availability zone helpful link ](https://k21academy.com/microsoft-azure/az-900/az-900-microsoft-azure-architecture-region-availability-zone-geography/)


- Many Azure regions provide availability zones, which are separated groups of datacenters within a region. Availability zones are close enough to have low-latency connections to other availability zones. They're connected by a high-performance network with a round-trip latency of less than 2ms.
- data will be stored parallelly in different zones.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/96fbe6d5-6e0f-4282-a801-cc616e1ca95e)

- inside each zone there will be RAC's and inside RAC there will be clusters.
- load balancing between zones is automatically taken care for zonal redundent resources
- Datacenter is placed in different **region** and **Geographies**
- Regions are geographies containing more than one datacenters.
- Geographies are defined by Geopolitical boundries, compliance needs
   1. Americas
   2. Europe
   3. Asia pacific
   4. Middle East

## Redundancy
<img width="323" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/11e82d84-6a72-4307-bbc2-be035a0b21fc">

<img width="547" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f6f7262c-f5b9-487d-beb1-98ae58a05a03">

<img width="834" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a2878909-76a1-4f2d-ad0f-a36748e24f3a">

Files will be synced asynchrously between regions/zones

# Service types

<img width="769" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c6075588-72bb-47e8-a9ea-786242389a41">

# Scaling
- Vertical scaling - Increasing the capacity of the individual machine
- Horizontal scaling  - adding additional machines to increase compute capacity.
- Auto scaling - Automatically increase compute capacity depending on need, traffic, and memory utilization.
    1. scaling out - Adding more servers
    2. Scaling in - remove servers
 

# Types of Cloud servers

##Virtual Machines

## Containers
- indedendent consistent and isolated execution environment 
- they dont require any os as they just contain minimum dependencies to run the app
<img width="239" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/8ee23eb5-7016-4e71-b702-ff933a8c1f7e">

## Serverless 
- ability to run an application without creating, configuring nor maintaining a server.
- break application into different smaller pieces


# On prem server
- Total cost of Ownership

# cloud 
- data is mostly stored as JSON containing the LCID.
- LCID -> Language Code Identifier using this data can be transformed from one language to another.

**Data wrangling** is the process of getting, ingesting, transforming, validating, and cleaning data.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/aa68fdd6-6eaf-4f88-bf79-5a0b8565cba5)

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/daca00bc-e122-41b3-9931-016d34e7cb8e)


# Data types
## Structured data.
- stored in relational database
- schema is predefined before load
- adapts slowly to changes.

## Unstructured data.
- Key value pair -binary image, audio files.
- stored in Non Relational systems or no sql systems
- data structure is not defined in design time and is loaded in raw format
- data structure is defined when it is read
### 4 types of No sql databases
1. Key value store -stores key-value pairs of data in a table structure.
2. Document database - stores documents with meta data to aid in search
3. Graph database - finds relationship between stored database using datapoints called vertices and edges.
4. Column database - stores data in columns instead of rows and columns can be defined in query runtime and allowing flexibility in the data that's returned



## azure storage service
- 4 types
1. Azure Blob - a scalable object store for text and binary data, doesnt support querying.
2. Azure files - managed file shares for cloud and on prem
3. Azure Queue -  a messaging store for reliable messaging between application components
4. Azure table - no sequel store for no schema storage of structured data
- Role based acces control (RBAC)
- support for CLI
## Two types of application
- standalone use - works independently or sometimes with other applications
- storage basis for other apps  -  Azure storage as the storage basis when you are provisioning a data platform technology such as Azure Data lake storage and HD insight

## Data ingestion
- Azure data factory
- storage explorer
- azcopy - supports a maximum file size of one terabyte and automatically splits Data files that exceed 200 GB.
- powershell - use when file size more than 2GB
- visual studio   - use when file size more than 2GB

# Azure Data services
## Azure data lake storage.
- Azure Data Lake Storage is a Hadoop compatible data repository that can store any size or type of data.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/34d4fd4a-4cdc-464a-b96c-66036099bd42)

- The compute that sits on top of Data lake can vary depending on our choice and use case like HDinsight or Hadoop or Databricks
- Features
   1. Unlimited Scalability
   2. Hadoop compatibility
   3. Securtiy using Access Control List(ACL).-- using azure active directory.
   4. POSIX compliance
   5. Optimized Azure Blob File system (ABFS) driver - that is designed for Big data
   6. zone redundant storage and geo redundant storage
- For data ingestion we can use apache scoop, azcopy. adf
- query using azure blob storage API or azure data lake system API.
  
![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/919813bd-6dbd-4b2b-adde-96ca025d8404)

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/0e02e6f8-6cb3-4530-ac6d-97783519d577)

security can also be implemented using RBAC.

## Azure cosmos db
- globally distributed multi-model database.
- can be implemented using any of the following APIs.
1. SQL API
2. MongoDB API
3. Cassandra API
4. Gremlin API
5. Table API
6. Lambda API

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/d93117ee-ec06-4231-9f7e-b13226494d57)

- Mongo for semi structured data
- casendra for wide column
- gremlin for graph database.
- 5 9s uptime and 10ms response time.
- multi national replciation

## Azure sql database.
- Azure SQL Database, a managed relational database service supporting structures such as relational data and unstructured formats such as spatial and XML data.
- similar to on prem sql server but has more advantages.
- faster scale up and down on demand.
- built in optimization.


# Supporting tools for Azure data services.
## [Synapse](https://github.com/deepakgowtham/Datascience_Basics/blob/main/Cloud/Synapse/01_Basics.md)   
- Integrated analytics platform and brings together Data warehousing, Big data analytics,Data backup
- Synapse SQL offers both serverless and dedicated resource models to work with both descriptive and diagnostic analytical scenarios
- For predictable performance and cost, create dedicated SQL pools to reserve processing power for data stored in SQL tables.
- Unlike dedicated SQL pools where the user pays for reserved resources at a pre-decided scale, the cost of serverless SQL is calculated per TB or data processed based on the queries run. The pricing of serverless SQL pool is around 5 USD per TB of data processed, but costs can quickly rise if the queries run are above large multi TB datasets.
- In Azure Synapse Analytics, the Data Movement Service (DMS) coordinates and transports data between compute nodes as necessary.
## Azure Stream Analytics
-  Azure stream analytics to process streaming data and respond to data anomalies in real time.
-  Use data ingestion in stream analytics by configuring data inputs from first class integration sources. These sources include Azure event hubs. Azure IoT hub and Azure Blob storage
-  **IoT hub** - bidirectional data transfer from IoT devices
-  **Azure event hub** - provide big data streaming service. It's designed for high data throughput allowing customers to send billions of requests per day. And event hubs uses a partitioned consumer model to scale out Azure data stream.
   - This service is integrated into the big data and analytics services of Azure.
   - These include Databricks, Stream Analytics, Azure Data Lake Storage and HDInsight.
   - Event hubs provides authentication through a shared key. You can use Azure storage to store data before you process it in batches
   - Partitioned consumer model -Event Hubs uses a partitioned consumer model to scale out your data stream and is integrated into the big data and analytics services of Azure including Databricks, Stream Analytics, ADLS, and HDInsight.
-  To process streaming data set up stream analytics jobs with input and output pipelines. Inputs are provided by event hubs, IoT hubs and Azure storage
-  For job transformation use simple declarative SQL.
   
## Azure HDInsight
- contains - Hadoop, Spark, Hbase, kafka, storm, Hive (interactive querying).
- Hadoop contains Apache Hive, HBase, Spark, and Kafka. Hadoop stores data in a file system or HDFS, and Spark stores data in memory.
- HBase - is a no sql database built on top of Hadoop It's commonly used for search engines. HBase offers automatic failover
  
![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/4f976fbd-71c5-40c7-9963-1d8ceaaebcdd)

- Mapper consumes and analyzes input data. It then emits tuples that reducer can analyze. Finally, reducer runs summary operations to create a smaller combined result set.
## Azure databricks
- adds capabilities to Apache spark, including fully managed spark clusters and an interactive workspace
## Azure data factory
- Azure data factory is a cloud integration service. It orchestrates the movement of data between various data stores. The purpose of Azure data factory is to retrieve data from one or more data sources and convert it into a format that you process
## Azure data catalog
- Data catalog is a fully managed Cloud service. Users discover and explore data sources, and they help the organization document information about their data sources. It is important to note that the data catalog will soon be replaced by **Azure purview**.
- create unified data map
- search data faster, analyze data more in depth.
