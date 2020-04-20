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

## Set default option to *not* save your workspace

The best practice is not to save your R workspace when you exit R or RStudio. "But wait," you protest, "what about all the work I did running all that code?" Well, this does not mean you have to unnecessarily re-run any code. If there are specific R objects you want to save from session to session, you should save those objects or export their contents to a CSV. Saving the entire workspace is problematic for a few reasons:

- If anyone else ever helps you with your R code, it will be easier for them to reproduce only the relevant objects rather than an entire "ecosystem" of variables in your workspace.
- **include more reasons why best practices militate against saving your WS"

Here is how to set the global RStudio options to not save your workspace by default.

**insert here**

Here is how to save individual R objects.

**insert here**

## Use explicit file paths instead of changing the working directory

**Explain why it's good to not change the working directory, but instead use explicit file paths.**

## Set up your scripts to run either locally or remotely

**include header code to detect whether script is running locally or remotely, which will determine where files load from**

This is Q's solution but others may have other ideas.
	
	
	
	
## Other stuff

**include if needed**

- versioning code, but not data, on GitHub (this might not fall within the scope of this blog post)



