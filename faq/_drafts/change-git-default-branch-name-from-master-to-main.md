---
title: How to change Git default branch name for new repos form master to main
tags:
  - Git
  - GitLab
  - GitHub
  - ssh
---
When you initialize a new Git repository from scratch with `git init`, Git has always created an initial first branch with the name `master`.
This FAQ will help you set the default name in your own Git repositories to "main" (or any other term your team has chosen) and help you fix the conflict if it occurs.

## Setting the default branch name
Before initializing a new git repository you will have to set the default to main.
### Steps
### 1) Override the the default branch name value:
```
git config --global init.defaultBranch main
```
You only have to do this once.
**Note:** If the value is unset, `init.defaultBranch` defaults to `master`.

### 2) Initialize your new git repository:
```
git init
```
The initial first branch will now be named main.

## Renaming the default branch name
To rename master in  your Git repositories to main:
### Steps
### 1) Rename the Local master Branch to main:
```
git branch -m master main
```
### 2) Check that the renaming worked:
```
git status
On branch main
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```
The local branch has been renamed, but we now need to make this changes to the remote repository as well. 

GitHub now allows you to rename any branch, including the default branch, from the web.

### Steps
### 1) Rename the default branch from the web:
[![infographic](/assets/images/github_default_rename.png)](/assets/images/github_default_rename.png)


### 2) Update your local clone:
```
# Get the lastest commits and branches from the remote
git fetch origin

# Create a new tracking connection with the new origin/main branch
git branch -u origin/main main
```












