---
title: Databases what are they good for
tags:
  - Reproducible Research
  - data
author: khondula
---

Synthesis research involves assembling multiple data sets from differences sources. Integrating those data into a format that facilitates exploration, visualization, and eventual analysis can be one of the time consuming and tedious parts of the research process--however careful attention and a little bit of strategy at early stages can pay huge dividends later on. 

A common question that inevitably arises when faced with compiling such heterogeneous data is: "do I need a database?" For researchers that are used to dealing with flat files like .csv or Excel spreadsheets, the overhead and time investment of setting up a relational database may seem daunting--especially if it requires hosting on a server and learning new software or programming languages like SQL. Whereas leveraging the *principles* of database design will be beneficial for most any data workflow, we don't necessarily recommend setting up a database for every project--many analyses can be handled just as smoothly by joining tabular data stored in multiple spreadsheets, and using packages designed for spatial analysis, dates and times, text data, and/or large files. This post is intended to help navigate that decision as you craft your workflow and figure out whether you want to make use of SESYNC's database server. 

Here are some aspects to consider:

**How big?** 

Perhaps the most common need that motivates database use is scalability, based on encountering limitations on file size or memory usage. Certain file types have size limits, such as a maximum number of rows for MS Excel files, or you may be trying  to use more than the amount of data that can be loaded into memory at once in a program like RStudio. Sometimes these issues can be resolved by using slightly different functions for reading in files (e.g. `fread` vs. `read.csv`), running code on SESYNC's RStudio server or compute cluster (which have much more memory than a typical laptop), or by parallelizing code to run as separate tasks. Databases have essentially no size limits and only read requested parts of data into memory. 

**Collaborating**

When multiple people are using data at the same time, it can be confusing and error prone to rely on emailing files to each other, or even difficult sometimes to avoid synchronization and access issues for files stored on a network or cloud server such as Google Drive, or Dropbox. Good communication and planning among team members can go a long way, as well as proper attention to file naming (https://speakerdeck.com/jennybc/how-to-name-files), but you may want to consider a database to handle the problem of making sure everyone is working with the most up-to-date version of the data. A database management system can also restrict read and/or write access for particular tables or users. 

**Following the rules**

many hierarchical levels of analysis such as sites, households, individuals, counties. enforce reliability and structure of relationships among entities. data types are precisely defined and enforced (unique values, values that can't be null, missing data represented in a consistent way) which can help prevent or catch bugs in your workflow. 

**Space and time queries**

spatial and or temporal queries with postgis extension, just like summary stats

## 

Most of these issues aren't insurmountable without a hosted database and can often be handled just as smoothly by joining tabular data stored in multiple spreadsheets and using packages designed for spatial analysis, date and time handling, text data, and/or large files. 



Another solution could be using SQLite which is a database engine that just uses flat-files. SQLite is limited to only one user writing to the database files, but many users could query the files to obtain the data they need for a particular analysis. You could store the flat-files in a shared directory (such as a Dropbox folder or a Google Drive folder). Users would only then need to sync the data to their local machine to use the database. This does require a bit more communication between the users to ensure changes to the database are not being conflicted by another user. SQLite, however, is very easy to use as a whole and is less of a lift to get started than MySQL or PostgreSQL.

Iterate and revisit your data management strategy periodically. Reach out to the data science team early and often so we can help your team avoid bottlenecks. 

## 

If you decide that your team wants a database, the next steps will be...

- request database be created (name, who has access)
- develop structure of tables. start on whiteboard to determine what the tables will be, columns, and what columns will link tables together. this is the hard part! anticipate what types of queries or views of the data you want. this is like making a list for the grocery store to plan out the ingredients for your meals for the week. 
- create tables in the database
- populate with data
- 

See also:

* Intro to databases lesson https://cyberhelp.sesync.org/introdb-lesson/
* working with pretty big data in R usgs blog post https://waterdata.usgs.gov/blog/formats/

