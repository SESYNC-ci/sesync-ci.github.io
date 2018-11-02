---
output: 
  html_document:
    keep_md: yes
category: quickstart
tags:
  - database
  - RStudio
  - Jupyter
  - command line
  - R
  - Python
  - shell
    
---

# How do I connect to a SESNYC database?

This Quick Start guide will walk you through establishing a connection to a database on SESYNC's server.  Access to your pursuit's relational database on the server requires communication across a network.  Therefore, it involves a server application (PostgreSQL, MySQL) and a client application (RStudio, Jupyter, command line, etc.), and connection credentials for your particular database.

Each server maintained by SESYNC is identified by its host name (for example “xyz.research.sesync.org”).  Each database on a server has a unique name, and only specific users known to the server are allowed password protected access. These instructions are specifically for a PostgreSQL served database, but analagous instructions apply to a MySQL served database.  

The configuration file (which stores host name, user name, and password) is created for each team by the Cyber Infrastructure staff.  This keeps the information you don’t want to share private, and means you don’t have to constantly enter host URLs, user names, and passwords.  It will look similar to this: 


```r
host = sesync-postgis01.research.sesync.org
dbname = "name_of_your_database"
user = "your_database_role"
password = "password_for_your_database"
```
The database client reads this file to verify your credentials.  Instructions for establishing a connection via RStudio, Jupyter, or the command line are below.  


### Access from RStudio


```r
# load RPostgres R package
library("RPostgres")
library("DBI")
```

The connection can be established using:


```r
# open database connection 
# replace "dbname" with the name of your database
# replace "dbrole" with your group's database role
mydb <-  DBI::dbConnect(RPostgres::Postgres(), host = "hostname", dbname = "dbname", user = "dbrole")

# NOTE: The password will be retrieved from the appropriate line in the file ~/.pgpass. 
# https://cran.r-project.org/web/packages/RPostgres/RPostgres.pdf
```

Now a query can be created to retrieve data from the database:


```r
# create a query
# replace "MyTable" with the name of the table you want to access
q1 <- dbGetQuery(mydb, "SELECT * FROM MyTable;")

# NOTE: To rerun the dbGetQuery and reassign the result, you must first clear the existing  
# result using the following code: dbClearResult(q1)
```

When finished, disconnect from the database.


```r
# disconnect from the database
DBI::dbDisconnect(mydb)
```


### Access from Jupyter


```python
# load psycopg2 Python package
import psycopg2

# load Pandas Python pagkage for using dataframes
import pandas as pd

```

The connection can be established using:


```python
# open database connection 
mydb2 = psycopg2.connect("host=sesync-postgis01.research.sesync.org dbname=name_of_your_database user=dbrole")

# NOTE: The password will be retrieved from the appropriate line in the file ~/.pgpass. 

```

Now a query can be created to retrieve a table from the database:


```python
# create a query and read results into a dataframe
df2 = pd.read_sql('SELECT * FROM MyTable;', con=mydb2)

```


### Access from Command Line (bash shell)

Secure connection to the server is via SSH.


```r
# type in the connection info
# NOTE: replace "sesync_username" with your SESYNC user name
ssh sesync_username@ssh.sesync.org

# Then type in your password when prompted.  NOTE: you won't see any typing going on so type carefully!
```

You should now be connected to the gateway server via SSH.  


Now you need to log in to the PostgreSQL database using the host name, and group database name.
You will need to copy the .pgpass configuration file from XXXX to the home directory on the gateway server.

Then the connection can be established using:


```r
# type in the postgreSQL command 
# replace "dbname" with the name of your database
psql -h sesync-postgis01 dbname 

# Then type in your password when prompted. 
# The psql prompt will appear and look like "dbname=>".
```

You should now be connected to your database.  


Now you can view contents of the database:


```r
# to list all of the tables, views, and sequences in the database, type 
\d

# to view the contents of a table 
SELECT * FROM table-name
```

To close the connection:


```r
# to exit the psql program, type 
\q
```
To close the SSH connection when you are done, type exit and then press ENTER.
To close the bash shell, type exit and then press ENTER.








