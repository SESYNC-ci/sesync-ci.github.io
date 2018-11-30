---
tags:
 - NFS
 - Data
---

SESYNC provides a large, shared file store to host data for all projects.
Project participants have access to the research data directory for their
project from our compute servers, a web portal, a desktop application for
syncing, and SSH.

The **directory name** will be based off your project's short-title.
In the examples below, we use the short title `cooltrees` for a hypothetical
project about urban green spaces.

For **postdocs and staff** at SESYNC, additional options are in our [internal Wiki](https://base.sesync.org).

## Web Browser

All research data directories are accessible from your web browser---via a portal
that provides upload, download, sharing, and other common file operations. For
**large uploads** (i.e. more than 10GB), please use a
[SFTP](https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol) client for
faster and secure data transfer. See our Quick Start guide on [Bulk Uploads and
Downloads by SFTP]({{'/quickstart/Bulk-upload-download-SFTP.html' | relative_url }})
for recommendations and useage details.

1. Log in at <https://files.sesync.org> with your SESYNC username and password.
2. Open the folder corresponding to your project (e.g. `cooltrees-data`).
3. Upload, download, and otherwise organize your data.

## RStudio and Jupyter Servers

Any research data directory you have permission to access is available in the filesystem
of the server once you've logged in. The path will be like `/nfs/cooltrees-data`. Please
note, these directories won't appear within the `/nfs` directory unless you recently
navigated there (i.e. `cd /nfs/cooltrees-data` will work even when `ls /nfs` does not
show the directory). The path is the same on all our Linux systems, including virtual
machines, the [RStudio Server]({{'/quickstart/rstudio-server.html' | relative_url }}),
and the [Jupyter Server]({{'/quickstart/jupyter-server.html' | relative_url }}).

## Windows VM

Virtual machines you access through <https://desktop.sesync.org> are pre-configured with
a mapped network drive pointing to your research data directory. Mapping creates a drive letter linked to `\\storage.research.sesync.org\cooltrees-data`. To re-create the map (e.g. to change the drive letter), click the file explorer icon in the task bar (folder icon). Then right-click "This PC" & choose "map network drive". In the "folder"
space, type `\\storage.research.sesync.org\cooltrees-data`.

For computers not on SESYNC's internal network, use a [sync
client]({{ 'quickstart/sync-files-locally.html' | relative_url }}) to keep a local folder
up to date with your research data directory.

## Over SSH

1. Connect to SESYNC's Linux gateway with any SFTP client or via SSH using your SESYNC credentials:
   - **Host:** ssh.sesync.org
   - **Username:** %YOUR SESYNC USERNAME%
   - **Password:** %YOUR SESYNC PASSWORD%
   - **Port:** 22
2. Change remote path to your research data directory with `cd /nfs/cooltrees-data`.
