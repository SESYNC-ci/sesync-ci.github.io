---
title: Why is R (or Python) not found?
tags:
  - Environment
  - Module
  - R
---

If you trying to run R from the terminal or a Slurm job, and you see this scary-looking message,

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

## Quick solution

To get rid of the error message, just type this command before you try to run R:

```
module load Rcommon
```

This will load the `Rcommon` environment module which includes the default version of R and all commonly used system packages (such as GDAL, GEOS, and PROJ if you want to use the `sf` package). 
If you'd rather load a specific version of R, you will need to specify the version number. Run `module avail R` to see which versions are available.
Then you can type `module load Rcommon/4.1.1`, for example, to load that version of `Rcommon`.

For Python, you can load the default version of Python 3.x with:

```
module load Python3
```

## See also

For more information, please see 

- [SESYNC Quickstart page on environment modules][modules]
- [Official documentation for environment modules](https://modules.readthedocs.io/en/latest/)

[modules]: ({{ 'quickstart/environment-modules.html' | relative_url }})
