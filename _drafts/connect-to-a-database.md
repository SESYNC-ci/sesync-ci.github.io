This Quick Start guide will walk you through establishing a connection
to a database on SESYNC's server. Access to your pursuit's relational
database on the server requires communication across a network.
Therefore, it involves a server application (PostgreSQL, MySQL) and a
client application (RStudio, Jupyter, command line, etc.), and
connection credentials for your particular database.

Each server maintained by SESYNC is identified by its host name (for
example “xyz.research.sesync.org”). Each database on a server has a
unique name, and only specific users known to the server are allowed
password protected access. These instructions are specifically for a
PostgreSQL served database, but analagous instructions apply to a MySQL
served database.

The configuration file (which stores host name, user name, and password)
is created for each team by the cyberinfrastructure staff. This keeps
the information you don’t want to share private, and means you don’t
have to constantly enter host URLs, user names, and passwords. It will
look like this:

    [service_name]
    host=xyz.research.sesync.org
    dbname=%DATABASE_NAME%
    user=%YOUR_ROLE%
    password=%PASSWORD%

NOTE: Spaces are not allowed in this file.

The database client reads this file to verify your credentials.
Instructions for establishing a connection via RStudio, Jupyter, or the
command line are below.

### Access from RStudio

    # load RPostgres R package
    library("RPostgres")
    library("DBI")

The connection can be established using:

    # open database connection 
    mydb <-  DBI::dbConnect(RPostgres::Postgres(), service = "service_name")

NOTE: The password will be retrieved from the appropriate line in the
file ~/.pg\_service.conf.  
<https://www.postgresql.org/docs/9.0/libpq-pgservice.html>

Now a query can be created to retrieve data from the database:

    # list the tables in the database
    dbListTables(mydb)

    # create a query
    q1 <- dbGetQuery(mydb, "SELECT * FROM MyTable;")

Replace "MyTable" with the name of the table you want to access.  
NOTE: To rerun the dbGetQuery and reassign the result, you must first
clear the existing result using the following code: `dbClearResult(q1)`

When finished, disconnect from the database.

    # disconnect from the database
    DBI::dbDisconnect(mydb)

### Access from Jupyter

    # load psycopg2 Python package
    import psycopg2

    # load Pandas Python pagkage for using dataframes
    import pandas as pd

The connection can be established using:

    # open database connection 
    mydb2 = psycopg2.connect("service=service_name")

NOTE: The password will be retrieved from the appropriate line in the
file ~/.pg\_service.conf.

Now a query can be created to retrieve a table from the database:

    # list the tables in the database
    cur = mydb2.cursor()
    cur.execute("""SELECT table_name FROM information_schema.tables
           WHERE table_schema = 'public'""")
    for table in cur.fetchall():
        print(table)

    # create a query and read results into a dataframe
    df2 = pd.read_sql('SELECT * FROM MyTable;', con=mydb2)

Replace "MyTable" with the name of the table you want to access.

When finished, disconnect from the database.

    # disconnect from the database
    mydb2.close()

### Access from Command Line (bash shell)

Secure connection to the server is via SSH.

    # type in the connection info
    ssh %SESYNC_USERNAME%@ssh.sesync.org

NOTE: replace "%SESYNC\_USERNAME%" with your SESYNC user name.  
Then type in your password when prompted. NOTE: you won't see any typing
going on so type carefully!  
You should now be connected to the gateway server via SSH.

Now you need to log in to the PostgreSQL database using the host name,
and group database name.  
You will need to copy the ~/.pg\_service.conf configuration file to the
home directory on the gateway server.

Then the connection can be established using:

    # type in the postgreSQL command 
    psql -h sesync-postgis01 %DATABASE_NAME% 

Replace "%DATABASE\_NAME%" with the name of your database. Then type in
your password when prompted. The psql prompt will appear and look like
`"%DATABASE_NAME%=>"`. You should now be connected to your database.

Now a query can be created to retrieve a table from the database:

    # to list all of the tables, views, and sequences in the database, type 
    \d

    # to view the contents of a table 
    SELECT * FROM MyTable;

Replace "MyTable" with the name of the table you want to access.

When finished, disconnect from the database.

    # to exit the psql program, type 
    \q

To close the SSH connection when you are done, type exit and then press
ENTER.  
To close the bash shell, type exit and then press ENTER.
