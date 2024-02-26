# Intro  
- Azure data factory  orchestration tool mainly used for ingestion and scheduling
- Used mainly to overcome limitations in databricks notebooks like restartability
- Data integration service
- data driven workflows.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/75318ffa-49d3-4cea-8157-6217d5fe066a)


![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6d1213a2-3205-42c9-8184-bf54fd8435ec)

<img width="481" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/fe4ab958-e7de-4a04-808b-aee734ad6542">


## components

- Linked services (Connections)
- Datasets  -named view of the data within a linked service.can be used by both linked service and activity.
- Pipelines - grouping of linked service, datasets and activities as a set so it can be managed easily. chaininng of activities
- activities- operation made on data like copy, transformation
- Triggers - We schedule the pipeline, instead of activities independently.
- parameters - update components dynamically at run time for example update linked service or a dataset for incoming data -key value pairs in read only configuration.
- Integration Runtime -> serverless compute - bridge between activity and linked service objects
  
   a. Azure integeration Runtime -> used when data is migrated between two azure cloud services
   b. Self hosted Integration Runtime -> used when data is migrated from on prem to azure cloud service
   c. Azure-SSIS
  - Control flow - to control the flow of activities within the solution
- Data Flow (not used more commonly)

<img width="431" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/92936aa8-3716-4611-a26c-a1985d9f0405">


# Integration Patterns
two types of integration patterns is supported by ADF.
- Mordern data warehouse workload -  A modern data warehouse is a centralist data store that provides descriptive analytics and decision support services across the whole enterprise. Datawarehouse acts as a central repository and single source of truth.
    
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/27f9bd93-5f42-4088-81d4-b19e8cee369f">

- Advanced analytical workload
<img width="469" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/e2c870df-94e2-49e3-b31d-848586de7f26">

# Datafactory process
<img width="503" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/38383c01-6194-4340-b3dc-992c90233b5e">

# Security
- to create data factory instance - the contributor or owner role or administrator of the Azure subscription
- create, and manage child resources in the Azure portal, you must belong to the Data Factory contributor role at the resource group level or above. To create and manage resources with PowerShell or the SDK, the contributor role at the resource level or above is sufficient
- Contributor role
<img width="272" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/731c7d12-e4ed-4061-9c8c-1eedf716503b">

