---
title: Command-line Stata (from RStudio Server)
tags:
  - RStata
  - Stata
  - RStudio
  - Virtual Machine
  - SSH
---

To support existing data analysis pipelines that use the Stata software, SESYNC
has purchased a Stata license and created a dedicated virtual machine for remote
use by affiliated researchers. This quick start guide explains the essential
steps for evaluating Stata commands over SSH or from SESYNC's RStudio server.

## Stata Server

Stata is installed on a Linux server with address "stata.sesync.org", that
affiliated researchers can access through a terminal/console using SSH. For
example, a user logged into our [RStudio](https://rstudio.sesync.org),
[Jupyter](https://jupyter.sesync.org), or [gateway]({{ 'faq/how-to-access-linux-resources.html' | relative_url }}) servers can open a terminal and execute
`ssh stata.sesync.org` to reach the server with the Stata software.

The first time you `ssh` to this or any server, you will be asked to confirm the
remote machine's identity. **Do this even if you only plan to use the RStata package**.

```
<USERNAME>@rstudio03$ ssh stata.sesync.org
The authenticity of host 'stata.sesync.org (192.168.***.***)' can't be established.
ED25519 key fingerprint is SHA256:*******************************************.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'stata.sesync.org,192.168.***.***' (ED25519) to the list of known hosts.
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-143-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Last login: Thu Apr  4 10:50:22 2019 from 192.168.***.***
<USERNAME>@stata00:~$
```

With your terminal now connected to this server, launch the console version of
Stata for interactive use by calling `stata`. As on all our compute platforms,
your [research data directory]({{ "quickstart/research-data-directory.html" |
relative_url }}) is accessible from the Stata console.

```
<USERNAME>@stata00:~$ stata

  ___  ____  ____  ____  ____ (R)
 /__    /   ____/   /   ____/
___/   /   /___/   /   /___/   15.1   Copyright 1985-2017 StataCorp LLC
  Statistics/Data Analysis            StataCorp
                                      4905 Lakeway Drive
                                      College Station, Texas 77845 USA
                                      800-STATA-PC        http://www.stata.com
                                      979-696-4600        stata@stata.com
                                      979-696-4601 (fax)

Single-user Stata perpetual license:
       Serial number:  ************
         Licensed to:  University of Maryland-SESYNC
                       1 Park Pl Suite 300 Annapolis MD 21401

Notes:
      1.  Unicode is supported; see help unicode_advice.

. exit
<USERNAME>@stata00:~$
```

## RStata Package

The [RStata](https://cran.r-project.org/package=RStata) package facilitates
using R to send input and receive output from Stata. The package documentation
describes communicating with Stata software installed on the same machine as R,
but is conveniently written to also allow communication with a remote
installation.

For the time being, you need a patched version of the RStata package in order to
use it sucessfully on SESYNC's servers. Use [devtools]() to install the RStata
package:

```r
library(devtools)
install_github('lbraglia/RStata', ref = github_pull(8))
```

The package requires configuration of two options: the "path" to the
Stata executable and the Stata version number. From our RStudio server, these
options should be set as follows.

```r
library(RStata)

options(RStata.StataPath='ssh -q stata.sesync.org /usr/local/stata15/stata')
options(RStata.StataVersion=15)
```

To confirm that the options are correctly set, use the `stata` function
to send the one-line command requesting Stata to print its version:

```r
stata('version')
````

The `stata` function alternatively accepts the path to a Stata ".do"
file, which will be much more efficient than running multiple
one-liners. The `?stata` help describes how to use `data.in` and
`data.out` arguments to handle data transmission, but we strongly
discourage their use. Instead, have both R and Stata read and write data
to a location on our network file system, accessible at [files.sesync.org](https://files.sesync.org/index.php/login). 
Both servers have access to the same data directories.

Here is a simple ".do" file that demonstrates reading and writing to your 
project's path `<PROJECT>-data` on the network file system.

```stata
use /nfs/<PROJECT>-data/training/census
tabulate TRACT
collapse RENTER_OCC OWNER_OCC MED_AGE
save /nfs/<PROJECT>-data/training/census_summary, replace
```

Assuming this file is saved as "example.do" in the working directory,
you can execute it from R using the `stata` function.

```r
stata('example.do')
```

The `haven` package handles reading and writing Stata's native `.dta`
files, for both recent and older versions of the Stata software. A
complete pipeline making use of R and Stata could look like the
following:

```r
library(RStata)
library(haven)

options(RStata.StataPath='ssh -q stata.sesync.org /usr/local/stata15/stata')
options(RStata.StataVersion=15)

# read data into R
to_stata <- read.csv('/nfs/<PROJECT>-data/training/census.csv')

# process the to_stata data.frame in R
# ...

# save data to network file system
write_dta(to_stata, '/nfs/<PROJECT>-data/training/census.dta')

# continue processing in Stata
stata('example.do')

# read result back into R
from_stata <- read_dta('/nfs/<PROJECT>-data/training/census_summary.dta')
head(from_stata)
```
