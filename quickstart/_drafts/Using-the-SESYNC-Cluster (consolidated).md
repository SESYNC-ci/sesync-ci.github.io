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
---

You can connect to the cluster through our ssh gateway service running at ssh.sesync.org or by submitting jobs through rstudio. The workflow for using a cluster is a little bit different from a typical run in R or python. In addition to your processing code, you must give the cluster a list of execution instructions and a description of the resources your analysis will require. Any output from your script will be written out to a file called slurm-[jobID].out and errors go to slurm-[jobID].err.

The general process to submit your code (aka, job) to the cluster is as follows:

1. Create a submission script that lists the resources you request and lists the commands necessary to run your code
2. Submit this to the cluster
3. Check your job's status
4. Look at your job's output

## Connect via the ssh gateway

Login to SESYNC's ssh gateway at `ssh.sesync.org` ([click here](https://cyberhelp.sesync.org/faq/how-to-access-linux-resources.html) if you need to know how to do that). 

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

## Connect via RStudio server

Connect to the RStudio server at `rstudio.sesync.org`. For more information, [see](https://cyberhelp.sesync.org/quickstart/rstudio-server.html). Write or load the R code you wish to submit to the cluster and save it in a file. For more information on writing code that makes optimal use of the cluster, please see the [rslurm package documatation](https://cran.r-project.org/web/packages/rslurm/index.html). Let's assume for now your R script is called `myRcode.R`.

Create a new file in the RStudio editor (File -> New File -> Text File). Save it as `submit.sh` in the same folder as `myRcode.R`. Type and save the following:
```
#!/bin/bash
#
#SBATCH -n1

Rscript --vanilla myRcode.R
```
This script tells tells the scheduler and linux that this is a shell script and should be run using the bash shell ( #!/bin/bash ), using one CPU (-n1) and that it should launch your R script with default configuration settings (Rscript --vanilla myRcode.R).

Open the terminal in RStudio (Tools -> Terminal -> New Terminal).

Submit this script to the cluster at the command prompt: `$ sbatch submit.sh`. Before you do this, ensure that you are in the same directory in the terminal as where your two scripts (myRcode.R and submit.sh) are saved. You can do this using `$ pwd` and use `$ cd` followed by the appropriate path to navigate to the correct directory.

Check your job's status at the command prompt: `$ squeue`

You can find your output in the files window of RStudio. Look for `.out` (and maybe `.err`) files with your job number and open them from there (they will be plain text). You can also check your job's output in the terminal window, using `$ ls` to find the file(s) containing your job number. View the output with an editor or the `less` command. For example, if your job number were 1234, `$ less slurm-1234.out`

## Submitting Python jobs

Save your Python script in the same location as your `submit.sh` script. If the Python script is named `test.py`, to run Python code, the submission script can be as simple as:

```
#!/bin/bash

python test.py
```

__Note__: If your script uses packages from a virtual environment, make sure to first activate it before calling sbatch.

### Setting up a virtual environment

If your script requires additional Python packages besides the standard library and the few packages (such as numpy) already on the SESYNC server, you will need to install them in a virtual envrionment, which is a user-specific Python library. Follow these directions to create your virtual environment (monospace font indicates commands to type in the SSH shell):

* Using a SSH client, log in to ssh.sesync.org with your SESYNC username and password.
* Install the virtualenv package: `pip install virtualenv`
* Create a virtual environment in your home directory:  `virtualenv venv`
* To activate the virtual environment, type:  `source venv/bin/activate`

At this point, the command prompt line should begin with (venv), indicating that you are in the virtual environment. You can now:

* Install all the Python packages you need e.g. `pip install numpy`. Note that even those packages that are already on the server need to be reinstalled it in your virtual environment.
* Run a Python script e.g. `python test.py`. __IMPORTANT__: The SSH shell only has minimal computing power and memory, thus only short scripts for test/debugging purposes should be run directly from the shell. Any computationally-intensive task needs to be run on the cluster.
* Submit a script to the cluster e.g. `sbatch submit.sh` (see below).
* Leave the virtual environment by typing: `deactivate`

(Note: For more info about [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/), see this guide from which this section was adapted.)

### Running multiple copies of a Python script in parallel

In general, you may want to run multiple copies of a script in parallel, using different parameter sets. The following submission script accepts two command line parameters and passes them to Python.

__submit.sh__

```
#!/bin/bash

python test.py $1 $1
```

Your Python script can access these parameters via the `sys.argv[]` list.

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

### Tip: Editing your remote Python files

The RStudio Server interface (accessible via your web browswer at __rstudio.sesync.org__) can recognize Python syntax and thus serve as a code editor for your files hosted on the SESYNC server. Note that it may not be possible to run the scripts in RStudio Server, since you cannot access your virtual environment from that interface.

## Submitting MATLAB jobs

Save your MATLAB script, we'll assume it is named `sampleMATLAB.m` in the same place as your `submit.sh` file.

Create your `submit.sh` file with the following:
```
#!/bin/bash
#
#SBATCH -n1

/usr/local/MATLAB/R2018b/bin/matlab -nodisplay < sampleMATLAB.m
```
or update your ~/.profile to include:
`export PATH=$PATH:/usr/local/MATLAB/R2018b/bin/matlab`

and the `submit.sh` file only needs:
```
#!/bin/bash
#
#SBATCH -n1

matlab -nodisplay < sampleMATLAB.m
```

From the ssh gateway, submit the script with the command prompt: `$ sbatch submit.sh`


## For more information

See our [FAQ about the cluster]({{ '/faq/What-is-the-SESYNC-cluster.html' | relative_url }}) as well as [the rslurm package](http://cyberhelp.sesync.org/rslurm/). You may also want to look at two other FAQs, one on [SESYNC's recommendations about whether to use the cluster]({{ '/faq/Do-I-have-to-use-the-cluster.html' | relative_url }}) and the other on [working around the cluster's scheduled maintenance outages]({{ '/faq/maintenance-window-slurm.html' | relative_url }}).

