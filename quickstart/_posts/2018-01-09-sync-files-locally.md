---
title: Local Sync for Research Data
tags:
  - NFS
  - Data
---

## Nextcloud

SESYNC users can maintain local copies of data in their
[research data directory]({{ 'quickstart/research-data-directory.html'
| relative_url}}) using the Nextcloud sync client. The sync client
provides another way to put data into your research data directory, so
it is accessible to colleagues with access to the same research data
directory.

The first time you log in to Nextcloud, you will be prompted to
install the sync client. This is optional. If you choose to install it
at a later date, download the installer for Windows or macOS from
[nextcloud.com](https://nextcloud.com).

## Setup

1. Install the [desktop client](https://nextcloud.com/install/#install-clients)
on your Windows or macOS computer.

    ![]({{ '/assets/images/nextcloud1.png' | relative_url }}){:.doc-img}

2. Open the Nextcloud application for the first time. You will be prompted to first Log in, and then
configure a server.

    ![]({{ '/assets/images/nextcloud3.png' | relative_url }}){:.doc-img}

3. Configure the connection:
   1. Enter `https://files.sesync.org/` for the server.
   1. Provide your SESYNC username and password.
   1. Customize the Server (what to sync). Your research data directory is an "external storage", so do not check the second box.
   1. Choose the Local Folder (where to sync).

    ![]({{ '/assets/images/nextcloud-configure.png' | relative_url }}){:.doc-img}

1. Confirm that the folders you want to sync are active. Find the new green
check-box icon (![]({{ '/assets/images/nextcloud-app-icon.png' | relative_url
}}){:.doc-inline-img}) in your app tray, and open the Nextcloud "Settings".
