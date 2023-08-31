# Streaming Intro
## Source
- Mostly file source format is JSON or avro but support for other format like csv, ORC, Parquet
- can directly read data from Kafka, socket source(for testing purposes ), Reads UTF8 text data from a socket connection, rate source
## Target
- Mostly file system or delta lake but can also be streaming target like kafka , event hub.

to check if a source is streaming or not
- after reading the data from source to a dataframe use `df.isStreaming` returns boolean values

# GroupBy based on timeframe

staticCountsDF = (staticInputDF.groupBy(staticInputDF.action,window(staticInputDF.time, "1 hour")).count())

<img width="578" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/e915c9cc-12ee-442b-be95-9e41b7bf5832">
