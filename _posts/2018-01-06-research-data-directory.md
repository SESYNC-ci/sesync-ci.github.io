---
category: quickstart
tags:
 - NFS
 - data
---

SESYNC provides a large, shared file store to host data for all projects.
Project participants have access to the research data directory for their
project from our compute servers, a web portal, a desktop application for
syncing, and SSH. The directory name will be based off your projects short-title.
In the examples below, we use the short title `cooltrees` for a hypothetical
project on urban green spaces.

For **large uploads** (i.e. more than 10GB), please use a
[SFTP](https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol) client for
faster and secure data transfer. See our Quickstart guide on [Bulk Uploads and
Downloads by SFTP]({{'/quickstart/Bulk-upload-download-SFTP.html' | relative_url }})
for recommendations and useage details.

For **postdocs and staff** at SESYNC, additional options are described on our
[internal Wiki](https://base.sesync.org).

## RStudio/Jupyter Server and other Linux Machines

Any research data directory you have permission to access is available at the
filesystem path at `/nfs/cooltrees-data`. Please note, these directories won't
appear within the `/nfs` directory until you attempt to access it (i.e. by `cd
/nfs/cooltrees-data` rather than `ls /nfs`). The path is the same on all our
Linux systems, including virtual machines and the [RStudio Server]({{
'/quickstart/rstudio-server.html' | relative_url }}). From a Linux shell, type
`cd /nfs/cooltrees-data` to set your working directory to your research data
directory.

## Windows VM

Virtual machines accessed through <https://desktop.sesync.org> will be pre-configured with
a mapped network drive pointing to your research data directory. Mapping creates a drive letter linked to `\\storage.research.sesync.org\cooltrees-data`. To re-create the map (e.g. to change the drive letter), click the file explorer icon in the task bar (folder icon). Then right-click "This PC" & choose "map network drive". In the "folder"
space, type `\\storage.research.sesync.org\cooltrees-data`.

For computers not on SESYNC's internal network, use a [sync
client]({{ 'quickstart/sync-files-locally.html' | relative_url }}) to keep a local folder
up to date with your research data directory.

## Web Browser

All research data directories are also accessible via a web browser---this portal
allows you to upload, download and organize your data on SESYNC's storage.

1. Go to <https://files.sesync.org>, log in using your SESYNC username and
   password.
2. Open the folder corresponding to your project (i.e. `cooltrees-data`)
3. Upload\download\organize data.

## Over SSH

1. Connect to SESYNC's Linux gateway with any SFTP client or via SSH using your SESYNC credentials:
   - **Host:** ssh.sesync.org
   - **Username:** %YOUR SESYNC USERNAME%
   - **Password:** %YOUR SESYNC PASSWORD%
   - **Port:** 22
2. Change remote path to your research data directory with `cd /nfs/cooltrees-data`.
