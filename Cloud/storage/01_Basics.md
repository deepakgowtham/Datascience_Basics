<img width="413" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c1ab95f5-f9d8-40c5-a61f-7c028db8e8b3">
- sql and cosmos are special and are not included in storage account.
# Azure storage types
1. Data lake gen 1 (only used in projects before 2019, to be retired 2024)  
2. Azure blob storage
3. Data lake store gen 2 (gen1 +blob storage)
4. SQL server with azure sql (OLTP DB)
5. SQL server with SQL DWH (OLAP DB)

# Azure storage account
- Storage account can contain one or many of the storage services
- deleting the account deletes all the resources inside it.
- The settings that are controlled by a storage account, our subscription, location, performance(standard(hdd), Premium(SSD)), replication accessed here, secure transfer required and virtual networks.
- Access Tier - Hot : gives quicker access to data used for Frequently accessed data 

<img width="410" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/9b6c6c87-c9e5-4d7c-81cb-4a8f897de81a">

- A resource group can contain mulitple storage accounts.

<img width="391" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/aabb0c61-e963-4a80-8d1a-469e57e07db1">

- The number of storage accounts you need is typically determined by your data diversity, cost sensitivity and tolerance for management overhead
- Mainly locaiton, billing and replication determines the number of storage accounts required.
- More storage accounts means more complexity.

 ## Storage account setting
 - Name - Gloabaly unique
 - Deployment Model is the system that azure uses to manage resources 1.resource manager API - mostly used. and 2. classic (service manager API)
 - Account kind - General purpose v2 is recomended as other has less features
   <img width="839" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/d123b78f-024d-4803-8f8e-ccd9ce69743b">

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
- cant edit data directly online
  
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
## Access tier in blob storage.
- Hot, Cool, Archieve
- hot - daily access
- cool - accessed in a less frequency monthly, quarterly, yearly
- Archive - access only in 6 months.
- has active directory integration and RBAC access control like Adls but doesnt have ACL as no folder structure is there
<img width="684" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1c3f4075-fb5c-4e4e-b880-36bad2808c93">

<img width="684" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/428294b0-9877-4841-a7a2-a30a919a6548">

- Object storage -> access files directly.
- Block storage -> can be only accessed through program like pyspark (delta)

<img width="762" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/4676525b-4a7a-457e-b950-a287deb60efb">




## Data lake gen 2
- Combination of blob + adls gen 2
- There is no option to create adls gen 2 seperately
- when creating a storage account we need to select adls gen 2 in advanced tab.

<img width="623" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b78097de-6660-4b41-b09e-808dc23856e0">



# Data Ingestion tools from on prem
- Azure data factory
- Adlcopy service
- Import /Export service.
