---
title: "Tips for a smooth R(Studio) workflow and reproducible R code"
tags:
 - R
 - RStudio
author: qread
---

A lot of SESYNCers use R (often through RStudio on rstudio.sesync.org). A lot of SESYNCers are interested in making their research as reproducible as possible. A lot of SESYNCers also want to save time and make life easier for themselves. Here are some good ideas for how you can make your R workflow smoother, easier for you and anyone you ask to help you, and more in line with reproducible science best practices! Sound good? Read on!

## Wait, what's a workflow?

Your workflow, as defined in [this tidyverse blog post](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/), is all of your personal habits and preferences that you do as part of any project you work on. It doesn't include raw data and the code itself. Your workflow is unique to you and you don't need others to reproduce it, and your project is the actual output you want people to be able to reproduce. Incidentally the blog post I just linked to has some other good ideas for best practices and is worth a read.

Now that we're on the same page, here are some good ideas for your workflow for R and RStudio. Some tips are SESYNC-specific and some are generally applicable to any time you use R or RStudio. 

For each topic, I've included a "broke" (not recommended practice), "woke" (not bad), and "bespoke" (best practice!) way to do it.

## Saving your work

### Broke: saving your entire workspace

The best practice is not to save your R workspace when you exit R or RStudio. "But wait," you protest, "what about all the work I did running all that code?" Well, this does not mean you have to unnecessarily re-run any code. If there are specific R objects you want to save from session to session, you should save those objects or export their contents to a CSV. Saving the entire workspace is problematic for a few reasons:

- If anyone else ever helps you with your R code, it will be easier for them to reproduce only the relevant objects rather than an entire "ecosystem" of variables in your workspace.
- It uses up a lot of memory unnecessarily.
- You might have other packages and objects that are interacting with your desired output in ways you might not immediately be aware of.
- It is not explicitly written into a script so it is much harder to reproduce.

It's easy to set the global RStudio options to not save your workspace by default. Just go to the `Tools` menu in RStudio and select `Global Options` and go to the `General` tab. Set the `Workspace` options to not restore your `.RData` automatically on startup, and not to save it on exit, as in the highlighted area in the image below. You can do this both on your local machine and on the RStudio server.

{% include captionedimage.html url="/assets/images/rstudio_global_options.PNG" description="<small><i>RStudio global options to not save and restore workspaces</i></small>" %}

If you are running your R script from the command line, type `Rscript --no-save --no-restore my_script.R` will also tell R not to save or restore any workspaces.

### Woke: saving individual R objects

Obviously you do want to save your progress especially if you ran a very computationally intensive process that you don't want to repeat. It isn't always easy to export things to a CSV. Instead of saving the whole workspace, it is better to identify the object(s) you want to save and save them individually.

You can save individual R objects easily by using the `save()` function and specifying the names of the objects and the file to write to (usually with the extension `.RData`). For example,

```
save(big_object1, big_object2, file = 'my_awesome_output.RData')
```

In a future session, you can reload the objects by using the `load()` function:

```
load('my_awesome_output.RData')
```

### Bespoke: using RStudio projects in conjunction with saving objects

RStudio includes a feature called "projects" as a way to keep your work in R organized. It is best explained by Hadley Wickham in [the project chapter of his book R for Data Science](https://r4ds.had.co.nz/workflow-projects.html). The basic idea is to keep all the scripts and history associated with one of your real-life projects in one place as an R project. You can switch between them easily. Typically people associate each project with its own version control (i.e., git) repository. I won't go into too much detail on how to set up projects in RStudio &mdash; read the [RStudio documentation](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) and the [book chapter](https://r4ds.had.co.nz/workflow-projects.html)!

## Accessing files in different directories

### Broke: changing the working directory

A very commonly used function is `setwd()`. For example many people would do this to load a CSV file from a mapped network drive.

```
setwd('Z:/data')
data <- read.csv('my_awesome_data.csv')
```

Unfortunately this is not a great practice because it changes things outside the R script which is problematic because it can affect and possibly break other scripts. This is bad enough if only you are running the script, but if anyone else wants to run your code or help you debug it, it will affect their system as well. They probably don't have the same directory structure as you do anyway, so the `read.csv` will return an error. (And don't even get me started on scripts that start with `rm(list = ls())`, if you really want to ruin someone's day.)

### Woke: using explicit file paths

A better way is to create a character string with the file path where the data are located. Then you can use the `file.path()` function to combine the directory name with the file name when you are reading or writing a file. 

```
data_dir <- 'Z:/data'
data <- read.csv(file.path(data_dir, 'my_awesome_data.csv'))
```

It requires a slightly longer line of code to read a file but is well worth it in saved headaches. If you set the file path at the very top of the file, it will be easy for others to change it to the correct path on their system.

### Bespoke: detecting whether your script is running locally or remotely, and setting the path accordingly

I often run R scripts either on the SESYNC RStudio server or locally on my own machine, using the address of the mapped network drive to load files. My data directory on the SESYNC server is called `/nfs/qread-data/` which I have locally mapped to the `Q:` drive. Instead of manually changing the file path or working directory depending on whether I am running the script locally or remotely, I include the following header code in my scripts to detect whether the script is running locally or remotely, and set the file path accordingly.

```
is_local <- dir.exists('Q:/')
data_dir <- ifelse(is_local, 'Q:', '/nfs/qread-data')
```

Now my script can run either on my own machine or on the remote server without any modification! *(This is Q's solution but others may have other ideas.)*




