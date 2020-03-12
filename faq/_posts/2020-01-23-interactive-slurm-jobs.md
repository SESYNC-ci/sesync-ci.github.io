---
title: "How do I run an interactive job on the cluster?"
tags:
 - Cluster
 - SSH
 - Slurm
---

SESYNC's [Slurm compute cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}) allows users to run big memory- and processor-intensive jobs. Many users don't know that you can access the memory and processing power of the cluster interactively, typing commands directly into the command line or into an R or Python session. This FAQ briefly describes how to start an interactive job on the Slurm cluster.

## Starting an interactive job

First, you need to connect to the SSH server. On Windows machines, you can do this from PowerShell, but if you want to use applications with a graphical interface (such as displaying R plots in real time), you will need to use a third-party client such as PuTTY (see [this FAQ on accessing Linux resources]({{ 'faq/how-to-access-linux-resources.html' | relative_url }}) for how to do that).

Next, start an interactive job. This is done with the shell command `salloc`, which requests an allocation of one or more cluster nodes. A typical interactive job request could be as simple as:

```
salloc -n 1
```

where `-n 1` means you are requesting one node. You can add other options such as `--partition=sesyncshared` or request specific amounts of memory or time. See the [Slurm documentation page for salloc](https://slurm.schedmd.com/salloc.html) or [the SESYNC cluster Quickstart page]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}) for more information &mdash; the available options for `salloc` are mostly the same as for `sbatch`.

If the node(s) you requested are available you will get a message like

```
salloc: Granted job allocation 363010
```

and you will get another terminal prompt. Your interactive job is now running!

## Running R from an interactive job

Now that your interactive job has started, you can do things like start an R session from the command line. This is as easy as typing `R` but it is often preferable to type

```
R --no-save --no-restore
```

That will ensure that your R workspace will not automatically save to your working directory and clutter things up in case your job terminates abruptly.

You can now run R code from the command line, including code that runs in parallel if you want. If you run code to draw and view a plot, the display will be forwarded from the remote machine to a window on your local machine. (This can be sluggish sometimes so it is often better to write the plot to a file and view it later.)

## Quitting an interactive job

Once you are done with your job, quit R using `q()` (or quit whatever other application you are running). Then type

```
exit
```

into the command prompt. You will see a message like

```
salloc: Relinquishing job allocation 363010
```

to indicate that the nodes you ran your job on are now freed up for other users.
