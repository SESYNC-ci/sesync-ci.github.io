---
title: Connecting RStudio Server or Desktop to a database? 
category: FAQ
tags:
  - infrastructure
  - account
---

# Connecting RStudio Server or Desktop to a database 

Access to a MySQL or PostgreSQL database from within R requires a database client and connection parameters (including a password) for the particular database you wish to access. This FAQ explains a recommended configuration that allows R to access a database on the SESYNC infrastructure. The instructions below are specifically for a PostgreSQL database, but analagous instructions apply to MySQL.

## Example

Each database server maintained by SESYNC is identified by its hostname, each database on a server has a unique name, and only specific users known to the database server are allowed password protected access. Suppose the server is "xyz.research.sesync.org",  the database name is "abc", an allowed user is "abc_owner", and the password is "abc_passwd".

A template for a script that securely connects to a PostgreSQL database might go something like:

``` r
library(RPostgreSQL)

con <- dbConnect(PostgreSQL(),
    host = 'xyz.research.sesync.org',
    dbname = 'abc',
    user = 'abc_owner',
    password = .rs.askForPassword('Enter password:'))

# code referrencing "con"
# see for example, https://cran.r-project.org/web/packages/dbplyr/vignettes/dbplyr.html

dbDisonnect(con)
```

The call to "dbConnect()" provides the connection parameters (host, database name, user, and password) as individual arguments, and uses an RStudio feature to allow the user to securely enter the password. Critically, the password is not written in the script, where it would likely be too widely distributed. Two drawbacks to this approach are:

1. a user must enter the password every time, and
2. the connection parameters are hard coded into this particular R script.

A better approach would be to store the connection parameters in a configuration file recognized by any database client (e.g RPostgreSQL, psql, or pgAdmin).

## Configuration File

Connection parameters can be stored in a separate plain text file to be read by the database client. PostgreSQL clients look for a connection service file in the location "~/.pg_service.conf" by default or anywhere specified by the environment variable PGSERVICEFILE. MySQL clients similarly look for an options file. If the example above belonged to a SESYNC researcher with shared data directory "/nfs/abc-data/", a connection service file could be created with the R command "file.edit('/nfs/abc-data/pg_service.conf')" and saved with the entry

[abc]
host=xyz.research.sesync.org
dbname=abc
user=abc_owner
password=abc_passwd


It is essential that any configuration file be readable only by its owner: from within R, secure the file imediately after creating it with "Sys.chmod('/nfs/abc-data/pg_service.conf', '0600')". Any RStudio project that will use database "abc" should then include a ".Renviron" file with the line

PGSERVICEFILE=/nfs/abc-data/pg_service.conf
An alternative for scripts that exist outside of an RStudio project is inclusion of the command "Sys.setenv(PGSERVICEFILE='/nfs/abc-data/pg_service.conf')". Once the RPostgreSQL client is able to find the connection service file, the connection can be established using just a service name (i.e. the text within "[...]"):

```r

library(RPostgreSQL)

con <- dbConnect(PostgreSQL(), dbname = 'postgresql://@/?service=abc')

# code referrencing "con"
# see for example, https://cran.r-project.org/web/packages/dbplyr/vignettes/dbplyr.html

dbDisonnect(con)
```

Here the string given for "dbname" is a connection URI missing all connection parameters except for the service name, which tells the client where to look the rest up in the connection service file.






