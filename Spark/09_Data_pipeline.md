# Data Pipeline

- A data pipeline typically consists of inputs, transformations, and the outputs of those steps. 
- In addition, there is often validation and analysis steps before delivery of the data to the next user.

<img width="312" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/09c8eb1e-0594-473c-b286-19cd37223c04">


# Data layers
## Raw data
- Input stored directly as it is retrived from the source stored directly in data lake in raw format.

## Bronze layers
- source data getting stored in delta format with **meta data validatation**.


## Silver layers
- bronze data after performing joins and transformations and **data validations**
- curated data
- used for ML, DL applications

## Gold layer
 - data stored in aggregated format or in dimensional model form
 - used for traditional reporting applications.
 - acts as data warehouse store.

<img width="558" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6108b9af-17a5-4c40-be74-e3fa133cc418">
