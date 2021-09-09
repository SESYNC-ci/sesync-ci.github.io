---
title: Environment Modules
tags:
 - Infrastructure
 - Slurm
 - R
 - Shell
 - Python
 - SSH
 - Environment
 - Module
sticky: true
---

Software on the SESYNC server (as of September 2021) is organized using [environment modules](https://modules.readthedocs.io/en/latest/). 
Modules allow the user to modify their working environment on the server by loading specific versions of software. 
SESYNC maintains multiple versions of commonly used software on the server so that users can load the version they want to work with. 
This is great for reproducibility because you can guarantee that the same version of (for example) R is used every time you run a piece of code. 
And even if SESYNC IT staff run updates and install a new version of R on the SESYNC server, you can still use the older version 
if you want to ensure that your code runs exactly the same way every time.

Most of the environment modules on the SESYNC server include a specific version of a single piece of software. 
For example, if you load the `R/4.1.1` module, you will be able to run R 4.1.1 in your current environment. 
One exception to the "one module, one piece of software" rule is the `Rcommon` module we created for your convenience. 
This module includes R and all the most system libraries that are required for common R packages that SESYNC researchers use. 
For example, `Rcommon` includes GDAL, GEOS, and PROJ, the three system dependencies for the `sf` package.
This saves you having to load multiple modules every time you open an R session.

## Common module commands

You work with environment modules using the `module` command followed by a subcommand. Here are the most commonly used subcommands.

#### module load

The most important subcommand to know is `module load`. This command loads an environment module. If you don't specify a version, it will load the default version which is typically the most recent stable version. For example, 

```
module load Rcommon
```

loads the default version of R, as well as the most common system dependencies, as described above. After loading the module, you can type `R` to open an R session, or `Rscript` to run an R script.

You can specify which version of a piece of software you want to load. Entering 

```
module load R/3.6.2
```

will load R version 3.6.2.

#### module avail

This subcommand shows you which modules are available to load. Simply entering `module avail` will show all of them, or you can search by entering for example `module avail Python` to see all available modules with the (case-sensitive!) string "Python" in their names.

#### module list

This subcommand shows you which modules you currently have loaded in your environment. For example if you load the `Rcommon` module and then enter `module list`, you will see this output:

```
[jdoe@sesync.org@sshgw00 ~]$ module list
Currently Loaded Modulefiles:
 1) R/4.1.1   2) Rcommon/4.1.1
```

#### module switch

This subcommand lets you switch from one version of a module to another. For instance, if you have R 3.6.2 loaded but want to switch to R 4.1.1, use this syntax:

```
module switch R/3.6.2 R/4.1.1
```

It is optional to type out the name of the currently loaded module, but mandatory to type out the name of the one you are switching to.

#### module unload

This subcommand removes a module from your current environment, for example

```
module unload R
```

## When do I need to use modules?

If you are using the RStudio or Jupyter servers to run code, it's unlikely that you will need to worry too much about modules. 
This is because those servers will automatically load the default R and Python modules, and all commonly used dependencies, whenever you start up a session. 

However, if you are testing out code on the [SSH gateway]({{ 'faq/how-to-access-linux-resources.html' | relative_url }}), 
you will need to load modules before running any software. For example, if you want to create a [Python virtual environment][venv] from the terminal, 
you need to load the module for your preferred version of Python first. The same goes for Slurm jobs that you submit from the SSH gateway. 
If the Slurm job uses software such as R that is managed by environment modules, you'll need to include `module load` in your submit script. 
If you use the [rslurm package]({{ 'rslurm' | relative_url }}), Slurm jobs you submit should work fine without loading any modules.

## See also

- [Official documentation page for environment modules](https://modules.readthedocs.io/en/latest/)
- [FAQ about the error message you get when you didn't load the proper module]({{ 'faq/why-is-R-not-found.html' | relative_url }})
- [FAQ about setting up a Python virtual environment for Slurm jobs, using modules][venv]
- [Quickstart page on the Slurm cluster, including how to use modules on the cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }})

[venv]: {{ 'faq/how-do-i-set-up-a-python-environment.html' | relative_url }}
