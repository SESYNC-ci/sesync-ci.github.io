---
  title: "How do I use git/GitHub/GitLab with JupyterLab?"
tags:
  - Jupyter
  - git
  - GitHub
  - GitLab
---

Version controlling your projects is great!  

How do you do it in Jupyter Lab?  

There's no user-friendly way to do this.  You have to use git in the command line.  :-\

This assumes you already have a repository on GitHub/GitLab that you want to access/version control in Jupyter. 
Clone your repository to your home directory on jupyter.sesync.org

1) log in to jupyter.sesync.org
2) open Terminal window
3) `git clone <url_of_your_repository>`  (get the url from your GitLab or GitHub repository page)
	Note: use SSH for the URL since we set this up during the cyber intro


Working with git versioned scripts in Jupyter Lab:

3) in Terminal,`git pull origin master` to get current version of repo from GitHub/Lab
4) open Python, do your work in your script and save it in your notebook file
5) in Terminal, use `cd <name_of_your_repository>` to navigate into your repository
5) `git status` to check the status of your repository. You should see that your file is 
now listed as modified under the section "Changes not staged for commit".
6) stage your changes with `git add <filename>`
7) commit your changes with `git commit -m "your commit message here"`
8) pull down current version of repo from GitHub/Lab with `git pull origin master`
9) push your changes to the repo with `git push origin master`


