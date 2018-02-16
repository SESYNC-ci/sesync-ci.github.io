---
title: How do I access SESYNC's data storage?
category: faq
tags:
  - data
  - PYDIO
---

SESYNC provides a large, shared file storage for hosting data for all of our projects. Once our IT staff creates a data storage location, its available to access on any Linux or Windows your group has access to. For SESYNC employees and postdocs  you can directly access this storage from your SESYNC desktop or laptop. For all others, we provide a web gateway to your groups' data storage.

In order to access your group's data, you will need to know the short name of the group. Data shares are generally named group_name-data.

## From Linux/RStudio Server

Your storage is available to RStudio and your groups dedicated virtual machines by going to /nfs/group-data. Please note, your directory won't appear in /nfs until you attempt to access it (ie: 'cd /nfs/group-data' and not just 'ls /nfs')

## Transfering data using the ssh gateway

1. Connect to the SESYNC SSH gateway **ssh.sesync.org** with your SFTP client using your SESYNC credentials
   * **Host:** ssh.sesync.org
   * **Username:** \<YOUR SESYNC USERNAME\>
   * **Password:** \<YOUR SESYNC PASSWORD\>
   * **Port:** 22
2. Change Remote site path to `/nfs/<research-data-directory-name>`

![](/assets/images/sftp/sftp00.PNG)

[Bulk Uploads and Downloads by SFTP](http://cyberhelp.sesync.org/quickstart/Bulk-upload-download-FileZilla.html)

## From Windows

From any SESYNC windows virtual machine, desktop, or laptop you can access your groups storage by opening your file browser (your local documents folder) and in the address bar at the top type \\storage.research.sesync.org\group-data

## From a browser

Point your web browser to [https://files.sesync.org](https://files.sesync.org) and use your sesync login and password. You'll see your data directory listed under the workspaces list. Note that the URL of a workspace with short-name "xyz" will appear in your browser as https://files.sesync.org/pydio/ws-xyz/, but a shareable link to this workspace is https://files.sesync.org/pydio/?goto=xyz. The latter takes users to the login page if needed and still ends up at the given workspace.
