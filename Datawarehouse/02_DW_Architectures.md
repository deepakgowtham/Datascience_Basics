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
