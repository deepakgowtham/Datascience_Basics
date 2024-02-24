# Blob
- Binary Large OBject
- Masively scalable object store for text and binary data.
- Azure blob storage is an object storage solution optimized for storing massive amounts of unstructured data, such as text or binary data.
- Blob storage is ideal for serving images or documents directly to a browser, including full static websites,
- storing files for distributed access, streaming video and audio, storing data for backup and restoration.
- Disaster recovery and archiving and storing data for analysis by on premises or Azure hosted service.
- Data lives in a container in blob storage, we can create unlimited number of container in a storage account and each container can contain unlimted number of files.
- Containers are flat. They don't support any kind of nesting or hierarchy. Containers cannot contain other container
- Blobs and container support metadata in form name-value string pairs, metadata can contain anything.
- Blob storage API is rest based, can be used to create and delete blob containers, upload and download blob data list the blob in a container.
- Blobs in a container is flat doesnt support folders within container,however we can provide names to make it look like its in a folder. This feature is called virtual directories

  
<img width="584" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7c72a39b-748a-4d21-af69-40219d23c095">

<img width="367" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1a2fc1c4-f0be-46b8-afa8-02b40876a192">
  
- By default, all blobs require authentication to access. However, they can also be made public depending on requirements.

## Types of blobs
1. **Block blobs** are used to hold text or binary files up to 5 terabytes, 50,000 blocks of 100 megabytes in size. 
    - The primary use case for block blobs is the storage of files that are read from beginning to end, such as media files or image files for websites. And they are named block blobs because files larger than 100 megabytes must be uploaded a small blocks. These blocks are then consolidated or committed into the final blob
      
<img width="428" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/4678313b-18ca-4347-bb4f-bcfef43158da">
   

2. **Page blobs** are used to hold random access files up to 8 terabytes in size.
   - Page Blobs are used primarily as the backing storage for the virtual hard disks or VHDs used to provide durable discs for Azure virtual machines or Azure VMs. They are named page blobs because they provide random read write access to 512-byte pages.
   - optimized for random access.
<img width="440" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ae016733-0076-48cc-bde8-6b17a127c28c">

3. **append blobs** are made up of blocks like block blobs, but they are optimized for append operations.
   
   -These blobs are frequently used for logging information from one or more sources into the same blob, and to give an example, you might write all your trace logging to the same append blob for an application running on multiple VMs.
   - maninly used for storing logs or writing streaming data
     <img width="440" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6f9ae06e-65eb-44c8-a2d1-60a8da1f785f">


- Premium storage account type is for block blobs and append blobs. This is recommended for scenarios with high transaction rates, scenarios that use smaller objects, or those requiring consistently low storage latency.
- For blobs, file shares, and queues use Standard General purpose v2

# Container
- A container organizes a set of blobs, similar to a directory in a file system. A storage account can include an unlimited number of containers, and a container can store an unlimited number of blobs.
