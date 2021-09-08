---
title: "What are common options for Slurm jobs, and how do I set them?"
tags:
 - Cluster
 - Slurm
---

There are a few different ways to run a job on SESYNC's [Slurm compute cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }}), but all of them ultimately run a command called `sbatch` to submit the job to the cluster. The `sbatch` program is part of the Slurm software package and has a lot of different options. These include a maximum length of time your jobs can run, how much memory you are requesting, whether you want to be notified by email when your job finishes running, etc. It's possible to run a Slurm job without setting any of the options and going with all defaults, but there are times when you might want to customize the options. 

The official [help documentation for sbatch](https://slurm.schedmd.com/sbatch.html) is great, but it's a lot to wade through. Here are some common SESYNC-specific options that you might want to set on your Slurm jobs, and how to set them either from the command line or through [the rslurm package]({{ 'rslurm' | relative_url }}).

## Setting Slurm job options on the command line

If you are submitting a Slurm job from the command line directly, you include the options with your call to `sbatch`. For example if you want to submit a job with four array tasks called `cool_job` that runs a shell script called `my_script.sh` you could write:

```
sbatch --job-name=cool_job --array=1-4 my_script.sh
```

Alternatively, some options have single-letter (case-sensitive!) shortcuts so this is equivalent to the above. *Note: you do not use an equal sign when using these shortcuts.*

```
sbatch -J cool_job -a 1-4 myscript.sh
```

## Setting Slurm job options within rslurm

If you are submitting a Slurm job using [the rslurm package]({{ 'rslurm' | relative_url }}), some of the options are included in the default arguments to `slurm_apply()`[^1], specifically `array`, `job-name`, `ntasks`, `nodes`, `cpus-per-task`, and `output`. If you want to specify any other options  not included in the default arguments, pass them as a named list to the `slurm_options` argument. Enclose the list names in quotes or backticks if the `sbatch` option names contain hyphens, as in the example below. *You cannot use the single-letter shortcuts through rslurm!* 

For example, let's say you want to submit a job called `cool_job` that runs an R function called `my_function()` and you want to get an email to your SESYNC address when the job either ends successfully or fails. You can specify that option by writing your call to `slurm_apply()` like this:

```
slurm_apply(my_function, my_data, jobname = 'cool_job', 
            nodes = 1, cpus_per_node = 4, 
            list("mail-type" = 'END,FAIL', "mail-user" = 'jdoe@sesync.org'))
```

## Some useful Slurm options

As promised above, here is a table with the SESYNC-specific options that we have found the most useful for running cluster jobs, in roughly descending order of how important they are. See the [help documentation for sbatch](https://slurm.schedmd.com/sbatch.html) for more details and more options. 

| Name | Shortcut | Example | What it does | Included in rslurm? |
| --array | -a | `--array=1-10%5` | How many copies of the script to run. In the example, the `%5` is optional; it means to run no more than 5 tasks at once. At SESYNC it is nice to set that extra option to be a good neighbor and make sure you don't use up the entire compute cluster! | yes |
| --job-name | -J | `-J awesome_job` | The job's name, of course! | yes |
| --export | *none* | `--export=x=50,y=foo` | Variables you want to pass to the job script. See details below[^2]. | no |
| --time | -t | `-t 12:00:00` | Maximum time your job will run before being killed. At SESYNC, you only need to specify this if a scheduled [maintenance outage]({{ '/faq/maintenance-window-slurm.html' | relative_url }}) is coming up and you want your job to run before the outage begins. | no |
| --ntasks | -n | `-n 8` | How many parallel processes your job will start | yes |
| --nodes | -N | `-N 1` | How many nodes to request (each node has multiple processors so you can run parallel code within a single node) | yes |
| --cpus-per-task | -c | `-c 4` | How many processors are needed for a single task | yes |
| --mem-per-cpu | *none* | `--mem-per-cpu=20gb` | How much memory to allocate to each CPU on a node. | no |
| --mail-type | *none* | `--mail-type=END,FAIL` | A list of events that will cause the job to send you an email, usually when it finishes or is killed. | no |
| --mail-user | *none* | `--mail-user=jdoe@sesync.org` | Address that the job will send emails to. | no |

## For more information

- [Quickstart: Using the SESYNC cluster]({{ 'quickstart/Using-the-SESYNC-Cluster.html' | relative_url }})
- [FAQ: What is the SESYNC cluster?]({{ '/faq/What-is-the-SESYNC-cluster.html' | relative_url }}) 
- [FAQ: Do I have to use the cluster?]({{ '/faq/Do-I-have-to-use-the-cluster.html' | relative_url }}) 
- [Homepage of the rslurm package](http://cyberhelp.sesync.org/rslurm/)
- [Slurm documentation](https://slurm.schedmd.com/)

Also, try filtering the FAQ and Quickstart pages by the "Slurm" tag for more information!

[^1]: Or `slurm_call()` or `slurm_map()`.

[^2]: **Note on --export**: This is very useful if you have a general job script that you want to run at different times with different input files. For example if you write `--export=input_file=data.csv,output_file=job_output.csv`, `sbatch` will pass two strings to the job script, one for the name of the input file and out for the name of the output file. Your job script will need to refer to those two variable names.