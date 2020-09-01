---
title: When are the server maintenance windows?
tags:
 - Maintenance Window
 - Infrastructure
---

{{ page.title }}

SESYNC schedules a monthly maintenance to patch, apply updates, and perform other potentially disruptive activities. 
The window is calculated each month by adding 9 days to Microsoft's [Patch Tuesday](http://en.wikipedia.org/wiki/Patch_Tuesday). 
This allows us to marshal patches released that month from Microsoft, Red Hat, Ubuntu and our other vendors and have enough time
to get our systems prepared to reboot for that month's window.

The maintenance Window is usually a Thursday. Check the 
[list of upcoming maintenance window dates](https://wiki.umiacs.umd.edu/umiacs/index.php/MonthlyMaintenanceWindow) 
from University of Maryland's Institute for Advanced Computer Studies to see the dates of the next few scheduled outages.

## What happens to my scheduled jobs during the maintenance window?

[Slurm cluster maintenance window details]({{ '/faq/maintenance-window-slurm.html' | relative_url }})

## Patching Schedule and Notes

Starting the Wednesday before the outage, systems that can be patched without interruption will be patched during the day. All critical systems will be done after 5PM on Outage day.

* The Slurm cluster will be reserved for maintenance starting the Thursday at 8am on Outage day. As nodes become available, they will be patched and returned to service. If the IT staff has scheduled additional maintenance on core services that Slurm nodes rely on, the maintenance will continue until 12am Friday.


* Please note, in the event of a major security patch, we will immediately take downtime and patch all necessary systems (IE, heartbleed, etc)*
