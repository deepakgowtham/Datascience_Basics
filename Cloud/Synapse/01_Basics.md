# Synapse 
- Azure Synapse Analytics is an analytics service that brings together enterprise data warehousing and Big Data analytics. Dedicated SQL pool (formerly SQL DW) refers to the enterprise data warehousing features that are available in Azure Synapse Analytics.

<img width="407" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/9ea04de7-ff6a-44f8-b599-5f802e9ad6b3">

- Azure Synapse or Azure SQL Data Warehouse or Dedicated SQL Pool
- cloud MPP system
- structured data only
- not file based but database based.
- seperate storage and compute
- sql is primary language.
- data is split based on partition algorithims
- max nodes supported is 60
- Polybase to ingest the data
- PolyBase is a technology that removes complexity for data engineers. They take advantage of techniques for big data ingestion and processing by offloading complex calculations to the Cloud
- ADF can be configured to use polybase tool.

  Two types in synapse
1. Dedicated SQL Pool (DWH) (compute limited to max 60 nodes)
     Data storage is fixed to 60 nodes by default
     Compute node can be changed from 1 to 60. 1 control node and others are worker or data node.
2. Serverless SQL Pool (Lakehouse). Synanpse with serverless (no limitations on compute)

<img width="363" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/98eb3c6c-53e2-48cc-9db2-1a10af47784e">

<img width="293" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/3637fde5-96c9-4b29-b828-0cdb26807cc1">

# Distribution Alogirithm
1. Hash
2. Round Robin (even distribution)
3. Replicate (broadcast to all nodes)
   
<img width="691" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/448e2724-f436-40b5-82c7-1f48b1b80689">

<img width="464" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ff7582ba-84e2-431e-8c14-1b862eeea1f3">

# Index types
1. Cluster Column store Index -CCI (default)
2. Clustered Index
3. Heap

During table creation in synapse we must mention both distribution type and index type

<img width="380" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/742638a6-85c9-4bdd-b41b-a5b59a7be08a">

<img width="611" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7f78eed6-a9c7-425d-bad8-b311d1f8326f">

## Table type and index
- Staging Table  - Round robin replication and heap index
- Dimension table
  1. Smaller dimension tables with size less than 1 GB -- Replicatiion distribution and clustered index or heap index
  2. SCD tables
     for scd tables with 60M rows-  round robin distribution  and CCI index
     for tables with more than 60M rows - hash distribution and CCI index.
    
- Fact table - hash distribution and CCI index

## Conditions for Hash distribution
- while using hash distribution a key column should be selected upon which the hash key is created and  distribution is made.
- Hash key column should has a primary key unique and non duplicate.
- CCI index column should not be updated frequently.
- Truncate load(drop data and recreate it again) should not be made on those tables as it might cause Out Of Memory Error

## Distribution and compute nodes
- Compute power is calculated using data warehouse units.

<img width="524" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f750aae4-6cb0-447e-9b7a-574b05c60633">

<img width="469" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b5213d4d-a8c4-4504-8f9f-ca0ec5845aa9">


 [Reference link](https://learn.microsoft.com/en-us/azure/synapse-analytics/sql-data-warehouse/sql-data-warehouse-manage-compute-overview)
