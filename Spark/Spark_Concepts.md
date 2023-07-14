# Monotonically increasing IDs
## Disadv of sequential ids in distributed computing.
- Relational databases tend to have a field used to identify the row, whether it is for an actual relationship reference, or just for data identification.
- These IDs are typically an integer that increases in value, is sequential, and most importantly unique.
- The problem with these IDs is they're not very parallel in nature. Given that the values are given out sequentially, if there are multiple workers, they must all refer to a common source for the next entry.
- This is OK in a single server environment, but in a distributed platform such as Spark, it creates some undue bottlenecks.

  ##
  - Spark has a built-in function called monotonically_increasing_id(), designed to provide an integer ID that increases in value and is unique. These IDs are not necessarily sequential - there can be gaps, often quite large, between values
  
<img width="353" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/bfd44c34-2aeb-46e9-b651-6ebcaec10070">
- Unlike a normal relational ID, Spark's is completely parallel - each partition is allocated up to 8 billion IDs that can be assigned. Notice that the ID fields in the sample table are integers, increasing in value, but are not sequential. It's a little out scope, but the IDs are a 64-bit number effectively split into groups based on the Spark partition. Each group contains 8.4 billion IDs, and there are 2.1 billion possible groups, none of which overlap.



  
