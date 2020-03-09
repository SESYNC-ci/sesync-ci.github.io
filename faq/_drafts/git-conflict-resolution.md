---
title: "How do I resolve merge conflicts in git/GitHub/GitLab?"
tags:
 - git
---

One of the big things that trips up a lot of new users of git or other version control systems is conflicts. Usually, when two parallel versions of the code you (and/or your collaborators) are working on have different changes, git can "merge" them seamlessly. This is one of, if not the, best and most useful features of git. For example, if you delete line 25 of a script, and your collaborator edits line 99 and adds a few lines after it, git can merge those two sets of changes into a single script. However, sometimes there are merge conflicts: let's say you both edited line 25. Git does not know which version it should pick when merging &mdash; this is a merge conflict.

There are already tons of good resources out there about how to resolve conflicts in version control. This is an attempt to list a few of the best resources that you can refer to if you see the dreaded merge conflict message. 

*A word to the wise: Usually it's a good idea to try [stackoverflow](https://stackoverflow.com) first, but for some reason the top Google hits for basic git questions often lead to old questions with many competing, confusing, and outdated answers. Be wary of that!*

- **Git and Github's own documentation**. This may seem obvious but the first place to look would be [the help documentation for git software](https://git.scm.com/docs/) and on [Github's help pages](https://help.github.com). For example try [this help page on resolving merge conflicts](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/resolving-a-merge-conflict-using-the-command-line).

