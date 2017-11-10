**TL;DR** Add or edit a file in the `docs/_posts` folder that includes a
single category and a list of at least one tag. Follow the naming convention
of "YYYY-MM-DD-post-tile.md".

```
---
category: blog
tags:
  - Data
  - Reproducible Research
---

My blog post ...
```

## Categories

The names of the files in the "_category_pages" folder should be the
only strings used in the "category:" definition in any post's front matter,
but no mechanisms automatically checks this.

## Tags

A tag should serve to help a reader find additional pages relevant to the one
they are currently reading, no matter the category of those pages. Use existing
tags where possible (see them all at `/tags/`), but also feel free to use a
novel tag.

## Testing

This repository is set up for testing using the
[github-pages](https://github.com/github/pages-gem) gem, which allows you to
serve the site locally to preview the content you are working on. After you
clone the repository (equivalently, after you create a new RStudio project from
version control), run `bundle install ~/.path` in the project root **from
a terminal**.

1. Run `bundle exec jekyll build --watch --baseurl 4321` in a **terminal**. Leave
it running until you are done (then hit Ctrl-C).
1. Run `servr::httw('_site', port = 4321)` in the **R console**. Leave it running
until you are done (then hit the Stop sign).

If the port (e.g. 4321) is not available, increment by 1 and try again.
