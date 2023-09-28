
# Internal Stucture of Delta lake
- Storage -- data is stored in parquet format
- Transaction logs -- transaction log containing full information (audit log, indexes and stats) in JSON format.

# Features
## Audit
## Time travel
- Get the data from pervious transaction or version.

  ```
  select * from emp version as of 2
  select * from emp timestamp as of '2O22-O7-O1T02:06:10.000+0000'
  ```


## Schema enforcement
- if any changes to the current schema like adding new columns, exception will be raised.
## Schema evolution 
- add new columns intentionally use .option('mergeSchema', True)

## Snapshot and vaccum
- whenever we make changes to the data insert, update, delete all these will be tracked as versions
- Delta Lake uses Spark to process the transaction logs in the _delta_log directory. When Delta Lake loads the transaction logs, it will replay logs to generate the current state of the table which is called Snapshot.
- we can delete the older transaction details using vaccum, as it may be too large or we may not need the transaction data after a certain period of time.
- when we run vaccum it purges older versions
- default retention is 7 days or 168 hours
- so versions more than 7 days will be removed.

```python
vaccum table_name

vaccum table_name dry run #to see version that are to purged.

vaccum table_name retain 10 hours # manual override.
# to enable manual override we need to set retention check to false.

spark.conf.set("spark.databricks.delta.retentionDurationCheck.enabled", "False")

```

## Optimize with ZORDER Indexing

```python
optimize delta `/tmp/emp_delta` zorder by (DayOfWeek)
```
- create partition wise uniformly sized files.
- can be made on 1 or more columns by comma seperated.
- remove the small file problem
- if the number of files to be read is lesser, the number for file I/O will be reduced there by reducing the time.
- it will also sort the data using the column mentioned in zorder by
- this activity is not performed daily, is a performance tuning activity to improve performance.
- zorder is a dataskipping algorithim like indexing to skip the data and get the data that we want.
- Usually the column the frequently filtered or joined is used for creation of zorder


# Merge Operation
- merge operation happens in 7 steps

- INSERT or UPDATE parquet: 7-step process
With a legacy data pipeline, to insert or update a table, you must:

Identify the new rows to be inserted
Identify the rows that will be replaced (i.e. updated)
Identify all of the rows that are not impacted by the insert or update
Create a new temp based on all three insert statements
Delete the original table (and all of those associated files)
"Rename" the temp table back to the original table name
Drop the temp table
INSERT or UPDATE with Delta Lake
2-step process:
- where as in delta lake its a two step process
Identify rows to insert or update
Use MERGE

```sql
%sql
MERGE INTO all_employee as t
Using emp_source as s
ON t.id = s.id
WHEN MATCHED THEN 
update set *
WHEN NOT MATCHED THEN 
insert *

```
in pyspark.
```python
df_employee_tgt.alias("t").merge(df_emp_source.alias("s"),"t.id = s.id")\
.whenMatchedUpdateAll()\
.whenNotMatchedInsertAll()\
.execute()


df_employee_tgt.alias("tgt").merge(
    df_emp_source.alias("src"),
    "tgt.id = src.id") \
  .whenMatchedUpdate(set = { "name" : "src.name" ,"loc":"src.loc"} ) \
  .whenNotMatchedInsert(values =
    {
      "id": "src.id",
      "name": "src.name",
      "loc": "src.loc"
    }
  ) \
  .execute()
```
