---
title: How do I set up a Python virtual environment for Slurm jobs?
tags:
  - Python
  - Slurm
  - Environment
---
The purpose of a Python virtual environment is to create an isolated virtual space for your Python project. It is good to have a virtual environment because it allows you to execute code in a constant context, and each project can have its own dependencies. Currently the default Python version for new package installation on the Slurm cluster (as of February 2020) is Python 3.5. If you would like to run your Slurm Python jobs with later versions, a virtual environment is necessary if you want to install additional packages.             

## Creating the virtual environment

Follow the steps below once, and you will have a virtual environment that you can use for any Slurm jobs you run in the future.

**1) Log into the SSH gateway.**

See [Connecting to the ssh gateway]({{ 'faq/how-to-access-linux-resources.html' | relative_url }}).

**2) Create a virtual environment in Python 3.8:**

```
python3.8 -m venv env38
```

This will create a directory called `env38/` (or whatever name you want to give it) in your current working directory.

**3) Activate the virtual environment:**

```
source env38/bin/activate
```

Now it will say `(env38)` before your prompt to show you are in the virtual environment.

You can install packages now into the virtual environment with `pip install`. For example, to install `numpy` call:

```
pip install numpy
```

**4) Deactivate the environment by simply entering:**

```
deactivate
```

All of the above you only have to do once.

## Activating the virtual environment in a job

The bash script for submitting your job (usually called `submit.sh`) should include the following language:

```
source /research-home/yourusername/env38/bin/activate
python myscript.py
deactivate
```

Notice that you will need to include the full path to the virtual environment (in the above example it is `/research-home/yourusername/env38` but yours may be different).

If you're unsure how to set up the rest of your bash script, see the [submission script section](https://cyberhelp.sesync.org/quickstart/Using-the-SESYNC-Cluster.html#2-create-a-job-submission-script) of our quickstart on using the cluster.  

## See also

- General information on running Python on the cluster is on our [quickstart page on the Slurm cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}).
