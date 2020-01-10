---
title: What is the compute cluster?
tags:
 - Cluster
---

SESYNC's computational cluster ([see quickstart page]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }})) enables users to run medium-to-large scale analyses by distributing multiple, independent tasks across many computers. This setup is ideal for tasks that require applying the same algorithm or a parameter set over independent units in a large data set.

## Overview of the cluster and Job Scheduler

The cluster is a group of 26 virtual machines with a total of 190 cores and 1.65 TB of RAM that is accessible through
a scheduler. Using two special commands (sbatch and srun), you request the scheduler to allocate one or more compute nodes for a job.
The scheduler puts your job in a queue and executes it when sufficient compute nodes are available. The advantage of this type of
processing is that you can submit many requests (hundreds or thousands), and they will run as  resources become available. It also means
that when you gain access to a compute node, you have sole access to it during the time your code is running, i.e., you're not competing with other individuals for CPU cycles. 

There are three types of nodes available in the SESYNC cluster: two development/testing nodes and 20 computation nodes, and 4 high memory computation nodes. All computation nodes are running running 64-bit Ubuntu Linux version 16.04. Twenty compuation nodes have 8 CPU cores and 60GB of memory each. Four computation nodes have 8 CPU cores and 120GB of memory each. All nodes have compilers, core R packages, and python available. 

We use a scheduler system called the Simple Linux Utility for Resource Management (Slurm) developed by [Lawrence Livermore National Laboratory](https://www.llnl.gov/). It is  one of the most popular systems among large high performance clusters and is the one used by the University of Maryland Deepthought supercomputer. This means that any submission script you develop on our modest cluster can be easily ported to a much large HPC system.

## Partitions

A partition can be thought of as a work queue which has a set of policies and computational nodes included in it. The SESYNC cluster
currently has three partitions, each for different purposes:

### sesync

This partition will allocate entire nodes to your process. You should submit here ONLY if your job is parallel and can use all
resources on a node. Otherwise, CPU's on the node you requested would sit idle. In R, if you use the parallel package you should
submit your job to this queue.  

| Time Limit | Max Job Size | Node Description |
| 14 days | 24 nodes | 20 nodes of 8 core, 60GB memory nodes & 4 nodes of 8 core, 120GB memory|

### sesyncshared

This queue will run up to 8 simultanious jobs on a compute node. This is good for long running jobs that do not require more than
one processor. In general, unless you know your job is memory intensive or parallel you'll want to submit here. This is the default
partition to which jobs get submitted if no partition has been specified

| Time Limit | Max Job Size | Node Description |
| unlimited | 1 node | 8 core, 60GB memory |

### sesynctest

This is a partition designed for testing jobs and troubleshooting submissions. Using this partition on a small subset of data or
paramaters allows you to receive immediate feedback to check for errors, so you will not waste time in queue only to find your
job didn't work. Jobs submitted to this partition are limited to running for 1hr to ensure that resources are always available for
testing.  Please remember to switch to one of sesync or sesyncshared once you've verified your job is working. You should NOT submit
large jobs to this partition; submit them to sesync or sesync-shared. The two nodes in this partition are thin and have considerably
less resources than the other cluster nodes. 

| Time Limit | Max Job Size | Node Description |
| 1hr | 2 nodes | 4 core, 8GB memory |

Also see the quick start [page on the cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}).
