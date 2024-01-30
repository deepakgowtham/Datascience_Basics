- All that is stored in azure is encrypted using Storage Service Encryption SSE 256 bit AES cypher.
- Audit using storage analytics service. check storage analystics log where every operation is logged.

- For vm disk it encrypts using azure disk encryption
- For windows images using bit locker and for linux it uses DM-script

# RBAC

- Azure Storage supports Azure Active Directory and role-based access control (RBAC) for both resource management and data operations
- You can assign RBAC roles to security principles that are scoped to the storage account.  
- Active Directory is supported for data operations on Blob and Queue storage.

- Microsoft Azure Storage accounts can create authorized apps in Active Directory to control access to the data in blobs and queues. For other storage models, clients can use a shared key, or shared secret.
- Azure Storage supports Azure Active Directory and role-based access control (or RBAC) for both resource management and data operations. You can assign RBAC roles that are scoped to 
1. A storage account
2. An individual container or queue
3. A subscription
4. A resource group 

# Keys
In Azure storage accounts, shared keys are called storage account keys

# Authorized applications
Azure Storage accounts can create authorized apps in Active Directory to control access to the data Queues and Blobs.
