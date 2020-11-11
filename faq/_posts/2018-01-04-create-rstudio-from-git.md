---
title: How do I create an RStudio project with git?
tags:
  - R
  - git
  - RStudio
---

RStudio projects are folders that contain project files and a special .Rproj file. To link an RStudio project with a git repository, follow these steps:

1. Create a new Gitlab or Github project and copy the URL for the project (e.g., https://gitlab.sesync.org/groupname/project.git)

1. Open RStudio, create a new project, choose *Version Control* for the project type, and select *git* as the type of versioned project. Use the URL from step one as the 'Repository URL' for your new project.

1. After you've created a project, create your initial R code and a README.md file describing your code. When you're ready to commit your changes and push them to Github or Gitlab, do a **git commit** (Tools -> Version Control -> Commit), followed by a **git push** (Tools -> Version Control -> Push Branch). You can also execute git commands using buttons in RStudio's git panel (upper right) or using the terminal.
