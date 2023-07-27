# Fact table
## Types of Fact table

<img width="785" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/70724435-ee50-47d2-baa9-00bdaf3f119f">

- Accumulating snapshot = Periodically record the progress of a process over time.
  
## Transaction Fact table

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

- Facts occur simultaneously
   2. Both the does not occur simultaneously. billing and payment need not occur simultaneously.

  ## Problem if we violate the 2 rules.
   - Complicates data analysis - part of different process
   - requires sql workaround
   - Billing and payments are two different business process.
   - each business process belong to a seperate fact table.
 
   - In this scenario  we can store facts seperately connected by the dimensions
     <img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f71978c7-491e-41bc-963e-d1947c6d59f8">

   
