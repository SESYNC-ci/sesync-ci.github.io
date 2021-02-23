---
title: How do I change the git default branch name for new repositories from master to main?
tags:
  - Git
  - GitLab
  - GitHub
  - ssh
---

**NOTE**: *See the [note on terminology](https://cyberhelp.sesync.org/basic-git-lesson/#/slides/config) in our basic git lesson for more background on why default repository names are changing from `master` to `main` across git platforms. Changes are ongoing across all git platforms so this FAQ may be out of date by the time you read it!*

When you initialize a new git repository from scratch with `git init`, or using the new repository dialog on the RStudio server, git creates a default branch with the name `master`. This is the case in our current version of git (git version 2.28.0).

As of October 1, 2020, any new repository you create on GitHub.com will use `main` as the default branch. Existing repositories that have `master` set as the default branch will be left as is. 

GitLab projects are created with the default branch as `master`, unless otherwise specified. 

A conflict occurs when the local and remote default branches for both GitHub and GitLab have different names. This FAQ will help you set the default name in your own git repository to `main` (or any other term your team has chosen) and help you fix the conflict if it occurs.

## Setting the default branch name
Before initializing a new Git repository you will have to set the default to `main`.

### Steps

First, open a terminal window either by [connecting to the ssh gateway](https://cyberhelp.sesync.org/faq/how-to-access-linux-resources.html) or opening a terminal tab on the RStudio or Jupyter server.

#### 1) Override the default branch name value:

```
git config --global init.defaultBranch main
```
You only have to do this once. Now all new repositories you create with `git init` or on the RStudio or Jupyter servers will have a default branch named `main`.

**Note:** If the value is unset, `init.defaultBranch` defaults to `master`.

#### 2) Initialize your new Git repository:
```
git init
```
The initial first branch will now be named `main`.

### GitHub
New repositories use `main` as the default branch name. 
No need to do anything here. You are all set!
When pushing to the remote repository use:
```
git push origin main
```

### GitLab
GitLab allows you to customize the initial branch name to any name. Every project  created from then on will start from the custom branch name rather than `master`. 
To do so:

1. Go to **Admin Area -> Settings -> Repository**.
2. Expand **Default initial branch name**.
3. Change the default initial branch to **main**.
4. Save changes.


## Renaming the default branch for an existing repository
To rename the `master` branch in your existing Git repository to `main`:
### Steps
### 1) Rename the local `master` branch to `main`:
```
git branch -m master main
```
### 2) Check that the renaming worked:

Call

```
git status
```

If the renaming was successful you should see:

```
On branch main
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```
The local branch has been renamed, but we now need to make these changes to the remote repository as well. You can do this on either GitHub or GitLab as follows.

### GitHub
GitHub now allows you to rename any branch, including the default branch, from the web.

### Steps
### 1) Rename the default branch from the web:
[![infographic](/assets/images/github_default_rename.png)


### 2) Update your local clone:
```
# Get the latest commits and branches from the remote
git fetch origin

# Create a new tracking connection with the new origin/main branch
git branch -u origin/main main
```

### GitLab
Making the change to your GitLab repository is simple. 

### Steps
### 1) Change it locally:

Use the `move` command in Git to copy the entire `master` branch to a new branch called `main`.
```
git branch -m master main
```

Now push `main` to your remote repository.
```
git push -u origin main
```

You will then see an option to start a merge request which we are not going to do because we want `main` to become the default branch, not `master`.


### 2) Change it on GitLab:
On your GitLab project:
1. Go to **Admin Area -> Settings -> Repository**.
2. Expand the default initial branch name.
3. Change the default to **main**.
4. Save changes. 

The next time someone clones your repository, they will automatically be on the `main` branch. When they make changes, the link to create a merge request will automatically be pointed at the `main` branch. 

### 3) Remove the master branch:
You can remove the `master` branch completely.
Removing the `master` branch is recommended to avoid any confusion around what branch is the default one. 
If you choose to remove the `master` branch make sure you update any dependencies.

To remove the `master` branch:

1. In your project go to **Repository -> Branches**.
2. Under **Active branches** find **master**.
3. Click the trash can to the right to delete the branch.
