---
title: What resources are available?
tags:
 - Infrastructure
 - Database
 - NFS
 - Slurm
 - SSH
 - Zotero
sticky: true
---

SESYNC has an extensive set of computing resources and expertise available for researchers. Download a [high-level overview] of all services and support SESYNC offers for general information, or scan the tables below for a quick reference. **Direct all questions to {{ site.email }}.** 

| Resource                     | URL                                  |
|------------------------------|--------------------------------------|
| [Code Repository]            | <https://gitlab.sesync.org>          |
| [Research Data Directory]    | <https://files.sesync.org>           |
| [RStudio]                    | <https://rstudio.sesync.org>         |
| [Jupyter]                    | <https://jupyter.sesync.org>         |
| Shiny Apps                   | <https://shiny.sesync.org>           |
| SSH Gateway                  | ```<USERNAME>@ssh.sesync.org```      |
| [MySQL/PostgreSQL Database]  | ```<HOSTNAME>.research.sesync.org``` |
| Remote Desktop               | <https://desktop.sesync.org>         |

To set up a mailing list for your group, we recommend using [Google Groups](https://support.google.com/groups/).

| Service                 | Description |
|-------------------------|-------------|
| Custom Virtual Machines | Single purpose Windows or linux virtual machine with shared account. |
| Enterprise Conferencing | Skype for Business meetings with video, presentation sharing, and conference telephone line. |
| Software Purchasing     | Licenses for Matlab, Stata, ArcGIS, MaxQDA, NVIVO, and additional software can be purchased on request. |
| Reference Management    | Zotero groups with unlimited storage. |
| Slurm Cluster           | High-performance computing cluster for running parallel jobs. Integrated with R through the [rslurm package]. |

[high-level overview]: http://sesync.us/itresearchresources
[Code Repository]: {{ '/quickstart/creating-a-new-git-project.html' | relative_url }} 
[Research Data Directory]: {{ '/quickstart/research-data-directory.html' | relative_url }}
[RStudio]: {{ '/quickstart/rstudio-server.html' | relative_url }}
[Jupyter]: {{ '/quickstart/jupyter-server.html' | relative_url }}
[MySQL/PostgreSQL Database]: {{ '/quickstart/connect-to-a-database.html' | relative_url }}
[rslurm package]: http://cyberhelp.sesync.org/rslurm/