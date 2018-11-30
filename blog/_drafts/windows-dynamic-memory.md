---
title: Adventures in Windows Dynamic Memory
tags:
 - Windows
---

# {{ page.title }}

SESYNC's virtual machines are setup to use dynamic memory. What this means is that your virtual machine will
show different memory usage based on its current usage, however you still have access to the full amount we allocated to you.  

Example  

----------

For example, SESYNC may allocate up to 64GB for your virtual machine, however when you connect
to your machine you may only see a fraction of that if you run 'free' or in the windows task manager.
When your processing starts and requests memory, your allocation will automatically increase up to the
limit that we've allocated for you.  

Why do you do this?
-------------------

In a nutshell, its to more efficiently use our resources.

We've found that most virtual machines we allocate are not used 24 hours a day, 7 days a week,
but rather they tend to be used intensly for a few days or week and are idle for the following
weeks or even months. By using dynamic memory we are able to automatically reallocate unused resources
from idle virtual machines to busy ones. If we didn't use dynamic memory, during this idle time these
virtual machines would just be occupying memory that may be needed by other groups. This wastes the memory
itself and power needed to keep the memory online.

Does this mean memory may not be available for me?  

-----------------------------------------------------

Theoretically if every virtual machine requested to use its maximum allowed memory at the same time this could happen.
In practice this doesn't happen (and never has) because SESYNC staff closely monitors our virtual cluster resources and
overall usage to ensure that there are adqeuite resources available at all times. In addition, VM's are able to migrate
to servers that have available resources.  

Does Dynamic Memory cause problems?
-----------------------------------

We have noticed that some applications (R specifically) will look at the computer memory available upon startup and refuse
to allocate more than that amount.

*   **R** -  Restartarting R after a quick test run usualy forces the memory to increase and R will then use the new amount.
Alternatively, you can supply R with the --max-mem-size flag as described on [stack overflow.](http://stackoverflow.com/questions/1395229/increasing-the-memory-available-to-r-processes)
*   **Java** -  Sometimes the jvm will specify a small heap size, this will result in your application possibly performing
excessive garbage collection and impacting performance. You can fix this by passing -Xmx to java.
Please see [Oracle's documentation](http://docs.oracle.com/cd/E15523_01/web.1111/e13814/jvm_tuning.htm#PERFM159) for information on how to set your heap size.
