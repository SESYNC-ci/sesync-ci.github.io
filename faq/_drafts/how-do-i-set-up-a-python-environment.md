---
title: How do I set up a Python Environment?
tags:
  - Python
  - environment
---
The main purpose of a Python virtual environment is to create an isolated environment for your Python projects. This way, each project can have its own dependencies. It is good to have a virtual environment because it allows you to execute code in a constant environment, and a virtual environment is necessary if you want to install additional packages.             
## Using Virtual Environments 
## Steps
### 1) Log into the SSH gateway.
[Connecting to the ssh gateway](https://cyberhelp.sesync.org/faq/how-to-access-linux-resources.html)
### 2) Create a virtual environment in Python 3.8:
```
python3.8 -m venv env38
```

This will create a directory called `env38/` (or whatever name you want to give it) in your current working directory.

### 3) Activate the virtual environment:
```
source env38/bin/activate
```

Now it will say `(env38)` before your prompt to show you are in the virtual environment.

You can install packages now into the virtual environment with `pip install`, including numpy, pandas, and what have you.

### 4) Deactivate the environment by simply entering:
```
deactivate
```

All of that you only have to do once.

Now whenever you run python from a Slurm job your job should include the following language:
```
source env38/bin/activate
python myscript.py
deactivate
```


