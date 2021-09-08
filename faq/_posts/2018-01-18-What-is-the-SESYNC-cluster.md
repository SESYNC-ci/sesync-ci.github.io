---
title: What is the compute cluster?
tags:
 - Cluster
---

SESYNC's computational cluster ([see quickstart page]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }})) enables users to run medium-to-large scale analyses by distributing multiple, independent tasks across many computers. This setup is ideal for tasks that require applying the same algorithm or a parameter set over independent units in a large data set.

## Overview of the cluster and Job Scheduler

The cluster is two large machines each with 64 processor cores and 515 GB RAM, for a total of 128 cores and 1.03 TB of RAM, that is accessible through
a scheduler. Using two special commands (sbatch and srun), you request the scheduler to allocate one or more compute nodes for a job.
The scheduler puts your job in a queue and executes it when sufficient compute nodes are available. The advantage of this type of
processing is that you can submit many requests (hundreds or thousands), and they will run as resources become available. It also means
that when you gain access to a compute node, you have sole access to it during the time your code is running, i.e., you're not competing with other individuals for CPU cycles. 

The cluster nodes are running Red Hat Enterprise Linux 8.3 (Ootpa) and have compilers, core R packages, and Python available. 

We use a scheduler system called the Simple Linux Utility for Resource Management (Slurm) developed by [Lawrence Livermore National Laboratory](https://www.llnl.gov/). It is  one of the most popular systems among large high performance clusters and is the one used by the University of Maryland Deepthought supercomputer. This means that any submission script you develop on our modest cluster can be easily ported to a much large HPC system.

## Job scheduler policies

In contrast to many computing clusters at larger institutions that have to manage hundreds of simultaneous users, the SESYNC cluster
has relatively few users so we can get away with very lenient cluster use policies. For example, we have no default limits on memory
use for jobs. However, if the total RAM in use on a node exceeds what is available on that node (515 GB), jobs on that node may 
terminate with an out-of-memory error, so please keep an eye on your memory use. 
Also, the time limit on jobs is set at a generous 30 days, which should be more than enough for any job you might want to run.

Because of our lenient policies, we rely on the honor system to manage our cluster &mdash; it's up to you to be a good neighbor!
We only have two cluster nodes so you will likely have to share the node your job is running on with other users. That means it's 
important to make sure your job stays within reasonable limits of time and memory use. It is not very neighborly to use all 64 processor cores for a 
job that will run for days. 

Also see the quick start [page on the cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}).
