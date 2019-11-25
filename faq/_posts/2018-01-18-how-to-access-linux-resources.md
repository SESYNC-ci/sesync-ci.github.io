---
title: How do I access Linux resources?
tags:
  - SSH
  - Linux
---


SESYNC linux resources are deployed on a private network at SESYNC and are accessed via our ssh gateway at ssh.sesync.org.  These resources include RStudio, Jupyter lab, and our compute cluster.  Please DO NOT run your computational processing on the ssh gateway, it has limited memory and processing power.  

## Connecting to the ssh gateway
1. Use an ssh client (we recommend [PUTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/))
2. Enter ssh.sesync.org as your Host Name and click Open

![Connect with PUTTY](/assets/images/ssh1.png)

Once connected to ssh.seysnc.org, you can do any of the following:
1. Transfer data to your research storage space (using, e.g., scp, wget, sftp, curl)
2. Submit a script to the compute cluster with [R](https://cyberhelp.sesync.org/quickstart/how-do-i-submit-an-r-script.html) or [Python](https://cyberhelp.sesync.org/quickstart/how-to-run-Python-scripts-on-the-cluster.html)
3. Connect via ssh at the command prompt to your dedicated linux VM to use processing resources there (contact SESYNC staff at cyberhelp@sesync.org if you need a linux VM)

### Other ways to connect
You can also access linux resources via the terminal windows in [RStudio](rstudio.sesync.org) or [Jupyter](jupyter.sesync.org).  When you log in to either of these compuing environments, you do the equivalent to logging to the ssh gateway, so you don't have to use the steps above, but rather can simply transfer data, run scripts, etc.  
