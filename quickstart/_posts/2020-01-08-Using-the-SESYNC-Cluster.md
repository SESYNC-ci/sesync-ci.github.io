---
title: The Compute Cluster
tags:
 - Infrastructure
 - Cluster
 - Slurm
 - R
 - Shell
 - MATLAB
 - Python
 - SSH
sticky: true
---

SESYNC provides a high-performance computing cluster for memory-intensive and time-intensive computing tasks. ([FAQ: What is the SESYNC cluster?]({{ '/faq/What-is-the-SESYNC-cluster.html' | relative_url }})) You can connect to the cluster through our [ssh gateway][gateway] service running at ssh.sesync.org or by submitting jobs through RStudio. The workflow for using a cluster is a little bit different from a typical run in R or Python. In addition to your processing code, you must give the cluster a list of execution instructions and a description of the resources your analysis will require. Any output or error messages from your script will be written out to a file called `slurm-[jobID].out`.

The first part of this quickstart guide explains in general how to connect to the server and submit jobs, via the ssh gateway or the RStudio server. The second part of the guide gives specific examples showing how to submit jobs in R, Python, and MATLAB. 

The general process to submit your code (aka, job) to the cluster is as follows:

1. Create a submission script that lists the resources you request and lists the commands necessary to run your code
2. Submit this to the cluster
3. Check your job's status
4. Look at your job's output

# Connecting to the server and submitting jobs

## Connect via the ssh gateway

Login to SESYNC's ssh gateway at `ssh.sesync.org` (Read the [FAQ on accessing Linux resources][gateway] if you need to know how to do that). 

Create a file called `submit.sh` using your favorite editor (nano, pico, vi, etc.). For example: `$ nano submit.sh` Type and save the following in the file:

```
#!/bin/bash
#SBATCH -n 1
#SBATCH -t 0:60

hostname
```

This script will ask the scheduler to create a job that is up to 60 seconds long (`-t 0:60`), and it requests one CPU (`-n 1`).
The `hostname` command will display the name of the node the job is running on.

Submit this script to the cluster at the command prompt: `$ sbatch submit.sh`

Check your job's status at the command prompt: `$ squeue`

Check your job's output by using `$ ls` to find the `.out` file containing your job number. View the output with an editor or the `less` command. For example, if your job number were 1234, `$ less slurm-1234.out`

# Submitting R jobs from the Rstudio server

The following is a simple example that shows you how to:

* Create a simple R script which reads a data file and plots the output
* Create a job submission script
* Modify your R script to handle multiple runs
* Submit your job for execution
* Look for the results

