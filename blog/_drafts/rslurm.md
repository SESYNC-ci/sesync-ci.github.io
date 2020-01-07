---
title: Using the rslurm package to run code in parallel
tags:
 - Slurm
 - R
author: qread
---

<img src="/assets/images/logo_slurm.svg" align="right" width=250px>

This blog post will teach you how to use the `rslurm` package to parallelize your code by walking you through a quick example.

## What is rslurm?

SESYNC has a high-performance computing cluster which allows users to run lots of code quickly by splitting it up into many small parallel tasks and running them all at once on different processors. Many people in the SESYNC community could benefit from using the cluster to run big R jobs quickly. Unfortunately, submitting jobs to a cluster typically requires the user to know how to write shell scripts, which many SESYNC folks are unfamilar with. To fix that, the SESYNC data science team developed the `rslurm` package -- problem solved! Now, SESYNC users can run big parallel jobs directly from the RStudio server. The code has similar syntax to an `apply` statement in R, so it will look familiar to users, and the whole workflow can be packaged inside a single R script -- no pesky shell scripts cluttering things up! To read more about the `rslurm` package, visit [the rslurm package website](http://cyberhelp.sesync.org/rslurm/). 

## An example of rslurm in action

A common task that would take a long time to run sequentially but is easy to parallelize is finding the best values for tuning parameters for a machine learning model. This can become a very computing-intensive task because you often need to test many possible combinations of tuning parameter values. Within each combination of parameter values you might need to run a 10-fold cross validation, which in itself takes a lot of computing time since each cross-validation requires fitting 10 models. So if you have three tuning parameters to optimize, with only five different values for each parameter, you will end up with $5^3$ or 125 cross-validations, or 1250 models to fit. Even if each model fit takes only 20 seconds that's a full seven hours. 

Let's take a look at how we could use `rslurm` to speed up the analysis. 

The basic steps we need to take to do a parallel job in `rslurm` are:

- Create a function that we want to call many times in parallel.
- Put the parameter values in a data frame where each row is a set of values to use for a single iteration.
- Create a list of all the other R objects (and optionally, packages) we need to run the code within each iteration.
- Call `slurm_apply()` to run the parallel job.
- Check the job status to see whether it ran successfully.
- Extract job output and (optionally) clean up any temporary files that the job created.

Let's go through each step.

### Create a function to call in parallel

### Set up the parameter values

We need to create a data frame where each column is an argument to our function and each row is an iteration.

The R function `expand.grid()` is often useful here. Let's test out two tuning parameters, the complexity of each tree `interaction.depth` and the number of trees in the random forest `n.trees`, with 3 possible values for each for a total of 9 iterations.

```
my_pars <- expand.grid(interaction.depth = 1:3, n.trees = c(50, 100, 150))
```

### Create a list of needed objects

When you run an R script in parallel, you are creating a separate R environment for each of the tasks. You need to make sure that each environment has all the R objects needed to do the task. In this case you would need to make sure the environment contains the needed data and packages. By default, all the currently loaded packages are loaded within each of the task environments but you need to pass all objects explicitly. You can also specify just the packages you absolutely need if you want to speed things up slightly by avoiding loading a lot of unnecessary packages within each task.

For this example we need to make sure the data to fit the model is passed along, so we create a character vector with the name(s) of the data objects in our current environment that we want to pass to each task:

```
data_names <- c('foo')
```

And to specify only the needed packages:

```
needed_packages <- c('foo')
```

### Call slurm_apply() to run the parallel job

Now we put it all together with a call to `slurm_apply()`. In addition to passing the function name, the parameter data frame, the objects, and the packages, we can also specify how many nodes to split the job across.

```
my_job <- slurm_apply()
```

### Check job status

As the job is running we can call `get_job_status()` to see how things are going. This is an example of what it would look like while the job is ongoing:

```
insert here
```

If the job is completed the call to `get_job_status()` would look like this:

```
insert here
```

### Extract job output and clean up temporary files

Once your job is complete you can pull the output back into your R environment using `get_slurm_out()`:

```
output <- get_slurm_out(my_job)
```

In this case we get something like this:

```
insert here
```

Make sure you save the output as `.RData` or write to a CSV! Once you've done this you can delete the temporary directory that contains some files created by `rslurm`:

```
cleanup_files(my_job)
```

You've successfully run a parallel job with the `rslurm` package!
