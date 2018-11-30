> **TL;DR** Add or edit a file in a "\_posts/"  folder and include tag variable
> with **at least one tag**. Follow the naming convention of
> "YYYY-MM-DD-post-title.md", but leave off the date if still in "\_drafts".

## Content

All of the content of the website is categorized into four "\_posts/" folders,
writen as single page [R]Markdown files. A Markdown (.md) file is a plain text file
which you can edit with your favorite text editor (or even on GitHub). Filenames
must follow the Jekyll convention: "YYYY-MM-DD-post-title.md". Each file must
have "front matter", the section fenced by `---` in the template below. The
`tags` variable is essential front matter, the optional `title` variable overrides
the title infered from the file name.

```
---
title: A FancyTitle
tags:
  - data
  - reproducible research
  - Python
---

My blog post about open data for reproducible research in Python.
```

### Category

Posts are divided into a handful of categories, corresponding to the style of
information delivery rather than the topic. The category is determined by the
parent folder of the "\_posts" folder containing a file. The current categories
are:

```
- quickstart
- faq
- blog
- lesson
```

### Tags

A tag should serve to help a reader find additional pages relevant to the one
they are currently reading, no matter the category of those pages. Use existing
tags where possible (see all tags with their posts in the filter input on the
[tags page](https://cyberhelp.sesync.org/tags.html)), but also feel free to use
a novel tag.

### RMarkdown Posts

To generate posts using RStudio + RMarkdown, you will need to generate a
Markdown document locally, because GitHub will not knit RMarkdown files. In the
process of knitting locally, the output must have the correct paths to figures
and other assets.

As a general guide for creating posts from RMarkdown, follow these steps:

1. You must work in a local clone of the repository (not on GitHub), where you
can open the project with RStudio. Don't forget to stage the ".Rmd" AND the
".md" output, commit, and push your changes to GitHub.

2. Place the RMarkdown document in the "\_posts" (or "\_drafts", see below)
folder. For instance, assuming you clone the project into your home directory,
you will place your "2000-01-01-i-survived-y2k.Rmd" file in
"\~/sesync-ci.github.io/\_posts/" and the output will be
"\~/sesync-ci.github.io/\_posts/2000-01-01-i-survived-y2k.md".

3. Include additional configuration along with the category and tags to create a
suitable Markdown document (replacing the category and tags below with suitable
values):
```
---
tags:
  - time-series
  - apocalypse
output:
  md_document:
    preserve_yaml: true
---

My blog post about time stamps in the year 2000, written in RMarkdown.
```

4. Place any data you are using in the publicly available directory at SESYNC
(this may require permissions).

5. Add a code chunk with further knitr configuration, including a path to the
images that can be used by Jekyll.

````
```{r, include = FALSE}
knitr::opts_knit$set(
  base.dir = '../',
  base.url = '{{ site.baseurl }}/')
knitr::opts_chunk$set(
  fig.path = 'assets/images/my-first-blog/'
)
```
````

### Style Guide

There is very little styling available through Markdown. Certain choices affect
layout, however, so for consistency please:

- **Headings:** Use `##` level headings for top-level sections of a post. A
  `# {{ page.title }}` is automatically included at the top of all posts.
- That's it for now...

![](https://imgs.xkcd.com/comics/strunk_and_white.png)

## Site Preview

This repository is set up to preview using the
[github-pages](https://github.com/github/pages-gem) gem, which allows you to
serve the site locally during development. The generic workflow (see RStudio
specific workflow below) is:

1. clone this repo
2. work, work, work
3. run `make`
4. view preview in browser
5. fix, fix, fix
6. commit & push to origin master

### RStudio

To implement the above workflow in RStudio, open the project (that you've
created from version control!) and notice the "Build" tab. The "Build All"
button will run Make, which knits the RMarkdown posts as needed and builds the
Jekyll site as on GitHub. The following R command will then open a browser to
the default port on localhost:

```r
servr::httw('_site')
```

If the port (e.g. 4321) is not available, either wait for it to become available,
or configure your build tools with the argument PORT=4322, and adjust your call
to `servr::httw` accordingly.

If you encounter this warning:

```
GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
```

and are bothered by it, you'll need to generate a
[JEKYLL_GITHUB_TOKEN](http://www.petkovicm.com/GitHub-API-problem/), but put the
line `JEKYLL_GITHUB_TOKEN='your_token_here'` in your "\~/.Renviron" file (not
your "\~/.bash_profile").

## Pull Requests

Collaborators (with push access) are not required to submit pull requests for
their contributions. A good reason to submit a pull request, however, is to
request feedback or to learn how pull requests work!
