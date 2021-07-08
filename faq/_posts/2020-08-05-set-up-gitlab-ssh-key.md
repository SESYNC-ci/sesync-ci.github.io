---
title: "How do I set up an SSH key on GitLab/GitHub?"
tags:
 - GitLab
 - GitHub
 - git
 - SSH
---

If you have just created your first project on the SESYNC GitLab server and tried to push files to it for the first time, you might see a confusing message saying that you need to generate an SSH key so that you can push updates from your local clone of the repository to the GitLab server with the SSH protocol. You might want to do this so that you never have to enter a username and password to push commits. The SSH key takes the place of the username and password, but you need to register your local key with the remote repository first. 

## Registering an SSH key on the RStudio server

You can generate a key pair for any machine onto which you will clone your repository, but SESYNC makes it especially easy to use the SSH protocol for projects cloned to our RStudio Server from GitLab or GitHub.

1.  Login to <https://rstudio.sesync.org>
2.  Select "Tools" > "Global Options" > "Git/SVN"
3.  Choose "View public key"
4.  Copy the key to your clipboard and
    "Accept"/"Okay"/"Continue"/"Close" all the windows
5.  Login to your remote git repository to add your public key:
    -   <https://gitlab.sesync.org>: click on your avatar (upper
        right) > "Settings" > "SSH Keys" > (Go To Step 6) >
        "Add key"
    -   <https://github.com>: click on your avatar (upper right) >
        "Settings" > "SSH and GPG keys" > "New SSH key"
6.  Paste the key in the larger box (leave the smaller box blank to use a default title or label)
7.  Open every *existing* RStudio project you've previously cloned from GitLab/GitHub, and for each project enter the following command in the R console:
    - For GitHub repositories, enter `system('git remote set-url origin git@github.com:USERNAME/REPOSITORYNAME.git')`. Here, `USERNAME` will either be your GitHub username or the GitHub organization the repo belongs to.
    - For GitLab repositories, the URL format will be `system('git remote set-url origin git@gitlab.sesync.org:USERNAME/REPOSITORYNAME.git')`. Here, `USERNAME` will either be your SESYNC username or the GitLab group the repo belongs to.

That's it! You should be able to push and pull between your local git
repository on <https://rstudio.sesync.org> and the remote git repository on GitLab/GitHub. 

## Registering an SSH key on your local machine

You might also want to set up SSH push/pull access on your local machine. This will need to be done in addition to setting it up on the RStudio server. The procedure is basically the same as above, but you may need to create an SSH key and save it to the appropriate directory on your machine.

1. Open RStudio on your local machine.
2. Select "Tools" > "Global Options" > "Git/SVN"
3. Choose "Create RSA key."
4. Save the RSA key to the suggested directory. On a Windows machine this will probably be `C:\Users\<your username>\.ssh\id_rsa`. You do not need to include a passphrase.
5. Copy the key to your clipboard. (If you closed the window with the key, you can get back to it by navigate to the directory where you saved the key. It may be a hidden folder so you will need to type in the file path in your file explorer. Open the `id_rsa` file there.)
6. Follow steps 5 through 7 from above to add the key to GitLab or GitHub.

![](/assets/images/rsakeyscreenshot.PNG)

*Screenshot of Step 4*

## For more information

- [Quickstart: Create Projects on GitLab]({{ '/quickstart/creating-a-new-git-project.html' | relative_url }}) 
