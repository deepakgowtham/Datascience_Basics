# Operators
- Airflow operators represent a single task in a workflow. This can be any type of task from running a command, sending an email, running a Python script, and so on. Typically Airflow operators run independently - meaning that all resources needed to complete the task are contained within the operator.
- Generally, Airflow operators do not share information between each other. This is to simplify workflows and allow Airflow to run the tasks in the most efficient manner.

## Operators PTR
- Operators dont run in the same directory, if we want to run in a specific location we need to specify it.
- May require env variables to run

# Bash Operator
- Executes given bash command
- run in a tmp directory and is cleaned up after execution
- can specify environment variables
- can be difficult to run using elevated privilages.

<img width="244" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/46f583fb-0cb5-4dda-ac7d-56ade50bdf65">

```python
from airflow.operators.bash_operator import BashOperator
example_task =BashOperator( task_id ='bash_exmp',
  bash_command='echo 1'
  dag =dag
)
# defining multiple tasks
consolidate = BashOperator(
    task_id='consolidate_task',
    bash_command='consolidate_data.sh',
    dag=analytics_dag)
push_data = BashOperator(
    task_id='pushdata_task',
    bash_command='push_data.sh',
    dag=analytics_dag)

```
# Tasks
- Tasks are Instances of Operators
- assigned to variable but within airflow it is referred using task_id and not variable names.
-  Task dependenices (defined using bitshift operator)
-   1. Upstream task  >> upstream operator
    2. Downstream task << downstream operator


<img width="283" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ac6e1269-e27f-416f-9aef-ace03bda5979">
<img width="185" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/2485bc01-3630-4f80-a07f-b7da2a2dd7f1">


<img width="544" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ff4f5009-56df-4c13-91a0-6a0d35cc8ea4">

# Python Operator
- Runs a python function or callable method
- can pass arguments
  ``` python
  from airflow.operators.python_operator import PythonOperator
  def  printme():
    print('log this line')
  python_task = PythonOperator(
   task_id='simple_print',
   python_callable= printme,
   dag=example_dag
  )
  ```
  - PythonOperator supports arguments both keyword and positional
  - pass the arguments using op_kwargs dictionary in the task
 
 ```python
 def sleep(length_of_time):
    time.sleep(length_of_time)
    print(f"slept for {length_of_time} seconds")
 sleep_task =PythonOperator(
      task_id='sleep',
      python_callable =sleep,
      op_kwargs= {'length_of_time': 5}
      dag =example_dag
    )
```

# Email operator
- can send HTML email and attachments
- email server should be configured in airflow.

```python
from airflow.operators.email_operator import EmailOperator

email_task =EmailOperator(
   task_id='email_sales_report',
   to='sales_manager@abc.com',
   subject='Automated report',
   html_content='Attached is sales report',
   files='latest_Sales.xlsx',
   dag=example_dag
)
```
