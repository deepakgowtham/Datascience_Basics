# Operators
- Airflow operators represent a single task in a workflow. This can be any type of task from running a command, sending an email, running a Python script, and so on. Typically Airflow operators run independently - meaning that all resources needed to complete the task are contained within the operator.
- Generally, Airflow operators do not share information between each other. This is to simplify workflows and allow Airflow to run the tasks in the most efficient manner.
