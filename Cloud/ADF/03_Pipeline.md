# Pipeline
- Pipeline contains one or more activities.


## Move data from on prem to cloud
- move data from on prem to cloud using adf pipeline.
- data can be from onprem database or flat file.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/3f0a9624-0090-4be9-965e-85ed503dcce4)

## Copy data activity
- for source and sync we need to create a dataset.
- we need to create a linked service for a dataset as well
### Create a self hosted runtime.
- we a need a self hosted integration runtime for compute in on prem.
- Manage -> Integration Runtime -> New -> Azure, Self-hosted. -> self hosted.

  ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/37832b25-1f2f-42ba-a81f-9ee9b273ea6f)


  ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/6a33d733-9d96-4c76-809d-405437468dc2)

  Download and install integration runtime.-> only windows operating system is supported.
  For linux/unix we can uuse **AZCOPY** Supports only files

  ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/5d8d7d86-f315-447c-b505-e9199e84cbbb)

  - after installing the software provide the key from the integration runtime.
  - the run time should be available in the azure window
 
    ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/91330eb5-fe10-41cd-92d0-59df92caa8a8)

    ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/efad9986-5194-45fb-9dd3-ce2621ecbf23)


  ### Create a linked service
  - new -> database-> oracle
 
    ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/7c102b8e-c334-4db1-8db5-9bf5b7c78e05)

    ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1774997a-aee7-43d1-9c3f-3dae0f033a33)

    For password enter the password in keyvault
    - create the password in keyvault with a name and we can store it
    - to connect to keyvault we  need a linked service.
    - adf should have access to keyvault so to provide -> keyvault -> access policy -> select adf name.
   
      ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/dd347048-101b-4195-805a-b2488c2fed79)
      - craete linked service for target (blob storage)
     
       ![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/ccfea815-1779-469a-9981-96d82edd1564)
    ### Create a dataset.
    - Author -> dataset -> New dataset -> Oracle -> choose the name and linked service -> provide the table name and schema name.
    - create a dataset for the target  -> choose the linked server as blob storage.

    - click DEBUG to RUN without saving(publish)


  
