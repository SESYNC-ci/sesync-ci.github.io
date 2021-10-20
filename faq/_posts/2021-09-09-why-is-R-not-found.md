---
title: Why is R (or Python) not found?
tags:
  - Environment
  - Module
  - R
---

If you trying to run R from the terminal, and you see this scary-looking message,

```
[jdoe@sesync.org@sshgw00 ~]$ R
-bash: R: command not found
```

you might wonder why R (or Python, or whatever other program you're trying to run) isn't found! Read on to solve this problem.

## What's a module?

As of September 2021, SESYNC's servers now use [environment modules][modules] to keep different versions of software organized on our system. 
This means that you can choose what version of R you want to use to run your code. Even if SESYNC has updated R to a more recent version, you
can make sure your code is reproducible by always running it with the same version of R (and all the same R package versions) that you used
when you originally developed the code.

The R environment module is always loaded on the RStudio server and Slurm nodes, but you will need to load it on the SSH gateway. For other 
software, you'll always need to load the environment module before you run it, whether it's on the RStudio server, the Slurm nodes, the
Jupyter server, or the SSH gateway.

## Quick solution

To get rid of the error message, just type this command in the terminal before you try to run R:

```
module load R
```

This will load the `R` environment module which includes the default version of R. We've set the most recent stable version on our servers
to be the default (as of October 2021, this is R 4.1.1). 
If you'd rather load a specific version of R, you will need to specify the version number. Run `module avail R` to see which versions are available.
Then you can type `module load R/4.0.5`, for example, to load that version of `R`.

For Python, you can load the default version of Python 3.x with:

```
module load Python3
```

## See also

For more information, please see 

- [SESYNC Quickstart page on environment modules][modules]
- [Official documentation for environment modules](https://modules.readthedocs.io/en/latest/)

[modules]: ({{ 'quickstart/environment-modules.html' | relative_url }})
