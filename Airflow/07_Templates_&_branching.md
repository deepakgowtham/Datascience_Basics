# Templates
- allows substituting information during DAG run
- created using Jinja templates

## Templated BashOperator
```python
templated_command = """ 
  echo 'Reading {{ params.filename}}'  """

t1 =BashOperator (
 task_id ='template_task',
 bash_command= tempalted_command,
 params ={'filename' :'file.txt'},
 dag =ex_dag
)
```

<img width="338" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/019101ce-8180-4563-acbc-99364a2f0cec">
<br>
<img width="536" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/8000eb37-d23f-4b0e-828c-7e149555dc65">

- the output of the above variables are sting and not python datetime objects.

# Macros

<img width="543" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/67bad902-d7ce-49d1-b6e7-c53c00a47c3c">

# Branching
- Branching provides the ability for conditional logic within Airflow. Basically, this means that tasks can be selectively executed or skipped depending on the result of an Operator.
- one example BranchPythonOperator uses python_callable function to return the next task id or list of ids.

```python
from airflow.operators.python_operator import BranchPythonOperator

def branch_test(**kwargs):
   if int(kwargs['ds_nodash']) %2 ==0:
       return 'even_day_task'
   else
      retrun 'odd_day_task'

branch_task = BranchPythonOperator (
   task_id ='branch_task',
   dag=dag,
   provide_context=True, # True here tells airflow to provide access to runtime variables adn macros
   python_callable =branch_test
)
start_task >> branch_task >> even_day_task >> even_day_task2
branch_task >>odd_day_task >> odd_day_task2
```
<img width="511" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/82b3c5f8-4869-441c-9c54-36e84a852e17">
