---
title: Share Files and Folders with Anyone
tags:
  - NFS
  - data
---

SESYNC researchers and staff can provide a link for external collaborators to
upload (donwload) files to (from) any research data directory they can access.
We recommend this mechanism for receiving datasets from external collaborators:
create a new folder and turn it into a public "file drop", as described below.

1. Access a research data directory via <https://files.sesync.org>, using your
SESYNC username and password.

    ![]({{ '/assets/images/nextcloud-login.png' | relative_url }}){:.doc-img}

1. Click the share icon (![]({{ '/assets/images/nextcloud-share.svg' |
relative_url }})) to the right of a file or folder to open its sharing status in
the sidebar.

1. Add recipients:
  - (Internal). To share with SESYNC users, type their full name in the search
  box in the sidebar.
  - (External). To share with people not in the contacts list, check "Share
  link" or enter an email address.
  
    ![]({{ '/assets/images/nextcloud-share-email.png' | relative_url }}){:.doc-img}
  
1. Choose the type of share:
  - to *only receive* files check "File drop (upload only)"
  - to *share privately* check "Password protect" and create a secure password
  - to *share temporarilly* check "Set expiration date" and choose when the
  share will be terminated
  
    ![]({{ '/assets/images/nextcloud-share-link.png' | relative_url }}){:.doc-img}
  
1. If you selected "Share link", you must send the link to each recipient. If
you selected "Password protect", you must distribute the password to each
recipient. Use a secure means to share passwords, such as <https://pwpush.com>.
Email is not considered secure.

See the complete [Nextcloud Documentation](https://docs.nextcloud.com/) for
additional information.
