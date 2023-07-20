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

