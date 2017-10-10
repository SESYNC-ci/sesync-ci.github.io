---
category: quickstart
tags:
 - NFS
 - Data
---

# {{ page.title }}

## Transfer data using the web portal

All of our data directories are accessible via a web portal, this portal allows
you to upload, download and arrange your data on SESYNC's storage

1. Go to <https://files.sesync.org>, log in using your sesync username and
   password.
2. Select the workspace corresponding to your data share and upload data.

## Syncing your data directory to a PC

We are currently beta testing data share syncing. If you would like to help us
test, please contact SESYNC's IT staff.  Our web portal has the ability to sync
data directly to your PC similar to Dropbox. In order do to this, you will need
to use the Pydio Desktop Client available for download at:
<https://pyd.io/apps/pydio-sync/>

## Using the Pydio Sync Client for Windows

## Transfering data using the ssh gateway

You can use any sftp client of your choice to connect to our ssh gateway and
transfer data. We recomend the Filezilla client. In order to move data, you will
need to know the name of your file share, this name is the short name (same name
as your collab site and/or your mailing list) of your group appended with
-data. For example, if your group's data is at
<https://files.sesync.org/pydio/ws-environmental-project>, your file share would be
"environmental-project-data".

All research file shares are available on both your linux virtual machine and on
our ssh gateway at "/nfs/FILE_SHARE".  Using sftp from a remote site you can
transfer data to "sftp://ssh.sesync.org/nfs/FILE_SHARE". From a linux virtual
machine, cd "/nfs/FILE_SHARE" to access your project.

[Using FileZilla to Upload Data.](https://collab.sesync.org/sites/support/Frequently%20Asked%20Questions/Using%20FileZilla%20to%20Upload%20Data.aspx)

## Accessing your data from your Windows VM (<https://desktop.sesync.org>)

There are two methods, you can either directly access the share on our file
server or by mapping a drive to your file share. For sesync postdocs and staff,
you can use this method to directly access your file share while at SESYNC or
connected via VPN.

Direct access
: From your Windows desktop, press the start button, type
"\\storage.research.sesync.org\FILE_SHARE".

Map a network drive
: From your Windows desktop, click the file explorer icon in the task bar
(folder icon). Then right-click "This PC" & choose "map network drive". In the
"folder" space, type "\\storage.research.sesync.org\FILE_SHARE"
