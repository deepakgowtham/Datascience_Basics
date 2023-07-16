# Comments in csv file.
- spark.read.csv has a parameter callend **comment** to filter comment lines from csv
```python
annotations_df = spark.read.csv('annotations.csv.gz', sep='|')
comment_count = annotations_df.where(col('_c0').startswith('#')).count()
```
