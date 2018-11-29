---
title: Run Python Scripts on the Cluster
tags:
 - Python
 - cluster
---

Python scripts can be sumitted by generating a shell file to sumbit the job to the SLURM cluster (see more information on SESYNC cluster and slurm here:xx)
The shell submission script lists the shell commands to be run from the cluster. To run Python code, the submission script can be as simple as:

    #!/bin/bash
    #
    python test.py

Let's say this script is saved as __submit.sh__. You can send it to the cluster with the command:  sbatch submit.sh . __Note__: If your script uses packages from a virtual environment (see above), make sure to first activate it before calling sbatch.


## Running multiple copies of a script

In general, you may want to run multiple copies of a script in parallel, using different parameter sets. The following submission script accepts two command line parameters and passes them to Python.

__submit.sh__

    #!/bin/bash
    #
    python test.py $1 $1

Your Python script can access these parameters via the _sys.argv[]_ list.

__test.py__

    import sys
    a = sys.argv[1]
    b = sys.argv[2]
    ...

In this case, the command "sbatch submit.sh 5 3" sets a = 5 and b = 3 in the Python script. If you submit this script to the cluster multiple times, it is important that each version saves its output to a separate file. You can achieve this by getting the _SLURM_JOB_ID_ environment variable within the Python script and using it to index your output file:

__test.py__

    ...
    import os
    job_id = os.environ.get('SLURM_JOB_ID')
    outfile_name = "results" + job_id + ".txt"
    ...

## Tip: Editing your remote files

Jupyterlab (__jupyter.sesync.org__) can be used to edit and develop python scripts for your files hosted on the SESYNC server. Save your script as a regular .py and submit it from the shell interface within jupyterlab or via the terminal you use via ssh. 