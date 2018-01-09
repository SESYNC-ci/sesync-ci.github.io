---
title: How do I create an RStudio project with git?
category: FAQ
tags:
  - R
  - git
---

# {{ page.title }}

1. Create a new Gitlab or Github project and copy the URL for the project (e.g., https://gitlab.sesync.org/groupname/project.git)

1. Then in RStudio, create a new project and choose *Version Control* for the project type and select *Git* as the type of versioned project. Use the URL from step one as the 'Repository URL' for your new project.

1. After you've created a project, create your initial R code and a README.md file describing your code. When you're ready to commit your changes and push them to Github or Gitlab, do a **git Commit** (Tools -> Version Control -> Commit), followed by a **git Push** (Tools -> Version Control -> Push Branch). You can also execute git commands using buttons in RStudio's git panel (upper right) or using the terminal. 
