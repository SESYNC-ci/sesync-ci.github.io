---
title: Bulk Uploads and Downloads by SFTP
category: quickstart
tags:
 - data
---

# {{ page.title }}

You can upload and download data from your research data directory using an SFTP client. We recommend [FileZilla](https://filezilla-project.org)

## Steps to connect to your research data directory

1. Connect to the SESYNC SSH gateway **ssh.sesync.org** with your SFTP client using your SESYNC credentials
   * **Host:** ssh.sesync.org
   * **Username:** \<YOUR SESYNC USERNAME\>
   * **Password:** \<YOUR SESYNC PASSWORD\>
   * **Port:** 22
2. Change Remote site path to `/nfs/<research-data-directory-name>`

![](/assets/images/sftp/sftp00.PNG)

## Upload data

1. Navigate to the data to be uploaded in the left pane
2. Right-click data to be uploaded and select **Upload**

![](/assets/images/sftp/sftp01.PNG)

## Download data

1. Navigate to the data to be downloaded in the right pane
2. Right-click data to be downloaded and select **Download**

![](/assets/images/sftp/sftp02.PNG)
