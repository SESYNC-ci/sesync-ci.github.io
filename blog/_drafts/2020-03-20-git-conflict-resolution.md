---
title: "How do I resolve merge conflicts in git/GitHub/GitLab?"
tags:
 - git
 - GitHub
 - GitLab
---

One of the big things that trips up a lot of new users of git or other version control systems is conflicts. Usually, when two parallel versions of the code you (and/or your collaborators) are working on have different changes, git can "merge" them seamlessly. This is one of, if not the, best and most useful features of git. 
For example, if you delete line 25 of a script, and your collaborator edits line 99 and adds a few lines after it, git can merge those two sets of changes into a single script. However, sometimes there are merge conflicts: let's say you both edited line 25. Git has no way to know which version it should pick when merging &mdash; this is a merge conflict.

{% include captionedimage.html url="/assets/images/git_merge_conflict_message.PNG" description="<small><i>Attempting to merge two conflicted versions of a file</i></small>" %}

The most important thing to remember is that no matter how nasty the conflicts look on the surface, *you can always undo and start fresh.* That's the beauty of version control systems.

There are already tons of good resources out there about how to resolve conflicts in version control. This is a semi-curated list a few of the best resources that you can refer to if you see the dreaded merge conflict message. 

*A word to the wise: Usually it's a good idea to try [stackoverflow](https://stackoverflow.com) first. Unfortunately in this case, the top Google hits for basic git questions often lead to old questions with many competing, confusing, and outdated answers. Be wary of that!*

- **Git and GitHub's own documentation**. This may seem obvious but the first place to look would be [the help documentation for git software](https://git.scm.com/docs/) and on [Github's help pages](https://help.github.com). For example try [this help page on resolving merge conflicts](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/resolving-a-merge-conflict-using-the-command-line).

- **Blog post on rollout.io**. This [blog post](https://rollout.io/blog/resolve-github-merge-conflicts/) does an excellent job explaining how to resolve merge conflicts, both with GitHub's web editor and with the command line.

- **Git Tower tutorial**. This very helpful page on merge conflicts, available in both a [command line](https://www.git-tower.com/learn/git/ebook/en/command-line/advanced-topics/merge-conflicts) and [GitHub desktop](https://www.git-tower.com/learn/git/ebook/en/desktop-gui/advanced-topics/merge-conflicts) version, is part of an extensive Git tutorial. It starts with the reassuring message that "You Cannot Break Things" and goes on to walk you through the steps of resolving them. 

- **Atlassian tutorial**. This [page from an extensive Git tutorial](https://www.atlassian.com/git/tutorials/using-branches/merge-conflicts) has a great walkthrough of how to intentionally create a merge conflict and resolve it.

These links should be a good start for advice on resolving merge conflicts. If you run into a truly thorny conflict, the SESYNC cyberhelp team will help you resolve it!
