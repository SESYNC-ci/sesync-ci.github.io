---
title: How do I access my research data directory?
category: faq
tags:
  - data
  - PYDIO
  - ssh
---

SESYNC provides a large, shared file store to host data for all of our projects. Once our IT staff creates a research data directory location, it's can be reached from any Linux, macOS, or Windows machine (including Virtual Machines) that you have access to. Computers on the "sesync-private" network, including desktops and laptops for SESYNC postdocs and employees, can map the research data directory into their file explorer. For others, SESYNC provides a web portal and ssh access to the shared file store.

In order to access a research data directory, you will need to know the "workspace" name, which is either a group's short name or an individual's SESYNC login.

## From RStudio Server and other Linux Machines

Any research storage directory you have permission to access is available at the filesystem path at /nfs/%WORKSPACE%-data. Please note, these directories won't appear within the /nfs directory until you attempt to access it (i.e. by 'cd /nfs/%WORKSPACE%-data' rather than 'ls /nfs').

## From Windows

From a Windows desktop or laptop on "sesync-private" or any virtual machine, you can access a research data directory by opening the file browser (e.g. open your Documents folder) and entering \\\storage.research.sesync.org\%WORKSPACE%-data in the address bar.

## From macOS

From a macOS desktop or laptop on "sesync-private" you can access a research data directory by opening Finder, navigating to "Go > Connect to Server ..." and entering smb://storage.research.sesync.org/%WORKSPACE%-data as the server address.

## From a Browser

Point your web browser to [https://files.sesync.org](https://files.sesync.org) and use your SESYNC login and password. You will see your research data directory under the workspaces list.

## Over SSH

1. Connect to SESYNC's Linux gateway, **ssh.sesync.org**, with your SFTP client or via ssh using your SESYNC credentials
   * **Host:** ssh.sesync.org
   * **Username:** %YOUR SESYNC USERNAME%
   * **Password:** %YOUR SESYNC PASSWORD%
   * **Port:** 22
2. Change Remote site path to "/nfs/%WORKSPACE%-name"

![](/assets/images/sftp/sftp00.PNG)

Find out more information about [bulk uploads and downloads by SFTP](http://cyberhelp.sesync.org/quickstart/Bulk-upload-download-FileZilla.html).
