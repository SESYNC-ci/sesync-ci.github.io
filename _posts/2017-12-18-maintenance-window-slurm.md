---
title: What happens to my jobs during the maintenance window?
category: FAQ
tags:
  - infrastructure
  - cluster
  - maintenace-window
---

# What happens to my jobs during the maintenance window? 
We're sensitive to the fact that your jobs may need to run over our maintenance window and will take a reasonable effort to ensure they aren't disrupted. In order to ensure as minimal disruption as possible, these are the steps that we take:

1. Prior to the outage, a maintenace reservation is applied to the processing nodes. **The maintenance windows starts on the day of the outage at 8AM EST and lasts through Friday at 12AM EST.** Once the maintenance window starts, nodes will be set to 'maintenance' .This means that nodes will continue to run any jobs that have been assigned to them, however they will NOT start running any new jobs from the queue. Any jobs submitted after the reservation begins will go into queue and will start after our maintenance window is over.
2. Once the reservation is scheduled, any jobs submitted without a time limit will be queued to ensure that no newly created jobs run into the maintenance window.
3. Starting the day  before the outage (Wednesday), we will start patching any nodes that become free. If no additional maintenance is required on related core services, the nodes will be placed back into service after patching. Otherwise, the nodes will remain down until Friday at 12am.

### What if my Job doesn't finish before the maintenance window?

We'll allow your job to continue to run and the node which was running it will go offline when your processing finishes so that we can patch it.
