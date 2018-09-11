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
