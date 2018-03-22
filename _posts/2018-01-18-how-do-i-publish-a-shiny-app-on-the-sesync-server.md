---
title: Publish a Shiny App
category: quickstart
tags:
  - R
  - shiny
---


To publish a R shiny application on the SESYNC server, your files will need to be copied from your working directory to the shiny-apps-data shared folder (__/nfs/shiny-apps-data on RStudio Server__). Please contact SESYNC IT staff if you would like to host an app on SESYNC's Shiny Server.

## Synchronizing changes between development and published version
To sync changes to the application between your working directory (which we will call the _development version_ of the app) and shiny-apps-data (the _published version_), it is recommended that you use GitLab. Here are the basic steps:

1. Create a new Git project for your application (see [How do I create a new Git Project](http://cyberhelp.sesync.org/quickstart/creating-a-new-git-project.html)).
2. In your working directory, either: 
   * create a new R project from your Git repository (see [How do I create an R Studio Project from Git](http://cyberhelp.sesync.org/faq/create-rstudio-from-git.html)); __or__
   * associate an existing R project to the repository; when [this page](https://raw.githubusercontent.com/SESYNC-ci/sesync-ci.github.io/master/assets/images/createproject_git.png) appears after creating your GitLab project, follow the command line instructions under _Existing Git repo_. (You can send command line instructions from a SESYNC SSH session, or from a RStudio Server session using the system() function in R).
3. As you are working on the development version of your app, periodically __commit__ your changes, and __push__ the version you want to share to Git. Both operations can be done from the "Git" tab of the RStudio Server enviornment (see screenshot below).
4. Create another R project from your Git repository (see [How do I create an R Studio Project from Git](http://cyberhelp.sesync.org/faq/create-rstudio-from-git.html)) , this time in the __shiny-apps-data folder__, which will contain the published version of the app.
5. Anytime you push a new version from your development directory to the Git repository, you can __pull__ it in the shiny-apps-data version of the project to publish it. See the screenshot below showing the location of the pull button in the RStudio Server interface.
![](/assets/images/shiny_git.png)

## Managing package dependencies
To make sure all packages your application needs are installed on the SESYNC shiny server, please follow these steps.

1. Create a dependencies.R file in your project. This R script should verify that each required package is installed and exceeds the minimum package version requirement. Specify the version of the package used in your development as the minimum version. Missing or out of date packages must be installed by the script and then loaded. Here is such a script that requires the "dplyr", "raster", and "ggplot2" packages.

```
# List the package and version as below
dependencies <- read.csv(textConnection("
  Package,     Min.Version
  dplyr,       0.5.0
  raster,      2.5.8
  ggplot2,     2.0.1
  "), stringsAsFactors = FALSE, strip.white = TRUE)

## No changes necessary below. ##

# Import installed package versions
pkgs <- installed.packages()
rownames(pkgs) <- c()
pkgs <- data.frame(pkgs, stringsAsFactors = FALSE)

# Compare requirements to installed packages
pkgs <- merge(dependencies, pkgs, by="Package", all.x=TRUE)

# Filter out packages meeting minimum version requirement
pkgs <- pkgs[mapply(compareVersion, pkgs$Min.Version, pkgs$Version) > 0, ]

# Install missing and newer packages
lapply(pkgs$Package, install.packages, repos="http://cran.us.r-project.org")

# Require dependencies [optional]
```

2. Add "source(dependencies.R)" to the top of your __app.R__ single-file Shiny script.
