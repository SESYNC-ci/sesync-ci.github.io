> **TL;DR** Add or edit a file in the [_posts folder](_posts/) that
> includes a **single** category and a **list of at least one** tag. Follow the naming convention
> of "YYYY-MM-DD-post-tile.md".

## Content

All of the content of the website lives in the [_posts folder](_posts/), divied up
into single page Markdown files. A Markdown (.md) file is a plain text file which you
can edit with your favorite text editor (or even on GitHub). Each file must have "front matter",
the section fenced by `---` in the template below. The `category` and `tags`
variables are essential front matter: they control the location of content on the website.

```
---
category: blog
tags:
  - data
  - reproducible-research
---

My blog post about open data for reproducible research.
```

## Category

Posts are divided into a handful of categories, corresponding to the style of information delivery rather than the topic. The names of the files in the [_category folder](_category/) should be the
only strings used for the `category` variable in any post's front matter.
No mechanism automatically checks this, so please type carefully.

## Tags

A tag should serve to help a reader find additional pages relevant to the one
they are currently reading, no matter the category of those pages. Use existing
tags where possible (see them all at [/tags](https://sesync-ci.github.io/tags)), but also feel free to use a
novel tag.

If you add a tag, actually **add** the tag to the [_tags folder](_tags/)!

## Generate blog from Rmd

To generate blogs using Rmd files, you will need to generate a markdown document placed in the _posts directory with a well defined path for any figures generated when knitting the Rmd file. You will also need to add a category property to be listed in the blog section of the site. It may be useful to add relevant tags to allow cross referencing.

In brief, you can follow this series of steps:

1) Clone the repository locally

First, you will need to clone the repository locally. You can place your Rmd file in the sesync-ci.github.io/_posts directory. The Jekyll convention is followed here for blog publishing so add a date in your Rmd. 
For instance, assuming you created a directory named "blogs" in your home directory, you will place your "09-11-2018-myfirstblog.Rmd" Rmd file in the following location:

~/blogs/sesync-ci.github.io/_posts/09-11-2018-myfirstblog.Rmd

2) Editing yaml in Rmd 

At the top of the Rmd header add the following 

```
md_document: 
    toc: true
    preserve_yaml: true
category: blog
tags:
 - R
 - geospatial

Note that we use the "R" and "geospatial" tags. You can replace these by using relevant tags.
```

3) Data path

Place any data you are using in the publicly available directory at SESYNC (this may require permissions). 

4) Knitr and chunk options

You will need to generate a markdown document locally using the knitr package. Add a section to set a few of the chunk options to generate a path to the images that can be used in the site building by Jekyll.

This can be done by adding this code chunk:

```{r, include=FALSE}

knitr::opts_knit$set(
  #root.dir = '/nfs/bparmentier-data/Data/',
  base.dir = '../',
  base.url = '/') # add site.baseurl pending answer to https://stackoverflow.com/questions/52299423/how-to-prevent-urlencoding-of-liquid-tags


```

Once you added this chunk, you can knit the Rmd document locally.

5) Commit and Push changes

To add your new blog to cyberhelp.sesync.org you will need to commit and push all the newly created documents and directories to the repository.

## Style Guide

There is very little styling available through Markdown. Certain choices affect layout, however, so for consistency please:

- **Headings:** Use a single `#` level heading at the top of a post. Consider even `# {{ page.title }}`.
- That's it for now...

![](https://imgs.xkcd.com/comics/strunk_and_white.png)

## Preview

This repository is set up to preview using the
[github-pages](https://github.com/github/pages-gem) gem, which allows you to
serve the site locally during development. After you clone the repository
(equivalently, after you create a new RStudio project from
version control), use the **RStudio terminal** to run 

```bash
bundle install
bundle exec jekyll build --drafts --baseurl=/p/4321
```

If this fails, you probably haven't opened the RStudio project, which loads
".Renviron". Rerun the second command to rebuild the site after changes. If the
port (e.g. 4321) is not available, increment by 1 and try again.

Next call `servr::httw('_site', port = 4321)` in the **R console**, and leave that
running until you're done.

## Pull Requests

Collaborators (with push access) are not required to submit pull requests for their
contributions. A good reason to submit a pull request, however, is to request feedback
or to learn how they work!
