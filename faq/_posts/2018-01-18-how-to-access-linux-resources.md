---
title: How do I access Linux resources?
tags:
  - SSH
  - Linux
---


SESYNC Linux resources are deployed on a private network at SESYNC and are accessed via our ssh gateway at ssh.sesync.org.  These resources include RStudio, Jupyter lab, and our compute cluster.  Please DO NOT run your computational processing on the ssh gateway, it has limited memory and processing power. Instead, use the ssh gateway to submit jobs to SESYNC's compute cluster or to connect to your virtual machine.

## Connecting to the ssh gateway
1. Use an ssh client (we recommend [PUTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/)), but other options are available.
2. Enter ssh.sesync.org as your Host Name and click Open

![Connect with PUTTY](/assets/images/ssh1.png)

Once connected to ssh.sesync.org, you can do any of the following:
1. Transfer data to your research storage space (using, e.g., scp, wget, sftp, curl)
2. Submit a script to [the compute cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}) with R or Python.
3. Start an [interactive job]({{ 'faq/interactive-slurm-jobs.html' | relative_url }}) on the compute cluster, so that you can still type commands interactively into the prompt while accessing the greater memory and processing power of the cluster nodes.
4. Connect via ssh at the command prompt to your dedicated linux VM to use processing resources there (contact SESYNC staff at cyberhelp@sesync.org if you need a linux VM)

### Failed login attempts

**NOTE**: If you mistype your username or password too many times in a row, after the 5th try your IP address will be automatically blocked from further attempts to log in to the SSH gateway. The block lasts for 5 days. This protects our server against attacks. If you're unsure about your password, just reset it: visit <https://pwm.sesync.org> or check out our [password reset FAQ]({{ 'faq/password.html' | relative_url }}). If you get blocked, you will either have to log in from another computer or contact cyberhelp@sesync.org to remove the block.

### Other ways to connect
You can also access linux resources via the terminal windows in [RStudio](rstudio.sesync.org) or [Jupyter](jupyter.sesync.org).  When you log in to either of these computing environments, you do the equivalent to logging in to the ssh gateway, so you don't have to use the steps above, but rather can simply transfer data, run scripts, etc.  
