---
title: Tests using the PostgreSQL FDW and PostGIS
category: blog
tags:
  - database
  - GIS
author: msmorul
---

These steps were done in Ubuntu 14.04 using the stock Postgresql 9.1
and PostGIS 9.1. Only configuration changes: Allow access on all db
server interfaces, and allow logins from our subnet. The county and
state shapefiles were loaded onto server 1 and the query attemps were
made from server 2.

Resources: https://wiki.postgresql.org/wiki/Foreign_data_wrappers

http://www.postgresql.org/docs/current/static/postgres-fdw.html

1. Setup

    postgres=# create database testdb;
    CREATE DATABASE
    postgres=# \c testdb
    You are now connected to database "testdb" as user "postgres".
    testdb=# CREATE EXTENSION postgres_fdw;
    CREATE EXTENSION
    testdb=# CREATE SERVER server_1 FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'ms1.research.sesync.org',port '5432', dbname 'public_data');
    CREATE SERVER
    testdb=# CREATE USER MAPPING FOR PUBLIC SERVER server_1 OPTIONS (password 'research', user 'sesync' );
    CREATE USER MAPPING
    testdb=# CREATE EXTENSION postgis;
    CREATE EXTENSION
    testdb=# CREATE EXTENSION postgis_topology;
    CREATE EXTENSION
    testdb=# CREATE FOREIGN TABLE county_foreign(gid integer, geom geometry, name varchar) SERVER server_1 OPTIONS (table_name '2013-county');
    CREATE FOREIGN TABLE
    testdb=# CREATE FOREIGN TABLE state_foreign(gid integer, geom geometry, name varchar) SERVER server_1 OPTIONS (table_name 'tl_2013_us_state');
    CREATE FOREIGN TABLE
    testdb=# select c.name from state_foreign as s, county_foreign as c where st_contains(s.geom,c.geom) and s.name = 'Maine';

2. Now lets look at the performance of the query, first on the test server and second on the source

    testdb=# explain select c.name from state_foreign as s, county_foreign as c where st_contains(s.geom,c.geom) and s.name = 'Maine';
                                     QUERY PLAN                                     
    ------------------------------------------------------------------------------------
     Nested Loop  (cost=200.00..1991.48 rows=2 width=32)
       Join Filter: ((s.geom && c.geom) AND _st_contains(s.geom, c.geom))
       ->  Foreign Scan on county_foreign c  (cost=100.00..137.90 rows=930 width=64)
       ->  Materialize  (cost=100.00..128.45 rows=7 width=32)
             ->  Foreign Scan on state_foreign s  (cost=100.00..128.41 rows=7 width=32)
    (5 rows)

3. Note high query cost, now on to the original DB:

    public_data=# explain select c.name from tl_2013_us_state as s, "2013-county" as c where st_contains(s.geom,c.geom) and s.name = 'Maine';
                                       QUERY PLAN                                     
    ------------------------------------------------------------------------------------
     Nested Loop  (cost=0.15..11.13 rows=614 width=8)
       ->  Seq Scan on tl_2013_us_state s  (cost=0.00..2.70 rows=1 width=244442)
             Filter: ((name)::text = 'Maine'::text)
       ->  Index Scan using i2 on "2013-county" c  (cost=0.15..8.42 rows=1 width=36592)
             Index Cond: (s.geom && geom)
             Filter: _st_contains(s.geom, geom)
    (6 rows)


