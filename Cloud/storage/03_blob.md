# Blob
- masively scalable object store for text and binary data.
- zure blob storage is an object storage solution optimized for storing massive amounts of unstructured data, such as text or binary data.
- Blob storage is ideal for serving images or documents directly to a browser, including full static websites,
- storing files for distributed access, streaming video and audio, storing data for backup and restoration.
- Disaster recovery and archiving and storing data for analysis by on premises or Azure hosted service.

## Types of blobs
1. **Block blobs** are used to hold text or binary files up to 5 terabytes, 50,000 blocks of 100 megabytes in size. 
    - The primary use case for block blobs is the storage of files that are read from beginning to end, such as media files or image files for websites. And they are named block blobs because files larger than 100 megabytes must be uploaded a small blocks. These blocks are then consolidated or committed into the final blob
2. **Page blobs** are used to hold random access files up to 8 terabytes in size.
   - Page Blobs are used primarily as the backing storage for the virtual hard disks or VHDs used to provide durable discs for Azure virtual machines or Azure VMs. They are named page blobs because they provide random read write access to 512-byte pages. 
3. **append blobs** are made up of blocks like block blobs, but they are optimized for append operations.
   -These blobs are frequently used for logging information from one or more sources into the same blob, and to give an example, you might write all your trace logging to the same append blob for an application running on multiple VMs.

- Premium storage account type is for block blobs and append blobs. This is recommended for scenarios with high transaction rates, scenarios that use smaller objects, or those requiring consistently low storage latency.
- For blobs, file shares, and queues use Standard General purpose v2
