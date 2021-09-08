---
title: "How do I run an interactive job on the cluster?"
tags:
 - Cluster
 - SSH
 - Slurm
---

SESYNC's [Slurm compute cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}) allows users to run big memory- and processor-intensive jobs. Many users don't know that you can access the memory and processing power of the cluster interactively, typing commands directly into the command line or into an R or Python session. This FAQ briefly describes how to start an interactive job on the Slurm cluster.

## Starting an interactive job

First, you need to open a terminal window and connect to the SSH server. On Windows machines, if you want to use applications with a graphical interface (such as displaying R plots in real time), you will need to use a third-party client such as [PuTTY](https://www.putty.org/) or [MobaXTerm](https://mobaxterm.mobatek.net). See [this FAQ on accessing Linux resources]({{ 'faq/how-to-access-linux-resources.html' | relative_url }}) for help on getting the client set up.

Log into the SSH server by typing

```
ssh (your username goes here)@ssh.sesync.org
```

into the terminal prompt, and then entering your password when prompted. You are now logged in to the server called `sshgw00` (SSH gateway).

Next, start an interactive job. This is done with the shell command `srun`, which requests a node for a parallel job. A typical interactive job request is:

```
srun -n 1 --pty bash -i
```

where `-n 1` means you are requesting one node. The `--pty bash -i` part tells the job to open an interactive terminal. You can add other options such as requesting specific amounts of memory or time. See the [Slurm documentation page for srun](https://slurm.schedmd.com/srun.html) or [the SESYNC cluster Quickstart page]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}) for more information &mdash; the available options for `srun` are mostly the same as for `sbatch`.

If the node(s) you requested are available you will get another terminal prompt with the name of the Slurm node you are logged into. Your interactive job is now running!

## Running R from an interactive job

Now that your interactive job has started, you can do things like start an R session from the command line. First you will need to load the `R` environment module:

```
module load R
```

You can also load specific versions of R &mdash; see the [environment modules Quickstart page]({{ 'quickstart/environment-modules.html' | relative_url }}) for more information.

Now start the R session. This is as easy as typing `R` but it is often preferable to type

```
R --vanilla
```

That will ensure that your R workspace will not automatically save to your working directory and clutter things up in case your job terminates abruptly.

You can now run R code from the command line, including code that runs in parallel if you want. If you run code to draw and view a plot, the display will be forwarded from the remote machine to a window on your local machine. (This can be sluggish sometimes so it is often better to write the plot to a file and view it later.)

## Quitting an interactive job

Once you are done with your job, quit R using `q()` (or quit whatever other application you are running). Then type

```
exit
```

into the command prompt. Your terminal prompt will say `sshgw00` again, meaning you are back on the SSH gateway and the nodes you ran your job on are now freed up for other users.
