---
title: How do I Access Linux Resources?
category: FAQ
tags:
  - shell
  - ssh
---

# {{ page.title }}

SESYNC linux resources are deployed on a private network at SESYNC and are accessed via our ssh gateway at ssh.sesync.org.

## Connecting to your linux virtual server
1. Use an ssh client (we recommend [PUTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/))
2. Enter ssh.sesync.org as your Host Name and click Open

![Connect with PUTTY](/assets/images/ssh1.png)

Once connected to ssh.seysnc.org, you can do any of the following:
1. Connect (using ssh again from the gateway) to your dedicated linux VM (requires SESYNC to set up the VM for you/your group; see image below)
2. Transfer data to your research storage space (using, e.g., scp, wget, sftp, curl)
3. [Submit a script to the scheduled cluster](http://cyberhelp.sesync.org/quickstart/how-do-i-submit-an-r-script.html)

Please DO NOT run your computational processing on the ssh gateway, it has limited memory and processing power.

![ssh gateway](/assets/images/ssh2.png)

