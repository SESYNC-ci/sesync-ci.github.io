---
title: "Why am I locked out of the RStudio or Jupyter server?"
tags:
 - NFS
 - Infrastructure
 - Data
 - Data Management
---


*TL;DR: Your home directory might be over its quota. Either move data from there to your research data directory or contact SESYNC cyberhelp for assistance.* 

## Help! I'm locked out of the server!

If you try to log in to the RStudio or Jupyter server, enter your username and password, and then get an error message that says something like "Error occurred during transmission," don't panic. This is probably because your research home directory is above its quota. The quota is set to 20 GB per user by default.

Your home directory should not be used to store data. A relatively small disk space is set aside for all users' home directories. Home directories are for code and software installations like R packages. See our [cyber resources infographic]({{'/faq/cyber-resources.html' | relative_url }}) to learn more about the difference between home and data directories.

## But I didn't put any data in my home directory!

It is possible that the quota can be exceeded by temporary hidden RStudio or Jupyter session files you might not even be aware of. In that case please contact SESYNC cyberhelp and we can help you troubleshoot and figure out ways to avoid that situation in the future.

## But I don't know how to move data without logging into the RStudio server first!

It's possible to connect to the SESYNC server with SSH and move data between your home directory and research data directory using text commands on the command line. For example, if your username is `jdoe` you might have a directory called `/research-home/jdoe/big-directory` and you want to move it to your group's research data directory, `/nfs/cooltrees-data/`. Open a terminal window on your computer. (See our [FAQ on accessing Linux resources]({{'faq/how-to-access-linux-resources.html' | relative_url }}) if you do not know how to access a terminal window on your computer.) 

Log into the SESYNC server by entering the following command:

```
ssh jdoe@ssh.sesync.org
```

You will be prompted to enter your password and possibly to add SESYNC to your list of known hosts. 
Once you do, you will be connected to the SESYNC server and the current working directory will be `/research-home/jdoe`, which you can confirm by entering `pwd`. You will see something like:

```
jdoe@sshgw02:~$ pwd
/research-home/jdoe
```

To find out how much space is being used by the different subdirectories in your home directory, enter `du -h --max-depth=1` and it will list all the top-level subdirectories and how much space they are taking up. It might look something like:

```
jdoe@sshgw02:~$ du -h --max-depth=1
10M   ./.cache
5M    ./.local
1G    ./R
100M  ./.rstudio
40K   ./.ipynb_checkpoints
35G   ./big-directory
36G   .
```

The final line shows the total across all subdirectories.

To copy `big-directory` to your group's data directory, enter:

```
cp -r /research-home/jdoe/big-directory/ /nfs/cooltrees-data/big-directory/
```

The `cp` means copy, and the `-r` means recursive so it will copy the entire directory and everything in it.

Once this is finished (it will take a few minutes if it's a big folder) delete the one on your home directory:

```
rm -rf /research-home/jdoe/big-directory/
```

Here the `rm` means remove (i.e., delete), and the `-rf` is an option that ensures everything inside that directory will be deleted.

Now if your home directory is under the quota of 20 GB you will be able to access all SESYNC resources again!

## I've tried everything and I still can't log in! What do I do?!?

Please [email SESYNC cyberhelp](mailto:cyberhelp@sesync.org) and we will be happy to assist you.
