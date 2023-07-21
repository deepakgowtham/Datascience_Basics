# Centralized data warehouse.
-  Single database, data from multiple sources are collected.
-  on stop shop

## Challanges in centralized approch

- high cross-org cooperation
- high data governance
- Ripple effectss = changes affect mulitple portions of the data enviroment.

# Multi component (Component based) data warehouse
## Data Mart

- Two types
- 1. Dependent -> datamart getting subset input from a central data warehouse. 
  2. Independent -> small dataware house like system drawing input directly from multiple source systems


## Adv
- Cross technology
- Decomposistion - isolating some portions from other so they can have easy changes.
- overcomes org. challanges.

## Disadv
- often inconsistent data
- difficult to cross integrate

<img width="776" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/9993fc2b-2314-491d-99d2-8517824d2ffc">

<img width="770" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a1be7859-376b-4650-8e0b-b3f6b07c99b7">

- only difference is the number of data sources, datamart has small number of sources when compared to data warehouse. 

<img width="936" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a82feacf-05ee-43c3-a4ec-0fb7645c866a">

EDW - Enterprise Datawarehouse

DW Bus - Dataware house Dimensional bus

Confirmed Dimension -> Direct view about key subject areas present in different data marts.

<img width="586" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a6498446-4832-4bac-be00-0a0c012a36fc">

Federated EDW --> Multiple Data Marts, in different formats answering questions differently, used a last resort, when we can partial solution when compared to no solution.

## Cube.
- Specialized dimenionally aware database.
- For smaller scale Datawarehouse
- Fast query response time.
- Less flexible than RDBMS
- Can be used for Data Marts in some cases.

# Operational Data store
- Similar to Data warehouse contains data from multiple sources
- but main difference is it focuses on the **current operational data and not history data.**
- Tell me whats happening right now.
- Eg. when a transaction occurs in POS system, the data is sent immediately to the ODS, instead of waiting for the next data warehouse refresh.
- Used for making strategic or Operation data driven analytics or decision making.

## Can we implemented in two styles.

1. ODS parallel to Data warehouse.

<img width="571" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5d8f3a90-07f8-4f4b-ad1d-621f5c83e5d3">

2. ODS as staging area for Data warehouse

<img width="582" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/fb85402c-efc7-47c7-8cfb-c25ffd7fe60f">

ODS not popular today
- Replaced by faster DWs
- Superseded by big data velocity
- ODS as a component in Data Lake

# Staging layer and User Access layer.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/cbad0559-9d20-4323-ba64-5c5c9b8efa00">

## Staging Layer.

- Landing zone.
- Copy the data from source without giving load to the source system.
- mirror image of the data from source system.
- Focus on E of ETL

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/cb45bbea-cced-4434-8994-989b1005f6b1">
### Types of staging Layer.
- Non Persistant staging Layer
   1. During the refresh cycle, the staging layer is empty 
   2. data is transformed and additonal data that is not present placed in User access layer is placed in user access layer.
   3. then again the staging layer is emptied. Hence, Non persistant staging layer. User access and staging are not in sync.
   
   <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/31e93b62-633b-4528-b108-169d07d43a3b">


- Persistant staging Layer
   1. Data is present in staging layer as it is in User access layer.
   2. Additional data is placed in user access layer.
   3. Data is not emptied.
      
   <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/fb571688-ead2-43f3-9460-0ec8b9cab8d1">


## User Access layer
- the layer where users access the data.
- Dimensional data is stored here.


