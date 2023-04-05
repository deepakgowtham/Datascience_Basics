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
