---
title: Database Connections
category: quickstart
---

### Databases

### MySQL Access

You may access MySQL resources provisioned by your group using R.

#
\# Load R MySQL Library and open a database connection
#
library("RMySQL");
mydb = dbConnect(MySQL(), user='DATABASEUSER', password='DATABASEPASSWORD', dbname='DATABASENAME', host='researchdb00.research.sesync.org');
#
\# Create a query
#
rs = dbSendQuery(mydb, "select * from MyTable;");
#
\# Load results into an R dataframe
#
data = fetch(rs, n=-1);    # Loads the result of the query into a dataframe called data

### PostgreSQL Access

You may access PostgreSQL resources provisioned by your group using R in a similar manner. Substitute "RPostgreSQL" for "RMySQL" in the libary statement and change MySQL() to PostgreSQL() in the mydb statement.


Load R PostgreSQL library and open a database connection (replace SQLDB with a your postgres server)

brary("RPostgreSQL");
db = dbConnect(PostgreSQL(), user='DATABASEUSER', password='DATABASEPASSWORD', dbname='DATABASENAME', host='SQLDB.research.sesync.org');

Create a query

 = dbSendQuery(mydb, "select * from MyTable;");

Load results into an R dataframe.

data = fetch(rs, n=-1);
      \# Loads the result of the query into a dataframe called data​

      Tips

- To rerun the dbSendQuery and reassign the result​ set, you must first clear the existing result set using the following statement: dbClearResult(rs)

- For more information on using Databases in R please see
  [http://cran.r-project.org/web/packages/dbConnect/dbConnect.pdf](http://cran.r-project.org/web/packages/dbConnect/dbConnect.pdf)
    and
      [http://www.r-bloggers.com/mysql-and-r/](http://www.r-bloggers.com/mysql-and-r/)
