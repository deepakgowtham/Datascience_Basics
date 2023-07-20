# Airflow 

## Airflow Intro
- Open source tool to progamaticaly author devlop and schedule workflows.
- Workflow = schedule of taks that has definite start and end. 
- Airflow's extensible framework helps connect to all the technologies.
- Web interface to manage the state of workflow.

### Architecture.
- Main componenets are 
 1. Scheduler is an orchestrator which helps to define how to schedule, where to run to the task. There is an executor built in with in the scheduler. 
    executor can be tool like kubenetes.
 3. Webserver - user interface
 4. worker
 5. Database to store meta data information
 6. DAG gets written in git repo and gets synced with Airflow instance


![image](https://user-images.githubusercontent.com/47908891/229995984-a0373b32-ae39-4886-81a2-dedf82fa1f5f.png)

## DAG Directed Acyclic Graph

- Conceptual representation of series of activities or collection of tasks to run with their dependecies and relationships.
- No loops possible(Acyclic)
- Defined in python and placed in airflow DAG folder
- Directed Acyclic Graph, has the following attributes:
  1. It is Directed, meaning there is an inherent flow representing the dependencies or order between execution of components. These dependencies (even implicit ones) provide context to the tools on how to order the running of components.
  2.  A DAG is also Acyclic - it does not loop or repeat. This does not imply that the entire DAG cannot be rerun, only that the individual components are executed once per run

 Airflow DAG's
 - written in python, can also include other languages like shell script
 - contains tasks may contain operator, sensor
 - contains dependency explicitly or implicitly
```python
from airflow.models import DAG
from datetime import datetime

default_argument ={     
 'owner' :'deep',
  'email': 'abc@abc.com',
 'start_date' : datetime(2023, 7,17) # earliest datetime the dag can be run
 'retries' : 2
 }

etl_dag =DAG('etl_workflow', default_args=default_arguments)
# etl_dag == variable name to change any parameters
# etl_workflow == name of the dag or dagid
```

# Run a task from Shell

```
airflow run <dag_id> <task_id> <start_date>

airflow list_dags #gives list of all defined dags
# start airflow werbserver in port 
airflow webserver -p 9090
```
