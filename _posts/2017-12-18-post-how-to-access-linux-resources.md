---
title: How to access Linux Resources 
category: FAQ
tags:
  - shell
  - ssh
---

SESYNC linux resources are deployed on a private network at SESYNC. This means that you can access the internet from the machine to retrieve data (curl, wget, etc), however in order to push data to the machine, you either need to load data into your workspace, or use our ssh gateway to transfer data on to your research storage space.

## Connecting to your linux virtual server
1. Use an ssh client (we recommend PUTTY http://www.chiark.greenend.org.uk/~sgtatham/putty/)
2. Enter ssh.sesync.org as your Host Name and click Open

![Connect with PUTTY](/https://github.com/SESYNC-ci/sesync-ci.github.io/upload/master/assets/images/ssh1.png)

Once connected to ssh.seysnc.org, you will need to connect into your dedicated resource. Please DO NOT run your computational processing on the ssh gateway, it has limited memory and processing power.

![ssh gateway](/https://github.com/SESYNC-ci/sesync-ci.github.io/upload/master/assets/images/ssh2.png)

