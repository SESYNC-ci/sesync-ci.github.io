---
title: Why does does my Virtual Machine show less memory than I requested?
category: faq
tags:
- Windows
- virtual-machine
---

# {{ page.title }}

SESYNC Windows client virtual machines are setup to use dynamic memory. What this means is that your virtual machine will
show different memory usage based on its currente usage, however, you still have access to the full amount of memory
allocated if needed. THe virtual machine will grab more memory from the hypervisor when needed automatically.
