# Fact table
## Types of Fact table

<img width="785" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/70724435-ee50-47d2-baa9-00bdaf3f119f">

- Accumulating snapshot = Periodically record the progress of a process over time.
  
# Transaction Fact table

- Also called transaction grained fact table
- heart of dimensional models
- table to store facts from transactions.
- one or more facts can be stored together but there are some rules for doing that.
- _fact at the end to denote fact table.
- 
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f68de24f-7aff-4b35-a613-81962de424cb">

- should not include the other details as in a report.
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/38da6c03-9cfc-4fae-9de2-0585c68d0beb">

- we should include the surrogate keys.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/828cf968-0132-44d7-a677-9e09bb5ce8a5">

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a518860d-9170-4d88-b011-56d57acea70f">

## Rules for storing facts together
- Both the facts are available with same grain(level of detail)
    1. to check this rule to identify the dimension available for them

<img width="464" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/814ad2f4-113e-4ad5-9f97-a745543d1ab2">
  
      
here both have the same dimension so rule 1 applies

- Facts should occur simultaneously
   1. Both the does not occur simultaneously. billing and payment need not occur simultaneously.

  ## Problem if we violate the 2 rules.
   - Complicates data analysis - part of different process
   - requires sql workaround
   - Billing and payments are two different business process.
   - each business process belong to a seperate fact table.
 
   - In this scenario  we can store facts seperately connected by the dimensions
     <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f71978c7-491e-41bc-963e-d1947c6d59f8">

 ## What facts can be stored together
 - Tution billed amount and Activities Fees billed amount
 - This example pass rule number 1
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/eb741b19-ba31-41d5-bc89-78fe9ebbbf9f">
- Also passes rule number 2, as both can occur simulteaneously.

  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/d5b8c650-b553-43f4-8346-dc01569f55d3">

 ## Keys for Fact table.
 - The primary key for the fact table should be the **combination of all foreign keys relating back to dimension table**.
 - Even if there is a natural key is fact table we have to ignore it.
 - Here two surrogete keys that combine to form the fact table's primary key.
 - Also they server as foreign keys as well.
   
  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f90c3c69-3e11-4e11-9f47-4551c5e9deb7">

  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a2f27e4e-56e0-4c55-8535-38424a6edda3">

- In an another scenario, if the student and bill comes from two different sources, then there will be natural key in fact table.
- Even though there is a natural key present, we have to use the combination of the surrogate key as primary key.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/57eaaaec-c93b-4810-bf29-2ff40df0788c">

# Periodic snapshot Fact table.
- sometimes called as snapshots or snapshot fact tables.
- Take and record regular periodic measurements of something.
- regular periodic measurements refers to levels.
- two types of Peioidic snapshot fact table.
   1. Aggregated result of regular transactions, where the transactions are stored in Transaction Grained fact tables.
   2.  Levels that are not related to the regular transactions.(for data that is not stored in transaction grained fact tables)
  ## Case 1:
   <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/037ef5eb-3d05-41c4-856f-92aab39af644">
   - In this case if we want to track and analyze end of week meal account balances throughout the semester.
   - doing this using a transaction grained fact table is possible but the sql required will be difficult, so we will use a Periodic snapshot fact table

   <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/39a61604-f81e-41f2-a796-19b00f91826a">
   - here the campus_food dimension is not requried to answer our question
   
   <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6dbd8346-6cc0-42b9-8ba3-7bcd07bebb61">
   - easier and more direct access for certain type of business questions.

## Second type of Periodic snapshot Fact table.
- here the fact table contains level of water in reservoir (pond)
- there is no transactions associated with it, as no measure for rainfall or water evaporated from it
- only we way to is use Peroidic snapshot fact table without transaction grained.   
<img width="848" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7b520250-8fa6-474c-b6bc-89a47853782a">

 ## Comparing two types of Periodic snapshot.
 - Both are structurally the same.
 - Just the difference is 2nd type doesnt have any transaction fact table associated with it from which the levels are built.
 - Instead the levels just exist and can be measured.

## Semi- additive facts and Periodic snapshots
-  Semi additive facts are usually stored in periodic snapshot fact tables.
-  What was the ending meal card balance for sally jackson on any given week?

  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ae72b679-d332-403e-bebd-2e0fc9acceb2">
  - we can't add the meal card balance every week as it makes no meaning.
  - but we can perform other numeric operation along time dimension like average balance per week  
  - also we can lock the table by time dimension can perform numeric operation like total balance for all students in a particular week.

   

 
