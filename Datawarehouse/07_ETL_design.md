# ETL design

<img width="552" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b16a4d4c-8643-4c23-8744-4578fbaa14cd">

# ETL best practices
- Limit the amount of data coming to data warehouse, not all the data from data source is required.
- Process dimension tables data before adding data to fact tables.
- Opportunities for parllel processing eg. process dimension tables in parallel.

# Use case : Design ETL with star schema for Transaction grained fact table.
<img width="566" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/58b6f395-df0f-45b3-8888-601d2d7b135c">

## Change data capture
- Check if the data has been changed in the source system itself instead of taking the data to data warehouse.
- Compare the timestamp in the relational database of the source system, with the timestamp of the last incremental  ELT load to see if there is any changes in the data
- Other method is to use the database logs to check for the changed data.
- If any of this not available as a last resort compare the data in source and target system.
- If new row comes to dim table, add to the table along with new surrogate key.
- if modification is required perform type 1 or type 2 changes as required.

## If a type 1 change comes after type 2 change.
- in below example the type 2 change is applied first, then the we find the incorrect date of birth error.

<img width="525" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/cf6c1121-6c2e-40b2-bdfe-ae0c0b1074b6">

- so when applying the type 1 change we need to correct in both the places.
- we can make this change by using the natural key.

<img width="526" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/16e15da3-ee2b-4fc4-950d-be517c4f29cc">

## processing Fact tables after dimension tables

- here we are adding a tution payment entry to the fact table.
<img width="587" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ac662a47-0dac-416a-9aa9-6bc9a6bea3bc">
<img width="422" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c52763a0-1246-45da-aa29-f1c71cb59b26">

- ted young makes a payment of $5500
- transactional systems only provide the natural keys not surrogate keys.
- as there is no surrogate key in this data, to which version we will append the data. or how to find the current surrogate key for this data

<img width="549" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/04736b4b-315c-4897-a277-7d52f05d16d9">

- we can assume the current version, when there is more than version use the effective date and/or current version information.

<img width="556" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/835457a2-a3aa-4e1d-8e59-e2a601fb7562">

- though we need to add data to fact table, we will lookup the dim table to get the date in which the payment is made and get the corresponding version to which we need to add

<img width="577" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/37cff5aa-e19f-4ae9-bdaf-024441cd966d">

<img width="577" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7e867875-2d14-4eb1-a05d-87e52d85ce46">

- **so to to ETL in fact table after type 2 change we need to do lookup in dim table**

<img width="572" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/75107923-737d-4ebf-9eae-965a933af339">

- eventhough the version we are reffering is not current we need to select the data using the effective and expiration date.
- 
<img width="575" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/bcdfef61-3b68-4783-bab7-f661f66e2df7">

# High level step
- data preparation
- data transformation
- process and load data in dimension table
- process and load the type 1 and type 2 changes.
- process and load data into fact table.
