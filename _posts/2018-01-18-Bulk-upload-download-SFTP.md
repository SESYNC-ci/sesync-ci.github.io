---
title: Bulk Uploads and Downloads by SFTP
category: quickstart
tags:
 - data
 - NFS
---


You can upload and download data from your research data directory using an SFTP client. We recommend [Cyberduck](https://cyberduck.io/) or [WinSCP](https://winscp.net/eng/download.php)

## Steps to connect to your research data directory using Cyberduck

1. Connect to the SESYNC SSH gateway **ssh.sesync.org** with your SFTP client using your SESYNC credentials
   * **Protocol:** SFTP
   * **Host/Srver:** ssh.sesync.org
   * **Username:** \<YOUR SESYNC USERNAME\>
   * **Password:** \<YOUR SESYNC PASSWORD\>
   * **Port:** 22
   * **More Options -> Path:** `/nfs/<research-data-directory-name>`

![](/assets/images/sftp/cyberduck-connection.png)

## Upload data

1. Click Upload
2. Navigate to data to be uploaded and select data
3. Click Choose, click Allow if prompted



![](/assets/images/sftp/cyberduck-upload.png)

## Download data

1. Navigate to the data to be downloaded in the right pane
2. Right-click data to be downloaded and select **Download**

![](/assets/images/sftp/cyberduck-download.png)
