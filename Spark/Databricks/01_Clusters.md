# Cluster types
- all purpose clusters
- job clusters cant be created manually only created by jobs, but can be created from workflows page
- cluster Pools - Ready to use idle vms that will be waiting to reduce cluster creation time.

<img width="467" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/17c4c323-a526-4c8e-adb8-a01419e236aa">

**Policies** - way to create clusters with predefined configuraiton.
- Admins can create cluster policy to simplfy cluster creation for users.
- Also to **Hide attributes, fix values and set default attributes.**
- Manage cost control
- standardize cluster configuration
- only available in premium tier
- definition is written as JSON.
  
<img width="265" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/d46823c3-e47e-4466-9fca-88da35d4db2c">

<img width="375" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/dbc19e3d-dbb2-4e0d-96c1-473ef90b284c">


# Cluster Configuration
- Single node - same node acts as both master and worker.- doesnt support horizontal scaling
- Multi node
#  Access Mode
- Single user -only one user access
- Shared access  - multiple user, only in premium  **process isolation** - one process cant see the data of other users.
- No isolation shared - multiple user access - compute and data is shared and even one user process can take up all the compute **NO isolation**

# Databricks Runtime
- Databricks Runtime
- Databricks Runtime ML
- Photon Runtime
- Databaricks runtime Light
  <img width="348" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ecf618e6-f2bf-480d-b4be-941071a3e52d">
# Auto termination
- clusters getting terminated after x minutes of inactivity default 120 minutes

# Auto Scaling
- scales between min and max nodes provided, not useful for streaming workloads

# Cluster VM Type/Size
- Memory optimized - for memory intensive application when we need cache lot of data in memory
- Compute optimized - when processing rate should be greater than input rate eg streaming applications.
- Storage Optimized - for use cases requiring high disk through puts
- General purpose - for enterprise application with in memory caching
- GPU accelareted - for Deep learning.

# Cluster Policy
- Admins can create cluster policy to avoid users creating very compute
- Like a template for compute creation.
- simplifies user interface, enables standard users to create clusters, achieves cost control, only available on premium tier



