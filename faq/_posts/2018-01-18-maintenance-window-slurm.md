---
title: What happens to my jobs during the maintenance window?
tags:
  - Infrastructure
  - Cluster
  - Maintenance Window
  - Slurm
---

We're sensitive to the fact that your jobs may need to run over our maintenance window and will take a reasonable effort to ensure they aren't disrupted. In order to ensure as minimal disruption as possible, these are the steps that we take:

1. Prior to the outage, a maintenance reservation is applied to the processing nodes. **The maintenance windows starts on the day of the outage at 8AM EST and lasts through Friday at 12AM EST.** Once the maintenance window starts, nodes will be set to 'maintenance' .This means that nodes will continue to run any jobs that have been assigned to them, however they will NOT start running any new jobs from the queue. Any jobs submitted after the reservation begins will go into queue and will start after our maintenance window is over.
2. Once the reservation is scheduled, any **jobs submitted without a time limit will be queued** to ensure that no newly created jobs run into the maintenance window. Jobs with a time limit forcing them to complete before the reservation will run normally. 
3. Starting the day of the outage, we will start patching any nodes that become free. If no additional maintenance is required on related core services, the nodes will be placed back into service after patching. Otherwise, the nodes will remain down until Friday at 12am.

## How can I make sure my job doesn't conflict with the maintenance window?

You can set a time limit on your job that will be reached before the maintenance window begins. This will ensure that the job will not conflict with the maintenance window so that it can start normally and run before the outage begins. *Note that a job that reaches its time limit without completing will automatically be killed.*

If you are submitting your jobs from the command line with `sbatch`, you can use the `--time` argument to set a time limit, in the form `days-hours:minutes:seconds`. For example this will submit a job that will run for a maximum of 2 days.

```
sbatch --time=2-00:00:00 my_job.sh
```

If you are using `slurm_apply()` from the `rslurm` package to submit your job, specify the time limit within the list of options passed to the `slurm_options` argument, like this:

```
slurm_apply(f, params, slurm_options = list(time = '2-00:00:00'))
```

## What if my job doesn't finish before the maintenance window?

We'll allow your job to continue to run and the node which was running it will go offline when your processing finishes so that we can patch it.
