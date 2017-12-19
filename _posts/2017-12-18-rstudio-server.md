---
category: quickstart
tags:
  - R
  - NFS
---

# {{ page.title }}

SESYNC provides access to RStudio in your browser in order to develop and run R
scripts that connect directly to other SESYNC resources (file storage, databases,
the cluster, etc).

## Connecting

Access RStudio by pointing any web browser to <https://rstudio.sesync.org/> and
logging in with your SESYNC name and password. If you forgot your username or password, please
go to <https://pwm.sesync.org/>. If your SESYNC credentials do not give you RStudio access,
please email {{ site.email }}.

## Running RSudio

Once you login, you will see the in-browser version of RStudio. If you've used
the desktop version, it works almost identically. To learn how to use all the
features of the RStudio IDE, check out the [cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf)

## R Packages

User [contributed R packages](https://cran.r-project.org/web/packages/) can be
installed on RStudio either through the menu or the R console. From the menu
choose `Tools -> Install Packages`; from the R console use the `install.packages`
function. If you receive and error saying the package cannot be installed there
is a chance some underlying system library is not installed. Please email the error
message to **{{ site.email }}**, and explain which package you need to install.

## Where should I save stuff?  

"Stuff" usually belongs in one of three places:

1. SESYNC Home Directory (`~/`).
1. Research Data Directory (`/nfs/my-group-data`)
1. Version controlled project (paired with [GitLab](https://gitlab.sesync.org), for example)

### SESYNC Home Directory

When you first open R studio, you will be
      working in your home directory which is located at /research-home/USERNAME
      (e.g., /research-home/msmorul). This is your private directory and only
      you have access to the files in it. We strongly recommend that you save
      all project files and source code in to your home directory. This will
      protect against multiple group members attempting to update a project file
      at the same time. If you need to share code between project members please
      see 'Sharing a project' below.

### Research Data Directory

If you've requested it your group will have a data
      directory available. This directory is located at /nfs/GROUP\_DIRECTORY
      where GROUP\_DIRECTORY is the short name of your group appended with
      -data. This will likely be the same as the name of your Pydio workspace
      and mailing list. For example, if your workspace is located at
https://files.sesync.org/pydio/ws-my-group-data/, then your group's data will
      be located at /nfs/my-group-data. You can upload data to this directory
      either by saving output from R to folders there, or by using our file
      upload service described in the guide at \[\[How do I access SESYNC's data
      storage\]\]. You should store all shared data here. Examples of data types
      that should be placed here include csv files, landsat imagery, hdf5 data
      files--anything that's not code that you will be sharing with your group
      members.

### Version Controlled Project

We strongly support using version control to manage work with collaborators, not to mention keeping up with principles of reproducible research. SESYNC provides a free GitLab cloud service for private repositories for pre-release projects. Please see [Creating a new Git Project](/quickstart/creating-a-new-git-project.html) for more information on using this service.

To work with version control systems in RStudio, you create an RStudio "project" to pair with a remote repository.

1. Go to `File -> New Project` in RStudio

2. Choose the type of project:

    - Use **Version Control** if a remote repository for the project is already
    populated with files, and be ready to provide the URL (e.g. "git@gitlab.sesync.org:my-group/my-project.git").

    - Use **Existing Directory** if you already have a folder containing only this
    project's files. Once the project exits, go to `Project Options -> GitSVN ` to choose Git
    for version control, and be ready to provide the URL (e.g. "git@gitlab.sesync.org:my-group/my-project.git").
    
    - If you don't have files organized into a folder (or are starting from scratch), start by
    [Creating a new Git Project](/quickstart/creating-a-new-git-project.html) and go back to Step 1.

3. Move files into the project directory and add them to a commit.

## Dealing with Data

Since everyone will be working off of the same set of code, there are two
options for working with data. If your data is quite small (i.e. a csv
with a few hundred rows, also known as "small-batch artisinal data") you can
include it in your project and push to your remote repository. Store larger
datasets in your [Research Data Directory]({{ '/quickstart/research-data-directory.html' | relative_url }})
so that everyone is able to work off one shared copy of the data. Very large datasets may need to be loaded into
a RDBMS, and SESYNC provides both MySQL and PostgreSQL servers for this purpose.
