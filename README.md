# SESYNC Cyberinfrastructure for Researchers & Teams

The web site maintained in this repository should explain how to use all the things.

Please review [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on adding or
modifying content. Read below for information on the structure and function of this Jekyll
based web site.

## Files and Folders

The site uses the standard [Jekyll directory
structure](https://jekyllrb.com/docs/structure/) for sites with categories and
tags. Categories are derived from the directory structure above each "\_posts"
folder ( see the [`page.variables` documentaion](Categories are derived from the
directory structure above the)).

```
├── 404.html                         custom "file not found" error
├── assets                           the CSS and images
│   ├── js                             the JavaScript ...
│   │   ├── filter.js                    the "Filter by" control
│   ├── images/                        IMAGES FOR EVERYTHING GO HERE
│   └── css                            the CSS ...
│       ├── _sesync.scss                 variables for SESYNC colors, etc.
│       ├── fonts/                       fonts folder
│       ├── landing.scss                 for the landing page
│       └── style.scss                   for all other pages
├── blog                             content in the "Blog" category
│   ├── _posts/                        published posts
│   ├── _drafts/                       draft posts
│   └── index.md                       page linking to posts in cateogry
├── CNAME                            has to do with custom domain ...
├── _config.yml                      top level site variables and configuration
├── CONTRIBUTING.md                  instructions for content authors
├── Gemfile                          instructions for Jekyll
├── Gemfile.lock                     don't really know ...
├── _includes                        html snippets to include in layouts
│   ├── description.md                 a snippet builder
│   ├── footer.html                    the SESYNC footer for the landing page
│   ├── tag.html                       implements [/tags] page
│   └── title.html                     the title on each cateogry_page
├── index.html                       a Jekyll page, the landing page
├── _layouts                         html templates for conversion of md files
│   ├── category.html                  for each category index
│   ├── default.html                   ... i've got nothing to add here
│   └── landing.html                   for the landing page
├── lesson                           content in the "Lesson" category
│   ├── _posts/                        published posts
│   ├── _drafts/                       draft posts
│   └── index.md                       page linking to posts in cateogry
├── Makefile                         build certain .md files (e.g. from .Rmd)
├── quickstart                       content in the "Quick Start" category
│   ├── _posts/                        published posts
│   ├── _drafts/                       draft posts
│   └── index.md                       page linking to posts in cateogry
├── README.md                        this README
├── sesync-ci.github.io.Rproj        RStudio project settings
└── tags.md                          the tags page
```

## Acknowledgements

The front page uses [FullPage.js](https://github.com/alvarotrigo/fullPage.js) by
Alvaro Trigo <alvaro@alvarotrigo.com> and released under the
[MIT license](https://opensource.org/licenses/MIT).

The internal pages use
[the Leap Day theme for GitHub pages](https://github.com/pages-themes/leap-day)
in the public domain [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

The "Filter by" input uses [Isotope](https://isotope.metafizzy.co/) released
under GPLv3 and [Selectize](https://selectize.github.io/selectize.js/) released
under the Apache License 2.0.
