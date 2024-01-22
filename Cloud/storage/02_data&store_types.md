# SemiStructured data
- stored in key value pairs, can adapt easily to changes in the data structures like adding new columns, without affecting the existing data.
-  The expression and structure of the data in this style is defined by a serialization language. Data serialization languages are an effective way to exchange semi-structured data across system JSON, XML, YAML.
- YAML- data seperation is done by line seperation and indentation, unlike JSON where it is brackets.

- structured data is organized data that neatly fits into rows and columns in tables. Semi-structured data is still organized and has clear properties and values, but there's variety to the data. Unstructured data doesn't fit neatly into tables, nor does it have a schema.

# Plan for data storage solutions
## questions to be asked
- data usage
- data access
- read only
- query time
### Operations to be made on data
    1. simple lookups
    2. query database
    3. action udpate
    4. analytical queries
### Latency requirements
- The photos and videos that are displayed on product pages need fast retrieval times so that they are displayed on the site at the same time as product catalog data. You can rely on the results of the product query by including the video ID or URL as a property on the product data.

# Transactions
- when an update has to happen simulateneously in multiple places or tables we can group them as a transaction.
- Transactions enable you to group these updates so that if one event in a series of updates fails, the entire series can be rolled back or undone.
- **A transaction is a logical group of database operations that execute together.**
- will a change to one piece of data in your data set impact another? If the answer is yes, then you'll need support for transactions in your database service
- Transactions are often defined by a set of four requirements referred to as ACID guarantees.
- ACID stands for atomicity, consistency, isolation, and durability.
- Atomicity means a transaction must execute exactly once and must be automic, either all of the work is done or none of it is. Operations within a transaction usually share a common intent and are interdependent.
- Consistency ensures that the data is consistent both before and after the transaction.
- Isolation ensures that one transaction is not impacted by another transaction.
- Durability means that the changes made due to the transaction are permanently saved in the system. Committed data is saved by the system so that even in the event of a failure and system restart, the data is available in its correct state.
- Business data requries transaction support where as photos and videos that are not updated frequently doesnt require transcation support.
## Consistency levels in cosmos db
- indexes every field by default.
  
<img width="581" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b6bbbaab-79ad-4379-846d-2d7f833ccc0a">

- Eventual consistency provides the lowest latency and the least consistency. Strong consistency results in the highest latency, but also the greatest consistency. By choosing the right consistency level, you can determine the trade offs to make between consistency availability, latency and throughput.
- Eventual gives lowest latency but lowest consistency
- strong gives hightest consistency but hightest latency
- but choosing this correctly we can trade of between consistency, availability, latency and throughput
- Throughput refers to how fast we can push data into the database.

# Summary
- Decide the storage solution depending on the following.
- data classification or type
- operations to be made
- latency and throughput
- transactional support


# Azure files
- Azure files enables you to set up highly available network file shares that can be accessed using the standard server message block or SMB (Server Message Block) protocol. This means that multiple VMs can share the same files with both read and write access. You can also read the files using the REST interface and the storage client libraries.
- Sharing data between on-premises applications and Azure VMs to allow migration of apps to the cloud over a period of time.
- Shared config files
- log files
- shared application data

# Azure queue
- Message management
- Large memory capacity
- Asynchrounous processing

# Azure storage API
- Azure storage provides a Rest API to work with the containers and data stored in each account. There are independent APIs available to work with each type of data you can store
-  Azure provides pre-built client libraries that make working with the service easier for common languages and frameworks.
-  Need an **access key and endpoint** to access the storage account
-  Each storage account has two unique access keys that are used to secure the storage account. If your app needs to connect to multiple storage accounts, your app will require an access key for each storage account.
-  2 keys are provided to enable key roatation
-  **access keys provides full access to storage account**
-  Storage accounts offer a separate authentication mechanism called shared **access signatures** that support exploration and limited permissions for scenarios where you need to grant limited access.
-  The REST endpoint is a combination of your storage account name, the data type, and a known domain
-  Connection string - The simplest way to handle access keys and endpoint URLs within applications is to use storage account connection strings
