---
title: The SESYNC Cluster
category: quickstart
tags:
- infrastructure
- cluster
- Slurm
- R
- shell
---

You can connect to the cluster through our ssh gateway service running at ssh.sesync.org or by submitting jobs through rstudio. The workflow for using a cluster is a little bit different from a typical run in R or python. In addition to your processing code, you must give the cluster a list of execution instructions and a description of the resources your analysis will require. Any output from your script will be written out to a file called slurm-[jobID].out and errors go to slurm-[jobID].err.

The general process to submit your code (aka, job) to the cluster is as follows:

1. Create a submission script that lists the resources you request and lists the commands necessary to run your code;
2. Submit this to the cluster
3. Check your job's status
4. Look at your job's output

## Connect via the ssh gateway

Login to SESYNC's ssh gateway at `ssh.sesync.org` (click (here)[link to Linux resource page] if you need to know how to do that). 

Create a file called `submit.sh` using your favorite editor (nano, pico, vi, etc.). For example: `$ nano submit.sh` Type and save the following in the file:
```
#!/bin/bash
#SBATCH -n 1
#SBATCH -t 0:60

hostname
```
This script will ask the scheduler to create a job that is up to 60 seconds long (-t 0:60), and it requests one CPU (-n 1).

Submit this script to the cluster at the command prompt: `$ sbatch submit.sh`

Check your job's status at the command prompt: `$ squeue`

Check your job's output by using `$ ls` to find the `.out` (and maybe `.err`) file containing your job number. View the output with an editor or the `less` command. For example, if your job number were 1234, `$ less slurm-1234.out`

## Connect via Rstudio server

Connect to the RStudio server at `rstudio.sesync.org` For more information, (see)[link to rstudio page]. Write or load the R code you wish to submit to the cluster and save it in a file. For more information on writing code that makes optimal use of the cluster, please see the (rslurm package documatation)[link] and/or this (example)[blog post]. Let's assume for now your R script is called `myRcode.R`

Create a new file in the RStudio editor (File -> New File -> Text File). Save it as `submit.sh` in the same folder as `myRcode.R`. Type and save the following:
```
#!/bin/bash
#
#SBATCH -n1

Rscript --vanilla myRcode.R
```
This scrpt tells tells the scheduler and linux that this is a shell script and should be run using the bash shell ( #!/bin/bash ), using one CPU (-n1) and that it should launch your R script with default configuration settings (Rscript --vanilla myRcode.R).

Open the terminal in RStudio (Tools -> Terminal -> New Terminal).

Submit this script to the cluster at the command prompt: `$ sbatch submit.sh`. Before you do this, ensure that you are in the same directory in the terminal as where your two scripts (myRcode.R and submit.sh) are saved. You can do this using `$ pwd` and use `$ cd` followed by the appropriate path to navigate to the correct directory.

Check your job's status at the command prompt: `$ squeue`

You can find your output in the files window of RStudio. Look for `.out` (and maybe `.err`) files with your job number and open them from there (they will be plain text). You can also check your job's output in the terminal window, using `$ ls` to find the file(s) containing your job number. View the output with an editor or the `less` command. For example, if your job number were 1234, `$ less slurm-1234.out`


## For more information
See our (FAQ about the cluster)[link] as well as (the rslurm package)[link].

