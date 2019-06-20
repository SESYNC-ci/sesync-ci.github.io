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

The maintenance Window is usually a Thursday. A list of remaining maintenance windows for 2018 are listed below:

* February 21st, 2019
* March 28th, 2019
* April 18th, 2019
* May 23rd, 2019
* June 20th, 2019
* July 18th, 2019
* August 22nd, 2019
* September 19th, 2019
* October 17th, 2019
* November 21st, 2019
* December 19th, 2019

## What happens to my scheduled jobs during the maintenance window?

[Slurm cluster maintenance window details]({{ '/faq/maintenance-window-slurm.html' | relative_url }})

## Patching Schedule and Notes

Starting the Wednesday before the outage, systems that can be patched without interruption will be patched during the day. All critical systems will be done after 5PM on Outage day.

* The Slurm cluster will be reserved for maintenance starting the Thursday at 8am on Outage day. As nodes become available, they will be patched and returned to service. If the IT staff has scheduled additional maintenance on core services that Slurm nodes rely on, the maintenance will continue until 12am Friday.


* Please note, in the event of a major security patch, we will immediately take downtime and patch all necessary systems (IE, heartbleed, etc)*
