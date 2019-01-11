---
title: How to execute Stata commands from SESYNC's RStudio Server
category: quickstart
tags:
  - RStata
  - Stata
  - Virtual Machine
---


To support existing data analysis pipelines that use the Stata software,
SESYNC has purchased a Stata license and created a dedicated virtual
machine for its remote use by affiliated researchers. This "how to"
explains the essential steps that users should take in order to evaluate
Stata commands from SESYNC's RStudio server.

Communication between servers
-----------------------------

The Stata software is available on a Linux server at "stata.sesync.org",
which is only accessible to other servers on the SESYNC network. Our
RStudio server can be accessed from the web, at
<https://rstudio.sesync.org>, and that machine can access the server
running Stata. The first step is to create an SSH key pair to automate
"logging in" to the server running Stata.

1.  Login at <https://rstudio.sesync.org>
2.  Go to "Tools" > "Global Options" > "Git/SVN"
3.  Select "Create RSA Key", leave the password fields empty, and choose
    "Create"
4.  Click "Accept"/"Okay"/"Continue"/"Close" until the pop-up windows go
    away
5.  Execute the following two commands in the R console:

<!-- -->

    system('cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys')
    system('ssh-keyscan -t ecdsa -H stata.sesync.org >> ~/.ssh/known_hosts')

Those familiar wih SSH authentication may doubt these instructions. The
"trick" is that user home directories are portable on SESYNC's
virtualized infrastructure.

Using the `RStata` package
--------------------------

The [RStata](https://cran.r-project.org/package=RStata) package
facilitates sending input and receiving output from the Stata program.  
The package documentation describes communicating with Stata software
installed on the same machine as R, but is conveniently written to also
allow communication with a remote installation.  The package require two
pieces of user input: the "path" to the Stata executable and the Stata
version number.  From our RStudio server, these options should be set as
follows.

    library(RStata)

    options(RStata.StataPath='ssh -q stata.sesync.org /usr/local/stata15/stata')
    options(RStata.StataVersion=15)

To confirm that the options are correctly set, use the `stata` function
to send the one-line command requesting Stata to print its version:

    stata('version')

The `stata` function alternatively accepts the name of a Stata ".do"
file, which will be much more efficient than running multiple
one-liners.  The `?stata` help describes how to use `data.in` and
`data.out` arguments to handle data transmission, but we strongly
discourage their use.  Instead, have both R and Stata read and write data
to a location on our network file system.  Both servers have access to
the same data directories.

Here is a simple ".do" file that demonstrates reading and writing to the
"public-data" path on the network file system.

    use /nfs/public-data/training/census5
    tabulate region
    collapse marriage_rate divorce_rate median_age
    save /nfs/public-data/training/census5_summary, replace

Assuming this file is saved as "example.do" in the working directory,
you can execute it from R using the `stata` function.

    stata('example.do')

The `haven` package handles reading and writing Stata's native `.dta`
files, for both recent and older versions of the Stata software. A
complete pipeline making use of R and Stata could look like the
following:

    install.packages("haven")
    library(haven)

    # read data into R
    to_stata <- read.csv('/nfs/public-data/training/census5.csv')

    # process the to_stata data.frame in R
    # ...

    # save data to network file system
    write_dta(to_stata, '/nfs/public-data/training/census5.dta')

    # continue processing in Stata
    stata('example.do')

    # read result back into R
    from_stata <- read_dta('/nfs/public-data/training/census5_summary.dta')
    head(from_stata)


Added benefit: use your SSH key on GitLab/GitHub
------------------------------------------------

The SSH key pair you created to authenticate between our RStudio and
Stata servers can be used for passwordless authentication on all your
favorite remote git repositories! Follow the steps below to start using
SSH rather than HTTPS along with your username and password to push and
pull git commits.

1.  Login to <https://rstudio.sesync.org>
2.  Select "Tools" > "Global Options" > "Git/SVN"
3.  Choose "View public key"
4.  Copy the key to your clipboard and
    "Accept"/"Okay"/"Continue"/"Close" all the windows
5.  Login to your remote git repository to add your public key:
    -   <https://github.com>: click on your avatar (upper right) >
        "Settings" > "SSH and GPG keys" > "New SSH key"
    -   <https://gitlab.sesync.org>: click on your avatar (upper
        right) > "Settings" > "SSH Keys" > (Go To Step 6) >
        "Add key"
6.  Paste the key in the larger box, copy the last part that is formated
    like an e-mail address to use as the title or label
7.  Change the URL for your remote git repository
    -   Get the URL from GitHub/GitLab for SSH (it begins with `git@`)
    -   Use the URL in the command
        `system('git remote set-url origin URL')`.

That's it! You should be able to push and pull between your git
repository on <https://rstudio.sesync.org> and the remote repository.
While your SSH key pair is shared across all your repositories on
<https://rstudio.sesync.org>, you'll need to update the URL for each
existing repository that you cloned using HTTPS to use passwordless
authentication.
