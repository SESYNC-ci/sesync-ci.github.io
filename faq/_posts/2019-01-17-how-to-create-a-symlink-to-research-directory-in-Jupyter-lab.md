---
title: How to create a symlink to a research directory in Jupyter lab?
tags:
  - Python
  - Jupyter
  - NFS
  - Data
---

To access and see your data directory from the side data console, you need to first set a symlink to your research directory.
To do this, open a terminal notebook in Jupyter lab. The command to set the symlink is:

```
ln -s /nfs/PROJECTNAME-data PROJECTNAME-data
```

Once this is set, you will be able to navigate to your research data directory from the data console in Jupyter lab, as well as in the files tab in R Studio. This will show you same files you see when logging in to Nextcloud via the web browser. More details and context can also be found in this blog post about [reproducible R workflows](https://cyberhelp.sesync.org/blog/reproducible-r-workflow.html).
