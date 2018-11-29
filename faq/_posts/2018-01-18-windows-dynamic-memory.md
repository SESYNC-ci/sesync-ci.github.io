---
title: Why does does my virtual machine show less memory than I requested?
tags:
- Windows
- virtual-machine
---


SESYNC Windows client virtual machines are setup to use dynamic memory. What this means is that your virtual machine will
show a different amount of memory available based on its current usage. You still have access to the full amount of memory
allocated if needed. The virtual machine will grab more memory from the hypervisor when needed automatically.
