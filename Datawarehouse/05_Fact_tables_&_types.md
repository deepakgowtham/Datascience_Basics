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
 - Also they serve as foreign keys as well.
   
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
  <br>
  
- In this case if we want to track and analyze end of week meal account balances throughout the semester.
- doing this using a transaction grained fact table is possible but the sql required will be difficult, so we will use a Periodic snapshot fact table

  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/39a61604-f81e-41f2-a796-19b00f91826a">
  <br>
- here the campus_food dimension is not requried to answer our question
   
  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6dbd8346-6cc0-42b9-8ba3-7bcd07bebb61">
  <br>
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
  <br>
  
- we can't add the meal card balance every week as it makes no meaning.
- but we can perform other numeric operation along time dimension like average balance per week  
- also we can lock the table by time dimension can perform numeric operation like total balance for all students in a particular week.
  

   

 # 3. Accumulating snapshot fact table.
 - Tracking progress of a business process
 - Elapsed time spent in each stage or phase for a business process
 - Include both completed and in progress phases.
 - can also tract other measures in addition to elapsed time as process proceeds
 - Introduces multiple relationships from fact table back to single dimension.
   
## case:

<img width="461" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/2659d1f8-87ad-431a-a79d-4b877941c11f">

## Dimensions in this case
- student
- Time
- college employee responsible for each phase.

<img width="483" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/e201cbf4-39fd-4029-a0eb-d26c66abe736">
- Student_key is copied directly, but date_key is copied to different names to tract the progress.here date becomes differentiated into mulitple phases depending on the stage of application.
- same with employee.

<img width="477" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/2e9c0da1-6819-473e-96b8-be314305c125">

- Richard thompson applies for $8000 aid on 11-Aug-2020

<img width="467" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5078da0d-9370-44ab-8e27-703f80aa4405">
<br>
day 2 application is still in same stage, only the day_screening is changed.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/173901e6-4546-4865-a9d9-83c5ed5c1407">
<br>
day 3 screening is completed and days_screening will now not increase 

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/4ebcb451-ba28-426a-af88-3a6d6d4e2931">
<br>
day 4 assigned to prelimnary examination ot an employee and days_prelim_decision started changing.
 
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ec2801cb-92ee-4e2d-82f0-5ea0f8150f9f">
 once approved

 <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/04571e2e-85c6-4b55-83d2-83f65d8a3a35">
 
we can get the days spent for each stage and also we can get the employee responsible for each stage.

can also track other facts.

 <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/9316e08e-f076-425e-a15f-b785e8333014">

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/42f6e609-4e1b-4271-a2c8-a426b90cc937">
<br>
From the addtional facts we can calculate aid applied and granted difference, total amount in screening, total amount paid etc.

# Factless fact table.
- an event that occurs we want to track
- but there is nothing significant to measure about the event.
- students registering for a webinar. we can track who registers, which webinar, the date of registration, scheduled date for each year.

  <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6d58e4c9-c6c3-498b-b919-c192a656f1b1">
  
  - here there is no facts in fact table only keys from other table
  - measurement is actually the occurence of the event.
  - presence of the row in the fact table is the measurement.
  - can count rows with or without filters.
  - factless fact table = pk/fk columns only
  
## Multiple factless fact tables.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b7ba27c2-1f51-4a2a-83ab-785943148953">

can comibine transaction grained and factless fact table

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/4ad52466-b93d-4c43-8b5f-c4568fb48f89">

## Sometimes use a tracking fact.
- value always set =1
- allow to use sql sum() rather than count
- more readable but less efficient in execution.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ffa1a738-6f5e-4d90-bebb-9c93014e99f5">

## Second type of factless fact table.
- recording a particular relationship or association amoung mulitple parties.
- even if no transactions actually occur.
- typically between a starting and ending date or time.
- 
## Case : academic advisers assigned to students.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/65b4c77d-fcdc-4474-898e-fa7f067bb2ed">
<br>
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/719a1822-216c-476b-b8a8-2ac443bb1cc8">
<br>
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f6d637a8-ba5a-450d-abe3-d84bf409c4d6">
<br>

# Fact tables in star and snowflake schema
## Star
<img width="588" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/e48905d8-a523-4855-961d-4d57204e0770">

## Snowflake
- In snowflake schema the primary keys from all the dimension table should not present.

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/951b76e9-6e16-4974-aef6-115aa625db84">
<br>
- only store lowest level PK-FK relationship in fact table

<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/b6069afe-cffb-45e5-992c-ef227e34a296">
<br>

# sql for dimension and fact tables.

<img width="436" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/8a93972a-e45b-48e0-a63f-e70d0ede1bb2">
<br>
<img width="473" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c3121e62-f49f-4182-b773-fc39e6b6bddc">
<br>
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/06d66af4-58f1-42f0-8abb-612f1e416a49">
<br>
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1a5fb2fc-bd2d-4e1a-ae7d-16901459002e">
<br>
<img width="923" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1b350779-0824-44f9-a713-8a77b17a1845">



