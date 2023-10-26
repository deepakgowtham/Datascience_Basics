# Data center

- each data center will have different zones inside them.
- data will be stored parallelly in different zones.
- inside each zone there will be RAC's and inside RAC there will be clusters.
- load balancing between zones is automatically taken care
- Datacenter is placed in different **region** and **Geographies**
- Regions are geographies containing more than one datacenters.
- Geographies are defined by Geopolitical boundries, compliance needs
   1. Americas
   2. Europe
   3. Asia pacific
   4. Middle East

# Service types

<img width="769" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/c6075588-72bb-47e8-a9ea-786242389a41">

# Scaling
- Vertical scaling - Increasing the capacity of the individual machine
- Horizontal scaling  - adding additional machines to increase compute capacity.
- Auto scaling - Automatically increase compute capacity depending on need, traffic, and memory utilization.
    1. scaling out - Adding more servers
    2. Scaling in - remove servers
 

# Types of Cloud servers

##Virtual Machines

## Containers
- indedendent consistent and isolated execution environment 
- they dont require any os as they just contain minimum dependencies to run the app
<img width="239" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/8ee23eb5-7016-4e71-b702-ff933a8c1f7e">

## Serverless 
- ability to run an application without creating, configuring nor maintaining a server.
- break application into different smaller pieces
