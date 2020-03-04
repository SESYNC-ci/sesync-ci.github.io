---
title: Databases, huh? What are they good for
tags:
  - Reproducible Research
  - data
  - SQL
  - Database
author: khondula
---


Synthesis research involves assembling multiple data sets from different sources. Integrating those data into a format that facilitates exploration, visualization, and eventual analysis is often the most time-consuming and tedious part of the research process&mdash;however, careful attention and a little bit of strategy at early stages can pay huge dividends later on. 

![thinking](/assets/images/db-thinking.png)

A common question that inevitably arises when faced with compiling such heterogeneous data is: "do I need a database?" For researchers that are used to dealing with flat files like .csv or Excel spreadsheets, the overhead and time investment of setting up a formal relational database may seem daunting&mdash;especially if it requires hosting on a server and learning new software or programming languages like SQL. Whereas leveraging the *principles* of database design will be beneficial for most any data workflow (e.g. [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf) and [normalization](https://en.wikipedia.org/wiki/Database_normalization) to reduce redunancies), we don't necessarily recommend setting up a database for every project&mdash;many analyses can be handled just as smoothly by joining tabular data stored in multiple 'tidy' spreadsheets, and using software packages designed for spatial analysis, dates and times, text data, and/or large files. This post is intended to help navigate that decision as you craft your workflow and figure out whether you want to make use of SESYNC's database server. For this purpose, the term "database" means a relational database management system where data is structured in tables and accessed and manipulated through Structured Query Language (SQL).

Here are some aspects to consider:

**How big?** 

Perhaps the most common need that motivates database use is scalability, based on encountering limitations on file size or memory usage. Certain file types have size limits, such as a maximum number of rows for MS Excel files, or you may be trying  to use more than the amount of data that can be loaded into memory at once in a program like RStudio. Sometimes these issues can be resolved by using slightly different functions for reading in files (e.g. `fread` vs. `read.csv` in R), running code on SESYNC's RStudio server or [compute cluster](https://cyberhelp.sesync.org/faq/interactive-slurm-jobs.html) (which have much more memory than a typical laptop), or by [parallelizing code](https://cyberhelp.sesync.org/blog/using-rslurm-parallel.html) to run as separate tasks. Databases have essentially no inherent software-imposed size limitations and only read requested parts of data into memory. 

**Collaborating**

When multiple people are using data at the same time, it can be confusing and error prone to rely on emailing files to each other, or even difficult sometimes to avoid synchronization and access issues for files stored on a network or cloud server such as Google Drive, or Dropbox. Good communication and planning among team members can go a long way, as well as proper attention to [file naming](https://speakerdeck.com/jennybc/how-to-name-files), but you may want to consider a database to handle the problem of making sure everyone is working with the most up-to-date version of the data. A database management system can also restrict read and/or write access for particular tables or users. 

**Following the rules**

Setting up a database requires precisely defining the type of data that goes into each column of a table (e.g. text vs numeric, only unique values, no null values) and it will strictly enforce those constraints. Although this means you can't conveniently represent missing data as "NA" in a column of numbers, this guaranteed reliability can help prevent and catch bugs in your workflow. 

**Nested Data**

Another criteria that can be specified is how data in columns of different tables relate to each other. This aspect is particularly useful when there are many nested, hierarchical, or varying units of analysis to be joined such as data about individuals, households, counties, and schools. A properly designed database will force you to be explicit in identifying those levels in multilevel data and the relationships between them. Such explicit identification can expose and clarify unanswered questions and even suggest analytic avenues that may otherwise have remained opaque.

**Space and time queries**

Most database systems can execute standard mathematical operations within SQL queries, but PostgreSQL can also peform functions on geometric and timestamp data types such as calculating the area of a polygon or the duration of a time interval between two dates. Using the extension PostGIS with a PostgreSQL database also enables the use of geographic data (e.g. shapefiles, rasters) and spatial queries such as selecting all points within a certain buffer distance of another object. 


If your Pursuit team wants to set up a database, email cyberhelp@sesync.org to get the process started. The data science team is available to iterate and consult on designing the structure of tables and how to efficiently populate them. Reach out early and often so we can help avoid bottlenecks and develop an appropriate data management strategy!


See also:

* Quickstart guide [Connecting to SESYNC's database server](https://cyberhelp.sesync.org/quickstart/connect-to-a-database.html)
* SESYNC's [Intro to databases lesson](https://cyberhelp.sesync.org/introdb-lesson/)
* USGS blog post [Working with pretty big data in R](https://waterdata.usgs.gov/blog/formats/)
* [Situations where SQLite works well](https://www.sqlite.org/whentouse.html)

