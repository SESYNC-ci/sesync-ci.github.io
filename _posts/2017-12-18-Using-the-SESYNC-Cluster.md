---
category: 
tags:
- infrastructure
- cluster
- slurm
---

# {{ page.title }}

## Overview of the cluster and scheduler

SESYNC's computational cluster enables users to run medium-to-large scale analyses by distributing multiple, independent tasks across many
computers. This setup is ideal for tasks that require applying the same algorithm or a parameter set over independent units in a large data
set.

The cluster is a group of 22 virtual machines with a total of 168 cores and 1.28 T of RAM that is accessible through
a scheduler. Using two special commands (sbatch and srun), you request the scheduler to allocate one or more compute nodes for a job.
The scheduler puts your job in a queue and executes it when sufficient compute nodes are available. The advantage of this type of
processing is that you can submit many requests (hundreds or thousands), and they will run as  resources become available. It also means
that when you gain access to a compute node, you have sole access to it during the time your code is running, i.e., you're not competing with
other individuals for CPU cycles. 

There are two types of nodes available in the SESYNC cluster: two development/testing nodes and 20 computation nodes. All computation nodes have
8 CPU cores and 60Gb of memory available running 64-bit Ubuntu Linux version 14.04. All nodes have compilers, core R packages,
and python available. 

We use a scheduler system called the Simple Linux Utility for Resource Management (SLURM) developed by [Lawrence Livermore National Laboratory](https://www.llnl.gov/).
It is  one of the most popular systems among large high performance clusters and is the one used by the University of Maryland Deepthought
supercomputer. This means that any submission script you develop on our modest cluster can be easily ported to a much large HPC system.

## Connecting to the cluster

You can connect to the cluster through our ssh gateway service running at ssh.sesync.org or by submitting jobs through rstudio. The workflow
for using a cluster is a little bit different from a typical run in R or python. In addition to your processing code, you must give the
cluster a list of execution instructions and a description of the resources your analysis will require. Any output from your script will
be written out to a file called slurm-[jobID].out or slurm-[jobID].err.

The process to submit your code (aka, job) to the cluster is as follows:

1. Create a submission script that lists the resources you request and lists the commands necessary to run your code;
2. Submit this to the cluster
3. Check your job's status
4. Look for your job's output

### Via the ssh gateway

1. Create the submission script:

Login to SESYNC's ssh gateway att ssh.sesync.org (click (here)[link to Linux resource page] if you need to know how to do that). Create a
fiel called `myscript.sh` using your favorite editor (nano, pico, vi, etc.). For example: `>nano myscript.sh` 

Type and save the following in the file:

```
#!/bin/bash
#SBATCH -n 1
#SBATCH -t 0:60

hostname
```




