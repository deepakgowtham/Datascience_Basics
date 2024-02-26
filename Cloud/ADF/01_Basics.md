# Intro  
- Azure data factory  orchestration tool mainly used for ingestion and scheduling
- Used mainly to overcome limitations in databricks notebooks like restartability
- Data integration service
- data driven workflows.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/75318ffa-49d3-4cea-8157-6217d5fe066a)


![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6d1213a2-3205-42c9-8184-bf54fd8435ec)

## Five components
- Pipelines
- Datasets
- Linked services (Connections)
- Integration Runtime -> serverless compute
  
   a. Azure integeration Runtime -> used when data is migrated between two azure cloud services
   b. Self hosted Integration Runtime -> used when data is migrated from on prem to azure cloud service
- Data Flow (not used more commonly)

# Integration Patterns
two types of integration patterns is supported by ADF.
- Mordern data warehouse workload -  A modern data warehouse is a centralist data store that provides descriptive analytics and decision support services across the whole enterprise. Datawarehouse acts as a central repository and single source of truth.
    
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/27f9bd93-5f42-4088-81d4-b19e8cee369f">

- Advanced analytical workload
<img width="469" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/e2c870df-94e2-49e3-b31d-848586de7f26">

# Datafactory process
<img width="503" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/38383c01-6194-4340-b3dc-992c90233b5e">


