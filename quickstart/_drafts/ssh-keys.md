---
title: SSH Keys
tags:
 - git
 - GitHub
 - GitLab
---


## Use your SSH key on GitLab/GitHub

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
