---
title: Why does git show that all my files changed when I didn't change them?
category: faq
tags:
  - git
---

# {{ page.title }}

Due to some quirks on our storage system your git repo may show that all of your files have modifications. If you perform a 'git diff' you will see a list that looks like:

```
diff --git a/SharePermissions.psm1 b/SharePermissions.psm1
old mode 100644
new mode 100755
diff --git a/audit-homedirs.ps1 b/audit-homedirs.ps1
old mode 100644
new mode 100755
diff --git a/clearSPconfigcache.ps1 b/clearSPconfigcache.ps1
old mode 100644
new mode 100755
```

These changes mean that metadata about your file changed, however the content of your file did not. If you're working in a group, this may start to intefere with pushes or just add noise to your commits. In order to ignore these changes, please run one of the the following sets of  commands.

__Bash Shell__

From the bash shell run the commands in your git code directory:

```
git config --unset core.filemode
git config --global core.filemode false
```

__R or R Studio__

or if you're using R studio or just R, you can run the following from your console window

```
system("git config --unset core.filemode")
system("git config --global core.filemode false")
```
