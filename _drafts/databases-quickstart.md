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

Each server maintained by SESYNC is identified by its host name (for example “xyz.research.sesync.org”).  Each database on a server has a unique name (for example “abc”), and only specific users known to the server (for example “abc_user”) are allowed password protected access. These instructions are specifically for a PostgreSQL served database, but analagous instructions apply to a MySQL served database.  

The configuration file (which stores host name, user name, and password) is created for each user by the Cyber Infrastructure team.  This keeps the information you don’t want to share private, and means you don’t have to constantly enter host URLs, user names, passwords.  It will look similar to this: 


```r
host = xyz.research.sesync.org
dbname = abc
user = abc_user
password = abc_passwd
```
The database client reads this file to verify your credentials.  Instructions for establishing a connection via RStudio, Jupyter, or the command line are below.  


### Access from RStudio


```r
# load RPostgreSQL R package
library("RPostgreSQL")
```

The connection can be established using:


```r
# open database connection 
mydb <-  dbConnect(PostgreSQL(), dbname = 'postgresql://@/?service=abc')
```
Here the string given for “dbname” is a connection URI missing all connection parameters except for the database name, which tells the client where to look the rest up in the connection service file.  
For example, see https://cran.r-project.org/web/packages/dbplyr/vignettes/dbplyr.html

Now a query can be created to retrieve data from the database:


```r
# create a query
q1 <- dbSendQuery(mydb, "select * from MyTable;")
  # NOTE: To rerun the dbSendQuery and reassign the result, you must first clear the existing  
  # result using the following code: dbClearResult(q1)
```

The results of the database query can now be read into an R dataframe:


```r
# read results into a dataframe called "df1"
df1 <- fetch(q1, n=-1)

# disconnect from the database
dbDisonnect(mydb)
```


### Access from Jupyter


```python
# load psycopg2 Python package
import psycopg2

# load Pandas Python pagkage for using dataframes
import pandas as pd

```


```python
# create an object with the connection details
conn_str = "host={} dbname={} user={} password={}".format(host, database, user, passwd)

```

The connection can be established using:


```python
# open database connection 
mydb2 = psycopg2.connect(conn_str)

```

Now a query can be created to retrieve data from the database:


```python
# create a query and read results into a dataframe
df2 = pd.read_sql('select * from MyTable', con=mydb2)

```



### Access from Command Line (bash shell)

Secure connection to the server is via SSH with the following information.  


```r
    Host: ssh.sesync.org
    Username: %your SESYNC username%
    Password: %your SESYNC password%
    Port: 22
```


```r
# type in the connection info
ssh -p 22 username@ssh.sesync.org
```
Then type in your password when prompted.  NOTE: you won't see any typing going on so be careful!


The connection can be established using:


```r
# type in the postgreSQL command 
# replace "dbname" with the name of your database
# replace "username" with your username
psql dbname username
```
Then type in your password when prompted. The psql prompt will appear.



Now you can view data from the database:


```r
# to list all of the tables, views, and sequences in the database, type 
\z
```


```r
# to exit the psql program, type 
\q
```
To close the SSH connection when you are done, type exit and then press ENTER.
To close the bash shell, type exit and then press ENTER.








