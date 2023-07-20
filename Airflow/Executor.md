# Executors
- In Airflow, an executor is the component that actually runs the tasks defined within your workflows.
- Each executor has different capabilities and behaviors for running the set of tasks.
- Some may run a single task at a time on a local system, while others might split individual tasks among all the systems in a cluster.
- A few examples of executors are the
-  1. SequentialExecutor,
   2. the LocalExecutor,
   3. the CeleryExecutor.
-  can also create your own executor if required

# Sequential executor.
- The SequentialExecutor is the default execution engine for Airflow.
- It runs only a single task at a time. This means having multiple workflows scheduled around the same timeframe may cause things to take longer than expected.
- The SequentialExecutor is useful for debugging as it's fairly simple to follow the flow of tasks and it can also be used with some integrated development environments (though we won't cover that here). The most important aspect of the SequentialExecutor is that while it's very functional for learning and testing, it's not really recommended for production due to the limitations of task resources.

# Local Executor
- The LocalExecutor is another option for Airflow that runs entirely on a single system.
- It basically treats each task as a process on the local system, and is able to start as many concurrent tasks as desired / requested / and permitted by the system resources (ie, CPU cores, memory, etc).
- This concurrency is the parallelism of the system, and it is defined by the user in one of two ways -
-  either unlimited, or limited to a certain number of simultaneous tasks.
-  Defined intelligently, the LocalExecutor is a good choice for a single production Airflow system and can utilize all the resources of a given host system.


# Celery Executor.
- The Celery executor is a general queuing system written in Python that allows multiple systems to communicate as a basic cluster.
- Using a CeleryExecutor, multiple Airflow systems can be configured as workers for a given set of workflows / tasks.
- can add extra systems at any time to better balance workflows.
- The power of the CeleryExecutor is significantly more difficult to setup and configure. It requires a working Celery configuration prior to configuring Airflow, not to mention some method to share DAGs between the systems (ie, a git server, Network File System, etc). While it is more difficult to configure, the CeleryExecutor is a powerful choice for anyone working with a large number of DAGs and / or expects their processing needs to grow.

  # Find the executor

  <img width="507" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/964f408d-e0a7-4659-b858-16f9a9630971">

  <img width="520" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/01276f17-e81c-489a-9b65-eafb1351dfa9">

