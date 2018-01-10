---
title: Do I have to use the cluster?
category: faq
tags:
- cluster
---

# {{ page.title }}

We highly recommend using the scheduled cluster for running all of your CPU-intensive or long running programs. Below is SESYNC policy
for long running processes on our different types of resources:

* **RStudio Server (rstudio.sesync.org)** - You may run long tasks from the RStudio server (rstudio.sesync.org). However, as R is single threaded, it will ONLY
let you run one task, and you will not be able to do anything else while your script is running. For this reason, we highly recommend
that you submit all long run tasks to the scheduler. See our quickstart guide on this [topic](http://cyberhelp.sesync.org/quickstart/Using-the-SESYNC-Cluster.html).

* **SSH Gateway (ssh.sesync.org)** - you may NOT perform computational tasks on this server. It is only designed for debugging your code,
submitting jobs to the scheduler, and providing ssh/scp access to researchers.

* **Custom VM**  - If you have a dedicated VM for your project or group you may perform computationally intensive tasks on it. If your VM
is shared among multiple group members, please be aware that your processing may impact others attempting to use the same resource.
