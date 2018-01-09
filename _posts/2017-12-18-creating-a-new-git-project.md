---
title: Create Projects on GitLab
category: quickstart
tags: 
  - git
---

# {{ page.title }}

SESYNC offers private git hosting through our GitLab server at [](https://gitlab.sesync.org). When you connect to gitlab using your sesync name and password, you'll see a dashboard of recent activity on projects that you are part of. If this is your first time connecting, it may be a little quiet.

## 1. Create a project
There are two types of projects you can create in GitLab, personal and group projects.

* Personal projects are good for individual code testing, or if you have projects that you will likely not share with others. Postdocs, SESYNC staff members should look at using these types of projects.
* Group projects are projects that are not owned by any one individual, but rather by an entire group of people. We recommend group projects for our working groups and if you have unit-wide collaborations within SESYNC (ie, IT Staff). To work in a group, click the groups tab, then select the group you want to create a project in.

To create a project, click the new project either from the dashboard when you login for a personal project, or by clicking new project under a group for a group project. Enter the name, description and wether you want the project private, internal or public. Click create to finish creating your project.

* Private - projects are available only to group members and/or additional select prople
* Internal - projects can be seen by any sesync researcher or workshop participant. (You probably don't want this)
* Public - projects are available to anyone on the internet. If you want to share your code with outsiders, use this. Alternatively, you may want to look at github for public services.

Your project is now created and you can load files into it. Follow the instructions to manually load data, or follow one of our tutorials such as [How do I create an R Studio Project from Git](http://cyberhelp.sesync.org/faq/create-rstudio-from-git.html)

![](/assets/images/new-project.png)
![](/assets/images/setting_up.png)
![](/assets/images/empty_git_repository.png)

## 2. Navigating your Project
after your project is created, you can use the links on your project page to browse activity and files in your project as seen below.

![](/assets/images/git_repository.png)

## 3. Sharing your project
From the dashboard of your project, click the 'Settings' link, then click 'Members'. You can share your project with new people by clicking the 'new project member' button.

In the Choose people you want to share with, start typing the name of your collegues and they should appear. If they do not, they probably haven't logged in to gitlab yet. Drop them a quick e-mail asking them to login so you can grant access. You can shoose the level of access from the choices below.

* Guest - Your collegue can browse and create a local copy of all code, but cannot make any changes
* Developer - Your collegue can contribute code to this project (You probably want this for most group members)
* Master - Person can fully control, configure, invite more people to project (You probably want to add SESYNC staff as masters so we can help you)

Click 'Add users' at the bottom when you have finished. The next time your collegue logs in they will see the project in their dashboard.

![](/assets/images/adding_people_git.png)
