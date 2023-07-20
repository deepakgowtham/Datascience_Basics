# Sensors intro
- A sensor is a special kind of operator that waits for a certain condition to be true.
- conditions include waiting for the
  1. creation of a file,
  2.  uploading a database record,
  3.  a specific response from a web request. With sensors, you can define how often to check for the condition(s) to be true.

- Since sensors are a type of operator, they are assigned to tasks just like normal operators. This means you can apply the bitshift dependencies to them as well.

  <img width="382" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7831b135-f8a0-4df0-9bcf-153b666500ed">
# File sensor example
- checks if a given file is present before continuing.
```python
from airflow.contrib.sensors.file_sensor import FileSensor
file_sensor_task =FileSensor(
   task_id ='File_sense',
   file_path= 'somedata.csv', 
   poke_interval=300,
   dag=sales_dag
)

inital_task >> file_sensor_task >> report_task

```

<img width="400" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/32c83492-464f-4205-8b89-8fbe37b6b898">

# PTR
- if we want to check condition and dont want the DAG to fail we can use sensor.
- to check for a condition repeatedly
