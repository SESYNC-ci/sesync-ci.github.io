---
title: "How do I work with a git-versioned project in Jupyter Lab?"
tags:
  - Jupyter
  - git
  - GitHub
  - GitLab
---

There's no user-friendly way to do this.  You have to use [git](https://git-scm.com/) in the command line.


#### Create a repository on GitHub/GitLab that you want to work with in Jupyter Lab. 

See our quickstart instructions [here](https://cyberhelp.sesync.org/quickstart/creating-a-new-git-project.html).


#### Clone your repository to your home directory on Jupyter Lab. 

1. log in to [jupyter.sesync.org](jupyter.sesync.org)
2. open Terminal window: Files -> New Launcher -> Terminal
3. type `git clone <url_of_your_repository>`  (get the url from your GitHub/GitLab repository page)  
  
Note: We suggest you use SSH for the URL to avoid having to repeatedly enter your log-in credentials.  If you're not sure if you've set up SSH authentication, see these
[GitHub instructions](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).


#### Working with git-versioned scripts/notebooks in Jupyter Lab:

1. in Terminal, type `cd <name_of_your_repository>` to navigate into your repository
2. type `git pull origin master` to get current version of repo from GitHub/GitLab
3. open Python console or Jupyter notebook, do your work in your script or notebook file, and save it
4. in Terminal, type `git status` to check the status of your repository. You should see that your file(s) is 
now listed as modified under the section "Changes not staged for commit".
5. stage your changes with `git add <filename>`
6. commit your changes with `git commit -m "your_commit_message_here"`
7. pull down current version of repo from GitHub/GitLab with `git pull origin master`
8. push your changes to the repo with `git push origin master`

<br>

If you're confused about the differences between git, GitHub, GitLab, check out our FAQ [here](https://cyberhelp.sesync.org/faq/git-vs-github-vs-gitlab.html).

If you're an RStudio user and would like to work with git, check out our FAQ [here](https://cyberhelp.sesync.org/faq/create-rstudio-from-git.html).
