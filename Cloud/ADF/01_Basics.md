# Intro  
- Azure data factory  orchestration tool mainly used for ingestion and scheduling
- Used mainly to overcome limitations in databricks notebooks like restartability

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