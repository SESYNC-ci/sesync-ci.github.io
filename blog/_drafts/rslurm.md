---
title: Using the rslurm package to run code in parallel
tags:
 - Slurm
 - R
author: qread
---

![rslurm logo](/assets/images/logo_slurm.svg)

This blog post will teach you how to use the `rslurm` package to parallelize your code by walking you through a quick example.

## What is rslurm?

SESYNC has a high-performance computing cluster which allows users to run lots of code quickly by splitting it up into many small parallel tasks and running them all at once on different processors. Many people in the SESYNC community could benefit from using the cluster to run big R jobs quickly. Unfortunately, submitting jobs to a cluster typically requires the user to know how to write shell scripts, which many SESYNC folks are unfamilar with. To fix that, the SESYNC data science team developed the `rslurm` package -- problem solved! Now, SESYNC users can run big parallel jobs directly from the RStudio server. The code has similar syntax to an `apply` statement in R, so it will look familiar to users, and the whole workflow can be packaged inside a single R script -- no pesky shell scripts cluttering things up! To read more about the `rslurm` package, visit [the rslurm package website](http://cyberhelp.sesync.org/rslurm/). 

## An example of rslurm in action

A common task that would take a long time to run sequentially but is easy to parallelize is a sensitivity analysis. If we have a model with multiple parameters, and we want to know the sensitivity of the result to changes in parameter values, we need to run the model for a lot of different combinations of parameter values, across the entire distribution for all the parameters. Let's take a look at how we could use `rslurm` to speed up the analysis.

The basic steps we need to take to do a job in `rslurm` are:

- Put the parameter values in a data frame where each row is a set of values to use for a single iteration.
- Create a list of all the other R objects we need to run the code within each iteration.
- Call `slurm_apply()` to run the parallel job.
- Check the job status to see whether it ran successfully.
- Extract job output and (optionally) clean up any temporary files that the job created.

Let's go through each step.

### Set up the parameter values

We need to create a data frame where each column is a parameter and each row is an iteration. Let's say we have 

### Create a list of needed objects

### Call slurm_apply() to run the parallel job

### Check job status

### Extract job output and clean up temporary files