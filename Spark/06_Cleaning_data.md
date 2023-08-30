# Comments in csv file.
- spark.read.csv has a parameter callend **comment** to filter comment lines from csv
```python
annotations_df = spark.read.csv('annotations.csv.gz', sep='|')
comment_count = annotations_df.where(col('_c0').startswith('#')).count()
```
# validate using a join.
- One technique used to validate data in Spark is using joins to verify the content of a DataFrame matches a known set. Validating via a join will compare data against a set of known values.
- Joins are also comparatively fast, especially vs validating individual rows against a long list of entries.

<img width="538" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/59c0c7f8-5a01-413e-9c2d-f178dcbd4adc">

```python
# Determine the row counts for each DataFrame
split_count = split_df.count()
joined_count = joined_df.count()

# Create a DataFrame containing the invalid rows
invalid_df = split_df.join(F.broadcast(joined_df), 'folder', 'left_anti')

# Validate the count of the new DataFrame is as expected
invalid_count = invalid_df.count()
print(" split_df:\t%d\n joined_df:\t%d\n invalid_df: \t%d" % (split_count, joined_count, invalid_count))

# Determine the number of distinct folder rows removed
invalid_folder_count = invalid_df.select('folder').distinct().count()
print("%d distinct invalid folders found" % invalid_folder_count)
```

# Read mode
1. Permissive (default) - nulls are inserted for fields that are not parsed correctly.
2. DROPMALFORMED - drops rows that contains fields that cannot be parsed.
3. FAILFAST - doesnt read if data contains fields out of pattern.
