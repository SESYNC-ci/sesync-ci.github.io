---
title: How to create a symlink to a research directory?
tags:
  - Python
  - Jupyter
  - R
  - RStudio
  - NFS
  - Data
---

To access and see your data directory for Jupyter or RStudio, it is best practice to set a symlink, a symbolic link that points to your data directory and allows you to browse the files in that directory.   

## Jupyter

To access and view the files in your data directory from the side data console in Jupyter lab, you need to first set a symlink to your research data directory.  To do this, open a terminal tab from the Launcher. Then type the following command in the terminal to set the symlink.  Be sure to replace the ficticious team name "cooltrees" with the short name of your project. Here, we use "data" as the name of the new symlink. 

```
ln -s /nfs/cooltrees-data data
```
Once this is set, you will be able to navigate to your research data directory from the data console in Jupyter lab.  This will show you same files you see when logging in to Nextcloud via the web browser. 

## RStudio

The files in your home directory are viewable automatically in the Files tab in RStudio Server.  However, symlinks are still useful in R workflows.  The code to set a symlink in R to the data directory for the ficticious "cooltrees" team is: 

```
file.symlink(from = '/nfs/cooltrees-data/', to = 'data')
```

More details and context can also be found in this blog post about [reproducible R workflows](https://cyberhelp.sesync.org/blog/reproducible-r-workflow.html).  

