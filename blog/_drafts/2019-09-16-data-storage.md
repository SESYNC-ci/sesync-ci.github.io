---
title: "How much data can I store on '\nfs'?"
author: qread
tags:
 - NFS
 - Infrastructure
---


*TL;DR: Try to have a general idea of your data storage needs, and discuss it with the data science team if you are concerned, but do not be too worried unless you are going well over 1 terabyte.* 

There's big data, and then there's *BIG* data! Data storage needs depend on the types of data you are working with. SESYNC users vary greatly in their data needs. SESYNC's `\nfs` filesystem has a large data storage capacity. Even so, users still need to be cognizant of how much data they are storing on the filesystem to avoid maxing out the storage and compromising other people's work. We recommend that groups have a general idea of their data storage needs and discuss it with a member of the data science team if they have any concerns about being able to store all the data they need on SESYNC's filesystem.

Here is a quick rundown of the data formats that are likely to take up the most space.

**Raster images**, including maps and remotely sensed imagery, are one of the most space-hogging data types. This is especially true if (1) you have very high resolution images with global coverage or wide spatial coverage, or (2) if you have a time series of raster images with very fine temporal resolution (for example, daily or weekly over a long time period). To give an example of the file sizes you can get with high spatial resolution images, a single raster image containing elevation data for the continental United States at 30 m pixel resolution is around 100 GB in size. For an example of how time series can balloon in size, the MODIS land surface temperature data is provided globally every 8 days at 1 km resolution. A year's worth of that data is around 1.5 GB. If you want to use multiple MODIS data products for multiple years, your data storage requirements are going to multiply quickly.

**Genomic data** can easily consume many terabytes since a single individual's worth of reads can be on the order of 100 GB. However few SESYNC projects have used this kind of data.

**Model output**: Finally, be careful when running models that generate a lot of output. For example you might have a model that estimates a parameter which is a 1000x1000 matrix. If it is a Bayesian model that draws 1000s of samples from the posterior distribution for that matrix, the model output can quickly run into 10s or 100s of GB overnight.

Generally, data storage will not be an issue unless you will need to store significantly more than 1 terabyte of data on `\nfs` for a long period of time. If you do think you might need more than that, or if you are planning to make extensive use of a very memory-intensive type of data, feel free to contact Cyberhelp to discuss your data use and storage needs. We will be able to work out a solution that meets your needs!