---
category: quickstart
tags:
 - NFS
 - data
---

SESYNC provides a large, shared file store to host data for all of our projects.
Once our IT staff creates a research data directory location, it's accessible
from any Linux, macOS, or Windows machine (including Virtual Machines) that you
have access to. Computers on the "sesync-secure" network, including desktops and
laptops used by SESYNC postdocs and employees, can map the research data
directory into the file browser. Funded project participants, visitors, and
staff all have access to their research data directory through our compute
servers, a web portal, a desktop application for syncing, and SSH.

For **large uploads** (i.e. more than 10GB), please use a
[SFTP](https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol) client for
faster and secure data transfer. See our Quickstart guide on [Bulk Uploads and
Downloads by SFTP]({{'/quickstart/Bulk-upload-download-SFTP.html' | relative_url }})
for recommendations and useage details.

The "PROJECTNAME" variable referenced below is assigned by SESYNCs IT staff at
creation. It will either be a short project title or an individual's SESYNC
login.

## RStudio Server and other Linux Machines

Any research data directory you have permission to access is available at the
filesystem path at `/nfs/PROJECTNAME-data`. Please note, these directories won't
appear within the `/nfs` directory until you attempt to access it (i.e. by `cd
/nfs/PROJECTNAME-data` rather than `ls /nfs`). The path is the same on all our
Linux systems, including virtual machines and the [RStudio Server]({{
'/quickstart/rstudio-server.html' | relative_url }}). From a Linux shell, type
`cd /nfs/PROJECTNAME-data` to set your working directory to your research data
directory.

## Windows

From a Windows virtual machine (e.e. at <https://desktop.sesync.org>) as well as
desktops or laptops on the "sesync-secure" network or the VPN, you can access a
research data directory by opening the file browser (e.g. open your Documents
folder) and entering `\\storage.research.sesync.org\PROJECTNAME-data` in the
address bar. For regular access, you could map a network drive letter to your
research data directory. Click the file explorer icon in the task bar (folder
icon). Then right-click "This PC" & choose "map network drive". In the "folder"
space, type `\\storage.research.sesync.org\PROJECTNAME-data`.

For computers not on SESYNC's internal network, use a [sync
client]({{ 'quickstart/sync-files-locally.html' | relative_url }}) to keep a local folder
up to date with your research data directory.

## macOS

From a macOS desktop or laptop on "sesync-secure" or the VPN, you can access a
research data directory by opening Finder, navigating to "Go > Connect to Server
..." and entering `smb://storage.research.sesync.org/PROJECTNAME-data` as the
server address.

For computers not on SESYNC's internal network, use a [sync
client]({{ '/faq/syncing-data-local.html' | relative_url }}) to keep a local folder
up to date with your research data directory.

## Web Browser

All research data directories are also accessible via a web browser---this portal
allows you to upload, download and organize your data on SESYNC's storage.

1. Go to <https://files.sesync.org>, log in using your SESYNC username and
   password.
2. Open the folder corresponding to your project (i.e. `PROJECTNAME-data`)
3. Upload\download\organize data.

## Over SSH

1. Connect to SESYNC's Linux gateway with any SFTP client or via SSH using your SESYNC credentials:
   - **Host:** ssh.sesync.org
   - **Username:** %YOUR SESYNC USERNAME%
   - **Password:** %YOUR SESYNC PASSWORD%
   - **Port:** 22
2. Change remote path to `/nfs/PROJECTNAME-name`