Once you are familiar with the process shown here, you may want to check our examples of the different ways to [run code in parallel](https://github.com/SESYNC-ci/cluster-parallel-examples) on the cluster.  You may also want to check out the [rslurm]({{ 'rslurm/index.html' | relative_url }}) package for submitting R code to a Slurm cluster.  

## 1. Create a simple R script

Connect to the RStudio server at `rstudio.sesync.org`. For more information, [see the RStudio quickstart](https://cyberhelp.sesync.org/quickstart/rstudio-server.html). 

Before you begin, download the `surveys.csv` data file from [Data Carpentry](https://github.com/datacarpentry/datacarpentry/raw/master/data/biology/). Place it in your current directory. The file contains observations on the weight of several species of small mammals across 24 survey plots.

* PROTIP: In the "Console" tab in RStudio, run this code to download the CSV file directly to the current directory:

```
download.file('https://github.com/datacarpentry/datacarpentry/raw/master/data/biology/surveys.csv','surveys.csv','wget')
```

Create a script to run some analyses on the data. The script below reads the data into R, calculates basic statistics on the observed weight of each species then creates a bar chart of the mean in a pdf. Only rows with complete data are used.

* Create a new R script file called plot.R.
* Copy and paste the code snippet below into the script file.

```
surveys <- read.csv('surveys.csv')
surveys_complete <- surveys[complete.cases(surveys), ]

surveys_complete$species <- factor(surveys_complete$species)
species_mean <- tapply(surveys_complete$wgt, surveys_complete$species, mean)
species_max <- tapply(surveys_complete$wgt, surveys_complete$species, max)
species_min <- tapply(surveys_complete$wgt, surveys_complete$species, min)
species_sd <- tapply(surveys_complete$wgt, surveys_complete$species, sd)
nlevels(surveys_complete$species) # or length(species_mean)
surveys_summary <- data.frame(species=levels(surveys_complete$species),
                              mean_wgt=species_mean,
                              sd_wgt=species_sd,
                              min_wgt=species_min,
                              max_wgt=species_max)
pdf("mean_per_species.pdf")
barplot(surveys_summary$mean_wgt)
dev.off()
```

## 2. Create a job submission script

In addition to the R script you want to run, you need to create a seperate submission script that instructs the cluster how to run your R script.

  _Q. Why can't you directly submit your R script?_

  _A. The cluster is able to run many different types of code and doesn't have an innate awareness of the specific language used in any particular analysis script that's submitted. Therefore, you must tell the cluster how to run your code. The script we are about to create provides these instructions._

In the same folder where you created your __plot.R__ file, create a submission script called __submit.sh__. This submission script is a short shell script that instructs the scheduler which settings to use  and lists the commands necessary to run your R script. The example below tells the scheduler that a single task will run and that it should process the __plot.R__ script file using the __Rscript__ command.

* PROTIP: You can create the __submit.sh__ script within the R environment  by clicking File -> New File -> Shell Script
* Type or copy/paste the lines below.
* When you are finished, save the file as __'submit.sh'__. _Note: Your submission scripts are plain text files and can be named anything. However, using the ".sh" extension is good practice to indicate it's a shell script._

```
#!/bin/bash
#
#SBATCH -n 1

Rscript --vanilla plot.R
```

Here's what the submission script is doing:

* `#!/bin/bash` - tells the scheduler and linux that this is a shell script and should be run using the bash shell
* `#SBATCH -n 1` - tells the scheduler that you will be running one task. Any line beginning `#SBATCH` is interpreted as an instruction to the scheduler, for more details on what is available please see [this guide](https://support.ceci-hpc.be/doc/_contents/QuickStart/SubmittingJobs/SlurmTutorial.html). 
* `Rscript --vanilla plot.R` - is the command that will be run to launch your script. The "--vanilla" specifies R should run with minimal options or settings, and should not load any existing workspace or save the workspace when the job is complete. See the [documentation of Rscript](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/Rscript.html) for more details.

## 3. Run your job

Open the terminal in RStudio (switch to the Terminal tab or go to Tools -> Terminal -> New Terminal to create a new tab).

Submit your __submit.sh__ script to the cluster at the command prompt: `$ sbatch submit.sh`. Before you do this, ensure that you are in the same directory in the terminal as where your two scripts (__plot.R__ and __submit.sh__) are saved. You can do this using `$ pwd` to check the current directory and `$ cd` followed by the appropriate path to navigate to the correct directory.

Note that the system will return a message with the job number for your submission. This is a unique number on the scheduler that can be used to track information about the status of your job. This is particularly useful for jobs that may take a long time to run.

```
> system("sbatch submit.sh")
Submitted batch job 76
```

Check your job's status at the command prompt: `$ squeue` will show a list of all the currently running jobs on the SESYNC server, with details on their processor usage and run time.

After you submit this job, it should finish in a few seconds. Click the refresh button in the RStudio "Files" tab, and you should see a few new files.

* __slurm-XX.out__ - any output, including error messages, generated from either the scheduler or the R script (XX is your job number)
* __mean_per_species.pdf__ - the pdf barplot your R script created

You can open the __slurm-XX.out__ output log file in RStudio to look at any progress or error messages your job created while it was running.

## 4. Modify your scripts to run more than once

If you look at the script above, you'll notice that a problem arises when you want to run this file multiple times. The way it's currently written, it will overwrite the pdf output each time it is run. To prevent this, we can append the unique SLURM job number to the name of the file.

The scheduler provides environment variables you can use for this purpose. We will modify the pdf command (third to last line) of the __plot.R__ script to read as follows:

```
pdf(paste0("mean_per_species_", Sys.getenv("SLURM_JOB_ID"),".pdf"))
```

* Here, _SLURM_JOB_ID_ is an environment variable set to the SLURM job number, which the scheduler automatically passes to the R script.

Once you're finished you can re-submit your script using `sbatch` as you did before. When the script finishes, you'll notice that the PDF file is now called __mean_per_species_XX.pdf__, where XX is the job number.

# Submitting Python jobs

Save your Python script in the same location as your `submit.sh` script. If the Python script is named `test.py`, to run Python code, the submission script can be as simple as:

```
#!/bin/bash

python test.py
```

__Note__: If your script uses packages from a virtual environment, make sure to first activate it before calling sbatch.

## Setting up a virtual environment

If your script requires additional Python packages besides the standard library and the few packages (such as numpy) already on the SESYNC server, you will need to install them in a virtual environment, which is a user-specific Python library. A virtual environment will also allow you to run your script with a specific version of Python. Follow the directions on our [FAQ on how to create a virtual environment for a Slurm job]({{ 'faq/how-do-i-set-up-a-python-environment.html' | relative_url }}). 

## Running multiple copies of a Python script in parallel

In general, you may want to run multiple copies of a script in parallel, using different parameter sets. The following submission script accepts two command line parameters and passes them to Python.

__submit.sh__

```
#!/bin/bash

python test.py $1 $1
```

Your Python script can access these parameters via the `sys.argv[]` list. Note that `sys.argv[0]` is always the name of the Python script, in this case `test.py`, so use subscripts starting with 1 for the arguments you passed to the script.

__test.py__

```
import sys
a = sys.argv[1]
b = sys.argv[2]
...
```

In this case, the command `sbatch submit.sh 5 3` sets `a = 5` and `b = 3` in the Python script. If you submit this script to the cluster multiple times, it is important that each version saves its output to a separate file. You can achieve this by getting the `SLURM_JOB_ID` environment variable within the Python script and using it to index your output file:

__test.py__

```
...
import os
job_id = os.environ.get('SLURM_JOB_ID')
outfile_name = "results" + job_id + ".txt"
...
```

If your Python script requires the use of a virtual environment, your submit script should look like this:

__submit.sh__

```
#!/bin/bash

source venv/bin/activate
python test.py $1 $1
deactivate
```

## Tip: Editing your remote Python files

The RStudio Server interface (accessible via your web browser at __rstudio.sesync.org__) can recognize Python syntax and thus serve as a code editor for your files hosted on the SESYNC server. Note that it may not be possible to run the scripts in RStudio Server, since you cannot access your virtual environment from that interface.

# Submitting MATLAB jobs

Save your MATLAB script &mdash; we'll assume it is named `sampleMATLAB.m` &mdash; in the same place as your `submit.sh` file.

Create your `submit.sh` file with the following:
```
#!/bin/bash
#
#SBATCH -n 1

/usr/local/MATLAB/R2018b/bin/matlab -nodisplay < sampleMATLAB.m
```
or update your ~/.profile to include:
`export PATH=$PATH:/usr/local/MATLAB/R2018b/bin/matlab`

and the `submit.sh` file only needs:
```
#!/bin/bash
#
#SBATCH -n 1

matlab -nodisplay < sampleMATLAB.m
```

From the ssh gateway, submit the script with the command prompt: `$ sbatch submit.sh`

# For more information

Here are some pages with helpful advice on using the SESYNC cluster.

- [FAQ: What is the SESYNC cluster?]({{ '/faq/What-is-the-SESYNC-cluster.html' | relative_url }}) 
- [Homepage of the rslurm package](http://cyberhelp.sesync.org/rslurm/)
- [FAQ: Do I have to use the cluster?]({{ '/faq/Do-I-have-to-use-the-cluster.html' | relative_url }}) 
- [FAQ: What are common options for Slurm jobs, and how do I set them?]({{ '/faq/common-options-for-slurm-jobs.html' | relative_url }}) 
- [FAQ: How can I work around the cluster's scheduled maintenance outages?]({{ '/faq/maintenance-window-slurm.html' | relative_url }})
- [FAQ: Where can I store temporary files created by cluster jobs?]({{ '/faq/temporary-data-storage.html' | relative_url }})

[gateway]: ({{ 'faq/how-to-access-linux-resources.html' | relative_url }})

