---
title: "Where should I store temporary files created by Slurm cluster jobs?"
tags:
 - Cluster
 - NFS
 - Slurm
 - Infrastructure
---

Many jobs on the Slurm compute cluster generate lots of big files that require large amounts of memory to be stored but are only needed temporarily. There are two different ways to easily store large temporary files created by cluster jobs: **temporary storage** on a specific node (`/tmp/`) and **scratch space** accessible from all nodes (`/nfs/scratch/`).

## Temporary storage

Each node has a location called `/tmp/` that can store roughly 100GB and is only accessible from within that node. This is useful for files that you create during the job but that you will no longer need to access after the job is completed. Files in `/tmp/` are deleted once the job terminates.

## Scratch space

All nodes and all users can access `/nfs/scratch/`, where you can store large files. The scratch space is intended for intermediate data that you will only need temporarily but that you do need to access after the job is finished running. Read and write speeds are somewhat slower for `/nfs/scratch/`, but the storage space is much larger and the files are still preserved after the job is completed. **Important Note**: the scratch space is not intended for long-term storage! Use your own or your group's research data directory for longer-term needs.

## Example usage within an R script

If you want to write files to the scratch space within an R script, it is probably a good idea to make a subdirectory within `/nfs/scratch/` since it is a communal space that anyone can see. Here is an example:

```
mydata <- data.frame(a = letters, b = 1:26) # fake data

# Create directory in scratch space
dir.create('/nfs/scratch/myfolder/')

# Write CSV to directory
write.csv(mydata, '/nfs/scratch/myfolder/mydata.csv')
```

After the job finishes, you will still be able to access the scratch directory and its contents.
