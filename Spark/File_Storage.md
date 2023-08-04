# Serialization and Deserialization
- when file is stored programatically it is serialized into byte codes
- byte codes cant read through text editor, has to be read programatically
- files are stored in db in serialized form

# Object storage.
- Store the file as is in native format.
- files are distributed in different physical nodes.
- doesnt suppport transaction
- can be accesssed using HTTPS interface

# Block storage.
- File is split and stored in fixed sized blocks
- Suitable for applications which require high IOPS, database and transactional data.
- should be accessed using a program
- better performance when compared to object storage.
