---
title: "Why isn't my research data directory in '/nfs'?"
tags:
 - NFS
 - Infrastructure
---

It is, or at least **will be** as soon as you need it! Any [research data directory](/quickstart/research-data-directory.html)
you have access to will be mounted to the filesystem at "/nfs" when you access it. If you have not touched any
of the files in there for a while, it may have un-mounted and appear to be missing. So if you don't see
your "*-data" folder under "/nfs", just navigate directly to the folder and it will instantly mount. For
example, if your research data directory is "cooltrees-data", then enter the full path as
"/nfs/cooltrees-data" in the file browser or from the command line.
