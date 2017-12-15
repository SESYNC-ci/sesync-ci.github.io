**TL;DR** Add or edit a file in the [_posts folder](_posts/) that
includes a *single* category and a **list of at least one** tag. Follow the naming convention
of "YYYY-MM-DD-post-tile.md". Here's a template:

```
---
category: blog
tags:
  - data
  - reproducible-research
---

My blog post about open data for reproducible research.
```

## Content = "_posts"

All of the content of the website lives in the [_posts folder](_posts/), divied up
into single page Markdown files. A Markdown (.md) file is a plain text file which you
can edit with your favorite text editor (or even on GitHub). The `category` and `tags`
variables are essential: they control the location of content on the website.

## Category

The names of the files in the [_category_pages folder](_category_pages/) should be the
only strings used for the `category` variable in any post's front matter.
No mechanism automatically checks this, so please type carefully.

## Tags

A tag should serve to help a reader find additional pages relevant to the one
they are currently reading, no matter the category of those pages. Use existing
tags where possible (see them all at [/tags](https://sesync-ci.github.io/tags)), but also feel free to use a
novel tag.

## Preview

This repository is set up to preview using the
[github-pages](https://github.com/github/pages-gem) gem, which allows you to
serve the site locally during development. After you clone the repository
(equivalently, after you create a new RStudio project from
version control), use the **RStudio terminal** to run 

```bash
bundle install
bundle exec jekyll build --watch --baseurl /p/4321
```
Leave that process running until you are done (then click 🛑). If the port
(e.g. 4321) is not available, increment by 1 and try again.

Next call `servr::httw('_site', port = 4321)` in the **R console**, and leave that
running until you're done too.

## Pull Requests

Collaborators (with push access) are not required to submit pull requests for their
contributions. A good reason to submit a pull request, however, is to request feedback
or to learn how they work!
