---
title: "How do I work with a git-versioned project in Jupyter Lab?"
tags:
  - Jupyter
  - git
  - GitHub
  - GitLab
---

There are two ways to work with git projects in Jupyter Lab.
You may either use the git extension for Jupyter Lab for a point-and-click interface, or
issue git commands directly on the command line. 

#### Create a repository on GitHub/GitLab that you want to work with in Jupyter Lab. 

Whether you are using the git extension or the command line, if you want to sync your local repo with a remote repo,
you will need to create a remote repo on GitHub or GitLab.
See our [quickstart instructions here](https://cyberhelp.sesync.org/quickstart/creating-a-new-git-project.html).

#### Point-and-click interface

SESYNC's Jupyter server has the [Jupyter Lab git extension][readme] enabled. 
The extension is a user-friendly add-on for JupyterLab that lets you do basic git actions with a point-and-click interface.
Access the extension by simply clicking on the git icon on the left-hand side of your screen in Jupyter Lab (you should
see something like the screenshot below).

![](/assets/images/jupyter_screenshot_git.PNG) 

Check out this [lesson by Anne Fouilloux][lesson] if you are interested in learning more about using the git extension.

If you aren't interested in using the git extension, you may disable it by going to the *Extensions* tab on the left-hand
side of the screen, and selecting `Disable` under `@jupyterlab/git` (see screenshot below).

![](/assets/images/jupyter_screenshot_addons.PNG) 

#### Command-line interface

If [git](https://git-scm.com/) in the command line is more to your liking, here are brief instructions for cloning your 
remote repository to your home directory, and then staging, committing, and pushing local changes you make.

#### Clone your repository to your home directory on Jupyter Lab: 

1. log in to [jupyter.sesync.org](https://jupyter.sesync.org)
2. open Terminal window: Files -> New Launcher -> Terminal
3. type `git clone <url_of_your_repository>`  (get the url from your GitHub/GitLab repository page)  
  
Note: We suggest you use SSH for the URL to avoid having to repeatedly enter your log-in credentials.  If you're not sure if you've set up SSH authentication, see these
[GitHub instructions](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).


#### Working with git-versioned scripts/notebooks in Jupyter Lab:

1. in Terminal, type `cd <name_of_your_repository>` to navigate into your repository
2. type `git pull origin main` to get current version of repo from GitHub/GitLab (*See footnote* [^1])
3. open Python console or Jupyter notebook, do your work in your script or notebook file, and save it
4. in Terminal, type `git status` to check the status of your repository. You should see that your file(s) is 
now listed as modified under the section "Changes not staged for commit".
5. stage your changes with `git add <filename>`
6. commit your changes with `git commit -m "your_commit_message_here"`
7. pull down current version of repo from GitHub/GitLab with `git pull origin main`
8. push your changes to the repo with `git push origin main`

<br>

If you're confused about the differences between git, GitHub, GitLab, check out our FAQ [here](https://cyberhelp.sesync.org/faq/git-vs-github-vs-gitlab.html).

If you're an RStudio user and would like to work with git, check out our FAQ [here](https://cyberhelp.sesync.org/faq/create-rstudio-from-git.html).

[^1]: In GitHub and GitLab repositories created before October 1, 2020, the default branch is called `master`, not `main`. You will need to replace `main` with `master` in the commands above if you are working with an older repo.

[readme]: https://github.com/jupyterlab/jupyterlab-git#readme
[lesson]: https://annefou.github.io/jupyter_publish/02-git/index.html