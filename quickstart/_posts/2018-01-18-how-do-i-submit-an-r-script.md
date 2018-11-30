---
title: Run R Scripts on the Cluster
tags:
  - R
  - Cluster
---

You can use SESYNC's RStudio Server to submit jobs to our cluster and view the resulting output. In the following example, you will learn how to:

* Create a simple R script which reads a data file and plots the output
* Create a job submission script
* Modify your R script to handle multiple runs
* Submit your job for execution
* Look for the results

The code described below is available from GitHub at: [](https://github.com/SESYNC-ci/r-slurm-sample)

Once you are familiar with the process shown here, you may want to check our examples of the different ways to run code in parallel on the cluster: [](https://github.com/SESYNC-ci/cluster-parallel-examples)

## 1. Create a simple R script
Before you begin, download the example data file from Data Carpentry at [](https://github.com/datacarpentry/datacarpentry/raw/master/data/biology/surveys.csv). Place it in your current directory. The file contains observations on the weight of several species of small mamals across 24 survey plots.

* In the "Console" window in RStudio, run:

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

In the same folder you created your __plot.R__ file, create a submission script called __submit.sh__. This submission script is a short shell script that instructs the scheduler which settings to use  and lists the commands necessary to run your R script. The example below tells the scheduler that a single task will run and that it should process the __plot.R__ script file using the __Rscript__ command.
* You can create the __submit.sh__ script within the R envrionment  by clicking File -> New File -> Text file
* Type or copy/paste the lines below.
* When you are finished, save the file as __'submit.sh'__. _Note: Your submission scripts are plain text files and can be named anything. However, using the ".sh" extension is good practice to indicate it's a shell script._

```
#!/bin/bash
#
#SBATCH -n1


Rscript --vanilla plot.R
```

Here's what the script is doing:
* \#!/bin/bash - tells the scheduler and linux that this is a shell script and should be run using the bash shell
* \#SBATCH -n1 - tells the scheduler that you will be running one task. Any line beginning \#SBATCH is interpreted as an instruction to the scheduler, for more details on what is available please see [this guide](https://support.ceci-hpc.be/doc/_contents/QuickStart/SubmittingJobs/SlurmTutorial.html). 
* Rscript plot.R - is the command that will be run to launch your script. The "--vanilla" specifies R should run with minimal options or settings. See the [documentation of Rscript](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/Rscript.html) for more details.

## 3. Run your job
In the RStudio "Console", submit your job to the cluster by typing:

```
system("sbatch submit.sh")
```

Note that the system will return a message with the job number for your submission. This is a unique number on the scheduler that can be used to track information about the status of your job. This is particularly useful for jobs that may take a long time to run.

```
> system("sbatch submit.sh")
Submitted batch job 76
```

After you submit this job, it should finish in a few seconds. Click the refresh button in the RStudio "Files" window, and you should see a few new files.
* __slurm-XX.out__ - any output, including error messages, generated from either the scheduler or the R script (XX is your job number)
* __mean_per_species.pdf__ - the pdf barplot your R script created

## 4. Modify your scripts to run more than once
If you look at the script above, you'll notice that a problem arises when you want to run this file multiple times. The way its currently written, it will overwrite the pdf output each time it is run. To prevent this, we can append the unique SLURM job number to the name of the file.

The scheduler provides environment variables you can use for this purpose. We will modify the pdf command (third to last line) of the __plot.R__ script to read as follows:

```
pdf(paste0("mean_per_species_", Sys.getenv("SLURM_JOB_ID"),".pdf"))
```

* Here, _SLURM_JOB_ID_ is an environment variable set to the SLURM job number, which the scheduler automatically passes to the R script.

Once you're finished you can re-submit your script using sbatch as you did before. When the script finished, you'll notice that the PDF file is now called "mean_per_species_XX.pdf", where XX is the job number.
