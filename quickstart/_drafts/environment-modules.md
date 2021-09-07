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

Software on the SESYNC server (as of September 2021) is organized using [environment modules](https://modules.readthedocs.io/en/latest/). Modules allow the user to modify their working environment on the server by loading specific versions of software. SESYNC maintains multiple versions of commonly used software on the server so that users can load the version they want to work with. This is great for reproducibility because you can guarantee that the same version of (for example) R is used every time you run a piece of code. And even if SESYNC IT staff run updates and install a new version of R on the SESYNC server, you can still use the older version if you want to ensure that your code runs exactly the same way every time.

FIXME: ADD ADDITIONAL DETAIL ON THE FOLLOWING

- Provide more background
- Any notes about system-wide versus module installations of software
- Generally say when you would need to use them (on ssh gateway, in certain slurm scripts)
- Explain how Rcommon includes R and all the common dependencies for things like sf

## Module commands

module load

The most important command to know is `module load`. This command loads an environment module. If you don't specify a version, it will load the default version which is typically the most recent stable version. For example, 

```
module load R
```

loads the most recent version of R. After running that command, you can type `R` to open an R session, or `Rscript` to run an R script.

Running 

```
module load R/3.6.2
```

will load R version 3.6.2.

module avail

This command shows you which modules are available to load. Simply running `module avail` will show all of them, or you can search by running for example `module avail python` to see all available modules with the string "python" in their names.

- module list
- module switch
- module unload
