# Azure storage types
1. Data lake gen 1 (only used in projects before 2019, to be retired 2024)  
2. Azure blob storage
3. Data lake store gen 2 (gen1 +blob storage)
4. SQL server with azure sql (OLTP DB)
5. SQL server with SQL DWH (OLAP DB)

## Data lake gen 1
- can store any size/type of data
- hierarchial folder structured enabled
- suitable for big data workloads and analytics
- unlimited size/folder/files
- RBAC- Role Based Access Control
- ACL - Acess Control List - read,write , excute privilege to individual users.
- mainly used for analytics purpose as it is high speed storage.
- only one pricing
- No public access
  <img width="684 " alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6747268e-d873-46f1-8515-7881468aea01">

## Blob Storage (object storage)
- two types - standard and premium
- premium for low latency applications like steaming
- public and private access
- databackup /db backup/ server backup
- data storage in blob has container(only one folder sub folders cannot be created.)
- we can edit data online
- version will also be created depending on the edit.
- snapshot to restore old data(promote snapshot)
- has different types of pricing strategy - depening on use case.

<img width="788" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1c3f4075-fb5c-4e4e-b880-36bad2808c93">

- Object storage -> access files directly.
- Block storage -> can be only accessed through program like pyspark (delta)

## Access tier in blob storage.
- Hot, Cool, Archieve
- hot - daily access
- cool - accessed in a less frequency monthly, quarterly, yearly
- Archive - access only in 6 months.

## Data lake gen 2

- 
# Data Ingestion tools from on prem
- Azure data factory
- Adlcopy service
- Import /Export service.
