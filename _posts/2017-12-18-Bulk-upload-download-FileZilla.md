---
title: Bulk uploading or downloading data using an SFTP client
category: quickstart
tags:
- data
---

# {{ page.title }}

You can upload and download data from your research data directory using an SFTP client. We recommend [FileZilla](https://filezilla-project.org)

## Steps to connect to your research data directory

1. Connect to the SESYNC SSH gateway **ssh.sesync.org** with your SFTP client using your SESYNC credentials
  * **Host:** ssh.sesync.org
  * **Username:** [YOUR SESYNC USERNAME]
  * **Password:** [YOUR SESYNC PASSWORD]
  * **Port:** 22
2. Change Remote site path to /nfs/**research-data-directory-name**
