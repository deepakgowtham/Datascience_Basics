# Rules of  data warehouse?

- Data warehouse is an **integrated environment** (meaning data from number of different source systems are sent here)
- Data warehouse should be **subject oriented**, i.e., data should be organized by subjects though data is from different sources.
- **Time variant** - will also contain historical data.
- **Non-volatile** - remains stable in between refreshes.
- Should support data driven decision making.

  # Reasons to build Data warehouse
  - to support data driven decision making - containg past, present and future of the data to support decision making.
  - **one stop shop** for all the data we need.
 
  # Data warehouse vs Data Lake vs Data Virtualization
  ## Data ware house.
  - built on top of dbms like oracle, db2  or multi dimensional db type called cube.
 
  ## Data Lake.
  - built on a big data environment like hdfs
  - typically contains more **volume** of data when compared to datawarehouse.
  - **Velocity** of data intake is much faster
  - **Variety** - along with structred data data lake also supports semi structred data like emails, text messages, and unstructed data like audio and video.
  - **3 V's of data lake**
  both supports SQL

<img width="470" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/0b21f918-811d-4658-809c-e9252778153f">

## Data Virtualization
- Read only Distributed DBMS
- In-place data access
- other names virtual data warehousing, enterprise information integration, enterpirse data access.
- use full for simple transformation, smaller number of data sources, relaxed response time.

# Components

 <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a9c8316c-5148-414a-b784-0aff8078440b">

 Data Mart = subset of data from warehouse for specific use cases.

 <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/61d540d7-ecaf-43b1-b35d-9136ba9d2b9b">

 
