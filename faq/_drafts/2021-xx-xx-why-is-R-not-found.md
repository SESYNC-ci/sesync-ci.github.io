---
title: Why is R not found?
tags:
  - Environment
  - Module
---

- Show the typical error message the user will get if the R environment module (or some other module) isn't found on SSH gateway or Slurm cluster job
- Also possibly note that you might get an error when you run library(sf) even if R is running, if you haven't previously loaded GDAL, GEOS, and PROJ
- Give quick solution (just run module load R and try again, or whatever other module)
- Mention Rcommon which has all the dependencies for things like sf
- Point people to the quickstart for more details
- Provide link to modules.readthedocs.io