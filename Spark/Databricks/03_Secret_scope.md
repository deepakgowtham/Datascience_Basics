# create scope

- databricksurl/#secrets/createScope
- go to the vault and get the information from properties page under settings.

![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/1c2a51e0-1b1a-42dc-840a-54753092462f)


![image](https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/51664890-6a1c-402d-a798-9c475ec6efd5)

- create the user id and password under secrets in vault.

  ## connect to azure sql

  ```python
  jdbcUsername = dbutils.secrets.get(scope = "xx", key = "xx")
jdbcPassword = dbutils.secrets.get(scope = "xx", key = "xx")
jdbcHostname = 'xx.database.windows.net'
jdbcPort = 1433
jdbcDatabase ='xx'
jdbcurl= f'jdbc:sqlserver://{jdbcHostname}:{jdbcPort};database={jdbcDatabase}'
jdbctable ='xx.xx'

connectionProperties = {
"user" : jdbcUsername,
"password" : jdbcPassword,
"driver" : "com.microsoft.sqlserver.jdbc.SQLServerDriver"
}
```
