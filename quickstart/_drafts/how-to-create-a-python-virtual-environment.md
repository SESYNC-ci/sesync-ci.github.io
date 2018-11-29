---
title: "Run Python Scripts on the Cluster"
tags:
- Python
- virtual Environment
---

## Setting up a virtual environment

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

(Note: For more info about [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/), see this guide from which this section was adapted.)
