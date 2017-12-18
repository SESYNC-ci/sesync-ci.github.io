---
category: quickstart
tags:
 - python
 - cluster
---
# {{ page.title }}

## How to run Python scripts on the cluster

### 1. Setting up a virtual environment
If your script requires additional Python packages besides the standard library and the few packages (such as numpy) already on the SESYNC server, you will need to install them in a virtual envrionment, which is a user-specific Python library. Follow these directions to create your virtual environment (monospace font indicates commands to type in the SSH shell):

* Using a SSH client, log in to ssh.sesync.org with your SESYNC username and password.
* Install the virtualenv package: pip install virtualenv
* Create a virtual environment in your home directory:  virtualenv venv
* To activate the virtual environment, type:  source venv/bin/activate

At this point, the command prompt line should begin with (venv), indicating that you are in the virtual environment. You can now:

* Install all the Python packages you need e.g.  pip install numpy . Note that even those packages that are already on the server need to be reinstalled it in your virtual environment.
* Run a Python script e.g.  python test.py . __IMPORTANT__: The SSH shell only has minimal computing power and memory, thus only short scripts for test/debugging purposes should be run directly from the shell. Any computationally-intensive task needs to be run on the cluster.
* Submit a script to the cluster e.g.  sbatch submit.sh (see below).
* Leave the virtual environment by typing:  deactivate

### 2. Creating a submission script
The submission script lists the shell commands to be run from the cluster. To run Python code, the submission script can be as simple as:

    #!/bin/bash
    #
    python test.py

Let's say this script is saved as __submit.sh__. You can send it to the cluster with the command:  sbatch submit.sh . __Note__: If your script uses packages from a virtual environment (see above), make sure to first activate it before calling sbatch.

### 3. Running multiple copies of a script
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

### Tip: Editing your remote files
The RStudio Server interface (accessible via your web browswer at __rstudio.sesync.org__) can recognize Python syntax and thus serve as a code editor for your files hosted on the SESYNC server. Note that it may not be possible to run the scripts in RStudio Server, since you cannot access your virtual environment from that interface.
