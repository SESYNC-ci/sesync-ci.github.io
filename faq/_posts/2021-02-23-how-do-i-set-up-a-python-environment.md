---
title: How do I set up a Python virtual environment for Slurm jobs?
tags:
  - Python
  - Slurm
  - Environment
---
The purpose of a Python virtual environment is to create an isolated virtual space for your Python project. It is good to have a virtual environment because it allows you to execute code in a constant context, and each project can have its own dependencies. Any updates to Python versions or Python packages elsewhere on the system will not affect the virtual environment, ensuring that you can reproduce your results later.
Currently the default Python version for new package installation on the Slurm cluster, the Jupyter server, and the RStudio server (as of September 2021) is Python 3.8.6. If you would like to run your Slurm Python jobs with other Python versions, or use a different version of Python in a .Rmd notebook on the RStudio server, a virtual environment is necessary if you want to install additional packages.             

## Creating the virtual environment

Follow the steps below once, and you will have a virtual environment that you can use for any Slurm jobs you run in the future.

**1) Log into the SSH gateway.**

See [Connecting to the ssh gateway]({{ 'faq/how-to-access-linux-resources.html' | relative_url }}).

**2) Create a virtual environment using your desired version of Python:**

To use the default system Python (currently Python 3.6), use `python3` to install the virtual environment like this:

```
python3 -m venv myproject_env
```

This will create a directory called `myproject_env/` (or whatever name you want to give it) in your current working directory. 

Other versions of Python3 can be specified. For example, if you want to use Python 3.8, install the virtual environment like this:

```
python3.8 -m venv myproject_env
```

You can also use [environment modules][modules] to load a specific version of Python before creating the virtual environment.

**4) Activate the virtual environment:**

```
source myproject_env/bin/activate
```

Now it will say `(myproject_env)` before your prompt to show you are in the virtual environment.

You can install packages now into the virtual environment with `pip install`. For example, to install `numpy`, enter:

```
pip install numpy
```

**5) Deactivate the environment by simply entering:**

```
deactivate
```

All of the above you only have to do once.

## Activating the virtual environment in a job

If you want to run a Python script called `myscript.py` on the Slurm cluster, the bash script for submitting your job (usually called `submit.sh`) should include the following commands.

```
source /research-home/yourusername/myproject_env/bin/activate
python myscript.py
deactivate
```

Notice that you will need to include the full path to the virtual environment (in the above example it is `/research-home/yourusername/env392` but yours may be different). Substitute your actual username for `yourusername`.

If you're unsure how to set up the rest of your bash script, see the [submission script section]({{ 'quickstart/Using-the-SESYNC-Cluster.html#2-create-a-job-submission-script' | relative_url }}) of our Quickstart page on using the cluster.  

## Activating the virtual environment on the RStudio server

To activate the virtual environment on the RStudio server, use the following R code:

```
library(reticulate)
use_virtualenv('~/myproject_env/')
```

Now any Python code you execute from within R will use your virtual environment. This can be used in .Rmd notebooks. All `{python}` code chunks in your notebook will use the virtual environment as long as you include the above code in your `setup` code chunk at the top of the notebook.

## See also

- General information on running Python on the cluster is on our [Quickstart page on the Slurm cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}).
- [FAQ on setting up a virtual environment for use on the Jupyter server]({{ 'faq/python-virtual-env.html' | relative_url }})
- [Quickstart page on environment modules][modules]

[modules]: {{ 'quickstart/environment-modules.html' | relative_url }}
