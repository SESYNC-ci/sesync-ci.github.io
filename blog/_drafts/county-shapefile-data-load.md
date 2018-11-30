---
tags:
  - Database
  - GIS
authors:
  - Mike Smorul
---

# {{ page.title }}

These steps were done in Ubuntu 14.04 using the stock Postgresql 9.1
and PostGIS 9.1. Only configuration changes: Allow access on all db
server interfaces, and allow logins from our subnet

1. Download TIGER shapefile from:
   ftp://ftp2.census.gov/geo/tiger/TIGER2013/COUNTY/
2. Create your database. The database used here is part of a larger
   public database available to all sesync researchers so we create
   two roles, one an owner for people publishing tables and data, and
   another, public role that has read-only access.

    postgres=# create ROLE sesync_public;
    CREATE ROLE
    postgres=# create ROLE public_owners;
    CREATE ROLE
    postgres=# create DATABASE public_data with OWNER public_owners;
    CREATE DATABASE
    postgres=# create ROLE msmorul WITH LOGIN PASSWORD 'ultrasecretpassword';
    CREATE ROLE
    postgres=# grant public_owners to msmorul;
    GRANT ROLE
    postgres=# ALTER ROLE msmorul INHERIT
    ALTER ROLE
    postgres=# GRANT ALL PRIVILEGES ON DATABASE public_data TO public_owners;
    public_data=# alter role public_owners with login;
    ALTER ROLE
    postgres=# GRANT CONNECT ON DATABASE public_data TO sesync_public;
    GRANT
    public_data=# GRANT USAGE ON SCHEMA public TO sesync_public;
    GRANT
    public_data=# GRANT SELECT ON ALL TABLES IN SCHEMA public TO sesync_public;
    GRANT
    create ROLE sesync WITH LOGIN PASSWORD 'research';
    CREATE ROLE
    public_data=# GRANT sesync_public TO SESYNC;
    GRANT ROLE
    public_data=# ALTER ROLE sesync INHERIT;
    ALTER ROLE
    postgres=# ALTER ROLE sesync_public WITH LOGIN;     
    ALTER ROLE


3. Now, modify your database and enable spatial extensions

    public_data=# CREATE EXTENSION postgis;
    CREATE EXTENSION
    public_data=# CREATE EXTENSION postgis_topology;
    CREATE EXTENSION

4. Convert your shapfile

    $ shp2pgsql -W LATIN1 census/tl_2013_us_county.shp 2013-county > import.sql

5. Load into db

    $ psql -f import.sql -d public_data

5. Point qgis at the server and see if you can connect
