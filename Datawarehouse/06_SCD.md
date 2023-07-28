# Slowly changing Dimensions
- Techniques how to manage historical data within data warehouse.
- Enables data warehouse to appropriately manage history regardless of policies in transactional applications.
## Three main policies
- overwrite old data, no history retention == Type1
- Maintain unlimited history  == Type 2
- Maintain limited history == Type 3
## other types
- Always retain orginal value == type 0
- Mini dimension - seperate columns that are chaning and not chaning ==type 4
- Type 5, 6, 7 hybrid version of others.

<img width="455" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/2f39963b-6b93-409a-a551-35f52c030450">

# SCD type 1
- No history retention
- only way to restore is using backup tables
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/60319ea6-3ed0-4060-9991-6f6d6ab546ca">

- Used when we are fixing errors. If we dont want history of errors in data.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/0027ed9a-bb8a-4944-a4de-b9edc06eb85a">

# SCD type 2
- Existing row remains as-s
- New row added to the dimension table
- New row reflects the current state of all attributes.
- Complications with reporting and analytics

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/e42099c9-169d-4719-be1c-0e48df70b350">

- the student key is which is a surrogate key should be generated for the new value.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b41a9591-b27f-4c4a-b129-59a335ed7942">

- this is useful if we want to answer the average student financial aid amount for the last year by home state. we couldnt have not done this in type 1.
## Fact table complication with scd type 2

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a11c12f1-81ef-45e8-83cb-d35ff818531c">

- here in the below second table there are two different aid amount for the same person with two different student keys because the state has changed.
- two different versions of the same persion
  
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5edd8606-3076-46bd-b67d-e1dc978735ee">

- here how can we answer the total aid received by that person.
- one option is to include the natural key in fact table, but this will result in duplicate data in fact table when there are mulitple rows

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/83590f3c-6d5f-4016-96ee-4a3ea12e56ef">

- best solution will be multi step SQL.
   1. Find all the surrogate keys for the desired student.
   2. retrive all fact table rows for all of the relavent surrogate keys.

## Maintain correct Data order with Type 2 SCDs.
 - Base type 2 change maintains limitless versions
 - but doesnt indicate the order to those versions
 - 2 Solutions are available for this
 - 1. Maintain a current flag.
   
<img width="449" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7d7a624f-e984-4b52-a098-b14176153e57">

but if there is more than one obsolte verison, the we will not have the information about the order of the change

<img width="450" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/46948fa5-419e-4605-8916-8187f1b7c058">

   2. Solution here is to include the effective date and expiration date. for the current version the expiration will have future day
  <img width="470" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c9a9edd6-a33c-49b1-bcaf-a0072885b322">

Combination of those two works as well.
    
<img width="463" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/cde67872-4a40-4dc1-8051-bc10571d8fee">

# SCD type 3.
- Add new column rather than new row to reflect the changes.
- old value column and new value column
- supports back and forth switching and analytics
- best used for **all data in dimension** being reorganized.

## Use Case  example: Publisher's sales division getting reorganized 
- Initially there was NORTH and SOUTH division
- Now, EAST, CENTRAL and WEST
- So all sales rep will be re assigned to new dimension.
- Data should contain both the old and new dimension
- they should be able to analyse the old data with new dimension even though it didnt exist earlier
- also the new data with old dimension.

<img width="460" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5fb15607-e58d-4cf3-9a3e-eee309388a24">

<img width="446" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f233edb6-8970-4fbd-895a-e91ffc2226b9">

<img width="472" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/52c817c3-b85d-4a6a-9938-947845a71fe3">

<img width="517" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/da1c75f1-8401-4bf5-8fe2-8e35cb60e5be">

## Limitation
- Used when every row in a dimension table is changed at the same time like re-org example.
- Not suited for random changes such as updating few rows
- when the number changes increases adding more columns(more re-orgs) if becomes difficult to handle the older columns,then we have to again use type 2
