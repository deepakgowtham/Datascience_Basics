# Data center

<img width="473" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a86a77da-003a-4974-8a62-01f8be93d099">

Geography : India <br>
Regions : Central India, India south Central, South India <br>
Location : Chennai <br>
Availability zone : within a region there will be multiple availablity zone <br>

[Availability zone helpful link ](https://k21academy.com/microsoft-azure/az-900/az-900-microsoft-azure-architecture-region-availability-zone-geography/)


- Many Azure regions provide availability zones, which are separated groups of datacenters within a region. Availability zones are close enough to have low-latency connections to other availability zones. They're connected by a high-performance network with a round-trip latency of less than 2ms.
- data will be stored parallelly in different zones.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/96fbe6d5-6e0f-4282-a801-cc616e1ca95e)

- inside each zone there will be RAC's and inside RAC there will be clusters.
- load balancing between zones is automatically taken care for zonal redundent resources
- Datacenter is placed in different **region** and **Geographies**
- Regions are geographies containing more than one datacenters.
- Geographies are defined by Geopolitical boundries, compliance needs
   1. Americas
   2. Europe
   3. Asia pacific
   4. Middle East

## Redundancy
<img width="323" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/11e82d84-6a72-4307-bbc2-be035a0b21fc">

<img width="547" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f6f7262c-f5b9-487d-beb1-98ae58a05a03">

<img width="834" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/a2878909-76a1-4f2d-ad0f-a36748e24f3a">

Files will be synced asynchrously between regions/zones

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
