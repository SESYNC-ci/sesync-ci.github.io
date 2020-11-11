---
title: Create Projects on GitLab
tags: 
  - git
  - GitLab
  - SSH 
  - RStudio
---

SESYNC offers private git hosting through [our GitLab server](https://gitlab.sesync.org). When you connect to our GitLab Community Edition (CE) instance using your SESYNC username and password, you'll see a dashboard of recent activity on projects that you are part of. If this is your first time connecting, it may be a little quiet.

## Create a Project

There are two types of projects you can create in GitLab, personal and group projects.

* Personal projects are good for individual code testing, or if you have projects that you will likely not share with others. SESYNC postdocs, fellows, and staff should look at using these types of projects.
* Group projects are projects that are not owned by any one individual, but rather by an entire group of people. We recommend group projects for our working groups and for units within SESYNC (e.g., the IT staff are in a group on GitLab with several shared projects). To work in a group, click the group's tab, then select the group under which you want to create a project.

If your SESYNC group does not yet have a GitLab group, you might want to create one. Creating a GitLab group has two main advantages: It helps you keep multiple repositories for your group's project organized in one place, and it can also help you deal with permissions more easily by giving multiple people access to multiple projects all at once. See [GitLab's documentation on groups](https://docs.gitlab.com/ee/user/group/) for more information about groups and how to create one on GitLab.

To create a project, click the new project either from the dashboard when you login for a personal project, or by clicking new project under a group for a group project. Enter the name, description and whether you want the project private, internal or public. Click create to finish creating your project.

* Private - projects are available only to group members and/or additional select prople
* Internal - projects can be seen by any sesync researcher or workshop participant. (You probably don't want this)
* Public - projects are available to anyone on the internet. If you want to share your code with outsiders, use this. Alternatively, you may want to use GitHub for public respositories.

Your project is now created and you can load files into it. Follow the instructions to manually load data, or follow one of our tutorials such as [How do I create an RStudio Project with git?](http://cyberhelp.sesync.org/faq/create-rstudio-from-git.html)

![](/assets/images/new-project.png)
![](/assets/images/setting_up.png)
![](/assets/images/empty_git_repository.png)

## Navigate your Project

After your project is created, you can use the links on your project page to browse activity and files in your project as seen below.

![](/assets/images/git_repository.png)

## Project Sharing

**Privately sharing your GitLab project with collaborators requires that collaborators have a SESYNC account. Please contact cyberhelp@sesync.org if your collaborator needs an account.**

From the dashboard of your project, click 'Members'. You can share your project with new members or groups under the "Invite member" or "Invite group" tabs.

Under "Search for members to update or invite", start typing the name of your colleagues and a matching account name should appear. If they do not, they probably haven't logged in to gitlab.sesync.org yet. Drop them a quick e-mail asking them to login so you can grant access. You can shoose the level of access from the choices below.

* Guest - Your colleague can browse and create a local copy of all code, but cannot make any changes
* Reporter - Similar to a Guest with a few extra permissions to create issues and requests
* Developer - Your colleague can contribute code to this project (You probably want this for most group members)
* Maintainer - Person can fully control, configure, invite more people to project (You probably want to add SESYNC staff as maintainers so we can help you)

Click 'Invite' at the bottom when you have finished. The next time your collegue logs in they will see the project in their dashboard. 

![](/assets/images/adding_people_git.png)

## (Optional) Switch from HTTPS to SSH

HTTPS and SSH are two different protocols that let you securely push (pull) commits to (from) a remote git repository. HTTPS requires a username and password to authenticate, while SSH works with paired public and private cryptographic keys. You can use either one, but setting up an SSH key pair means never having to enter a username and password.

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
7.  Open every *existing* RStudio project you've previously cloned from GitLab/GitHub, and substitute the new repository URL (it begins with `git@`) for `<URL>` in the R command `system('git remote set-url origin <URL>')`.

That's it! You should be able to push and pull between your local git
repository on <https://rstudio.sesync.org> and the remote git repository on GitLab/GitHub.

*Bonus tip*: You can also set up an SSH key on your local machine, if you want to work locally instead of on the RStudio server. 
See the [FAQ on setting up SSH keys]({{ 'faq/set-up-gitlab-ssh-key.html' | relative_url }}) for more details.
