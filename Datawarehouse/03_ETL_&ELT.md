# ETL

## Extract
- Extract the data from source.
- With all errors and place in staging layer

## Transform
- Modify the data
## Load
- store in user access layer.
## Challanges in ETL mode
- significant  business analysis before storing data.
- Significant data modeling before storing the data.

# ELT
  - Blast the data into big data.
  - Data in RAW form in Hadoop HDFS, AWS S3 etc.
  - Use the computing power in big data enviornment to transform as needed.
  
 # Schema on read vs schema on write

 schema on write (ETL) - at the point you create the data and make it available for analytics usage, the schema, 
 the structure for that data has already been set, so the schema is there.

Schema on read (ELT) - the data is stored in raw format, we can defer creating the schema, so no need  for much analysis while loading the data.
we can do the schema and analysis when required as we transform the data.

# Models for ETL

## Initial load ETL
- Collect all the data from different sources and load it in staging area, transform it and then load it user access layer.
- One time activity done right before the data warehouse goes Live.
- Redo if data warehouse goes corrupt.
- Only bring relavent data for BI and analytics not all the data from source.
- data definitely needed.
- data probably needed.
- Historical data.

## Increamental ETL
- Incremental refreshes from source
- New data like new employees, products
- Modified data like employee promotion.
- Special handling for deleted data. -> not dropped from data warehouse but flagged for historical use.
- Bring  the data up to date.

### Incremental ETL patterns.
1. Append.
  <img width="111" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/109db231-1d2b-4383-9146-4dcac81d8ea1">

2. In place update. -> go to existing rows of data and change them
  <img width="215" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/df8f5232-faae-464f-9f7e-9157abc72fae">

3. Complete replacement. even if we are changing a portion- replace the whole data in warehouse.
  <img width="376" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7a38ec15-276d-4cf6-a9be-7eb8dda41172">

4. Rolling append. -> we decide to keep only particular duration of data. add the new data and delete the oldest data. at any given time we will have only particular duration say 10 weeks of data
  <img width="347" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5cb5af89-2dff-4c4f-99b2-294be2b2b779">

**Mostly append or in- place update is used more commonly**

# Role of data transformation.
## Data transformation overarching goals.
1. Uniformity.
   - No matter different format from different sources/system the data is coming from we need to transform the data so it has to be uniform for data analytics.
2. Restructing.
    - The raw data in staging layer has to be transformed to a well engineered data structure
      
   <img width="449" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c39b90c6-cec7-4791-b206-f5343afaaa4e">

 # Tranformation Models.
  1. Data Value unification.
  2. Data type and size unification.
  3. De- duplication
  4. Dropping columns (vertical slicing)
  5. Value based row filtering (horizontal slicing)
  6. Correcting known errors.

## Data value unification.
  <img width="408" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/d5116cce-c8bd-411e-8a08-02e79c11bb65">
  
  -  Data should be represented in the standard format.
  -  here in the ex Professor is stored as professor in one system and P in other so we come up with a common system as p

## Data type and size unification.
 <img width="420" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/15664165-1807-4bd2-a8e0-ef32f9635185">

## De- duplication

 <img width="430" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a56b763c-4910-4619-96ba-db87d4d46c74">

## Dropping columns
   - Drop unwanted columns present in staging

## Value based row filter
 - remove rows of a category that are not related to our analysis

## Correcting known errors.
 - Correct incorrect data in the staging layer.
<img width="430" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5eda02ac-5cfb-443f-9c0d-bd1d6c33498c">


 # Mix and match the transformation
 - Dependening on the business need some data is refreshed daily, others weekly, others hourly and so on.

<img width="456" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/710eb07c-f420-46e1-b007-e39fff56402f">

Depending on the data we can change increment strategy.

<img width="446" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/52c45a3a-0d47-4960-a47e-687d0dcd0f85">

The variation in feed can also be at table level at multiple source

<img width="461" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/3225bf96-18cd-466a-9a59-5ea8b0ec02bf">

<img width="458" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5da12021-71cd-4e87-82f4-0ecaee434633">

Design a solution that suits our need.
