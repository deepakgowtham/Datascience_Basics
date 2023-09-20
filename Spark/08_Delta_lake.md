
# Internal Stucture of Delta lake
- Storage -- data is stored in parquet format
- Transaction logs -- transaction log containing full information (audit log, indexes and stats) in JSON format.

# Features
## Audit
## Time travel
## Schema enforcement
- if any changes to the current schema like adding new columns, exception will be raised.
## Schema evolution 
- add new columns intentionally use .option('mergeSchema', True)

## Snapshot and vaccum
- whenever we make changes to the data insert, update, delete all these will be tracked as versions
- Delta Lake uses Spark to process the transaction logs in the _delta_log directory. When Delta Lake loads the transaction logs, it will replay logs to generate the current state of the table which is called Snapshot.
- we can delete the older transaction details using vaccum, as it may be too large or we may not need the transaction data after a certain period of time.
