---
# Created by Rachael Blake and Ian Carroll on 2018-11-19
title: Connect to a Database Server
tags:
  - database
  - R
  - Python
  - shell
---

This Quick Start guide will walk you through establishing a connection
to a database on SESYNC's server. Access to your pursuit's relational
database management system (RDBMS) requires communication between a
server application (PostgreSQL or MySQL) and a client application
(RStudio, Jupyter, psql, etc.).

Each database server maintained by SESYNC is identified by its host
name, let's say your database is stored on a server with host name
“pg.research.sesync.org”. Each database on a server has a unique name,
and only specific users known to the server are allowed password
protected access. The instructions below are specific to a PostgreSQL
database, but analagous instructions apply to a MySQL database.

When the Cyberinfrastructure staff creates a database, we will share a
configuration file with the host name, user name, and password. This
keeps the information you don’t want to share private, and means you
don’t have to constantly enter host URLs, user names, and
passwords. If you ever move your database, there's also only one place
you need to update the configuration.

For everything below, suppose your project involves the effect of
green spaces on urban heat islands and has the short title "Cool
Trees". Your configuration will be in the file
"/nfs/cooltrees-data/.pg_service.conf", and will look something like
this (no that's not a real password):

```bash
[cooltrees]
host=pg.research.sesync.org
dbname=cooltrees
user=cooltrees
password=p3948htp3ufp4p238hncer8cfwfgnc9q37
```

NOTE: Spaces are not allowed in this file.

The database client reads this file to verify your
credentials. Instructions for establishing a connection via RStudio,
Jupyter, or the command line are below.

### Access from [RStudio Server](https://rstudio.sesync.org)

The [RPostgres](https://CRAN.R-project.org/package=RPostgres) package is the
[DBI](https://CRAN.R-project.org/package=DBI) compliant library you want.

```r
library("RPostgres")
```

The connection can be established by refering the the "service" in the
configuration file (the value between square brackets):

```r
mydb <-  dbConnect(Postgres(), service = "cooltrees")
```

NOTE: The password will be retrieved from the appropriate line in the
file "\~/.pg_service.conf". You need to create this file by copying it
your research data directory, or you can set the
[PGSERVICEFILE](https://www.postgresql.org/docs/9.0/libpq-pgservice.html)
environment variable to "/nfs/cooltrees-data/.pg_service.conf".

Now a query can be created to retrieve data, say the `neighborhoods`
table from your database on urban green spaces:

```r
qry <- dbGetQuery(mydb, "SELECT * FROM neighborhoods LIMIT 10")
```

The `qry` result is a `data.frame`, with values downloaded from the
database server. You can list all available tables, if you're diving
into a new database for the first time:

```r
dbListTables(mydb)
```

NOTE: To rerun `dbGetQuery` and reassign the result, you must first
clear the existing result using the following code: `dbClearResult(q)`

When finished, disconnect from the database.

```r
dbDisconnect(mydb)
```

### Access from [Jupyter Server](jupyter.sesync.org)

The [psycopg2](https://pypi.org/project/psycopg2/) package is a
popular wrapper for the interface to PostgreSQL databases. The
[pandas](https://pypi.org/project/pandas/) package is used for
manipulating tabular data in Python.

```python
import psycopg2
import pandas as pd
```

The connection can be established using:

```python
mydb = psycopg2.connect("service=cooltrees")
```

NOTE: The password will be retrieved from the appropriate line in the
file "\~/.pg_service.conf". You may need to copy it from your research
data directory or set the appropriate [environment
variable](https://www.postgresql.org/docs/9.0/libpq-pgservice.html).

Pandas will read the results of an SQL query of the database into a
`DataFrame`:

```python
df = pd.read_sql('SELECT * FROM neighborhoods LIMIT 10', con=mydb)
```

If you're diving into a new database for the first time, you may want to
list all available tables:
  
```python
cur = mydb.cursor()
cur.execute("""
  SELECT table_name FROM information_schema.tables
  WHERE table_schema = 'public'""")
for table in cur.fetchall():
  print(table)
```

When finished, disconnect from the database.

```python
mydb.close()
```

### Access from local RStudio or Python via SSH Tunneling
  
If you would like to use a local installation of RStudio or Python
on your own computer, you need to establish a secure connection via
SSH Tunneling. The purpose of the "tunnel" is to make a server you can
connect to (ssh.sesync.org) route connection requests to the database
server, which you cannot reach directly from your local RStudio or
Python installation.

You will need the host name from your ".pg_service.conf" file, in
place of `pg.research.sesync.org`. Open a command prompt or
terminal on your machine and, also supposing `jdoe` is your SESYNC user
name, establish the tunnel with:

```bash
ssh -L 5433:pg.research.sesync.org:5432 jdoe@ssh.sesync.org
```

Enter your SESYNC password when prompted. If successful, your terminal
will display something like:

```bash
$ ssh -L 5433:pg.research.sesync.org:5432 jdoe@ssh.sesync.org
Ubuntu 16.04.5 LTS
Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-139-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
##############################################################################
###                                                                        ###
###   SESYNC SSH Gateway                                                   ###
###   * Do not use this machine for processing                             ###
###   * Store all data and source code in your project space /nfs/PROJECT  ###
###   * See https://cyberhelp.sesync.org for more information              ###
###                                                                        ###
##############################################################################
Last login: Fri Nov 16 14:52:20 2018 from 192.168.192.177
jdoe@sshgw02:~$ 
```

From this machine, you can use the command line client to confirm
you have access to the database:
  
```bash
psql service=cooltrees
```

More on `psql` below, what you really want though is to use your
secure connection to the SESYNC database server from the RStudio or
Python instalation on your own computer. The only thing missing is
the connection information, so copy the
".pg_service.conf" file to your own computer and edit the
server information to point at the tunnel:

```bash
[cooltrees]
host=localhost
port=5433
dbname=cooltrees
user=cooltrees
password=p3948htp3ufp4p238hncer8cfwfgnc9q37
```

On macOS, save this file in your home directory. On Windows, create
the folder `%APPDATA%\postgresql`, and save the configuration file
there. Establishing a connection from your local installation of
RStudio or Python should now work as above. NOTE: Reading data from
the database server will be slow if you are on a slow internet
connection.

### Access from the Command Line

The `psql` command line utility is available for your use on
ssh.sesync.org. From the Command Prompt (Windows) or Terminal (macOS)
on your computer, the SESYNC user `jdoe` would jump on the server
with:

```r
ssh jdoe@ssh.sesync.org
```

Then type in your password when prompted--you won't see any typing
going on so type carefully! You should now be connected to the gateway
server via SSH.

Now you need to log in to the PostgreSQL database using the host name, database
name, and database password, which is all in a ".pg_service.conf" file created
by SESYNC staff.You may need to copy it from your research data directory or set
the appropriate [environment
variable](https://www.postgresql.org/docs/9.0/libpq-pgservice.html).

Launch `psql` specifying the service. Your shell will look something like:

```bash
jdoe@sshgw02:~$ psql service=cooltrees
psql (9.5.14, server 9.3.24)
SSL connection (protocol: TLSv1.2, cipher: DHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

cooltrees=> 
```
  
The client allows "backslash commands" and SQL statements. An example
backslash command is "\d", which describes the database.

```bash
cooltrees=> \d
```

Again supposing a table `neighborhoods` exists, you could directly
enter the SQL statement or query to print all columns of its first 10
records.

```bash
cooltrees=> SELECT * FROM neighborhoods LIMIT 10;
```

When finished, disconnect from the database.

```bash
cooltrees=> \q
```

To close the SSH connection when you are done, type `exit` press
ENTER. To close the shell, simply close the Command Prompt or Terminal
application.
