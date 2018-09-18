# SESYNC Cyberinfrastructure for Researchers & Teams

The web site maintained in this repository should explain how to use all the things.

Please review [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on adding or
modifying content. Read below for information on the structure and function of this Jekyll
based web site.

## Files and Folders

The site uses the standard
[Jekyll directory structure](https://jekyllrb.com/docs/structure/), with some
flourishes augmenting the presentation of "categories" (cf. "tags").

```
├── 404.html                         custom "file not found" error
├── CNAME                            has to do with custom domain ...
├── CONTRIBUTING.md                  instructions for content authors
├── Gemfile                          instructions for Jekyll
├── Gemfile.lock                     don't really know ...
├── README.md                        this README
├── Makefile                         build certain .md files (e.g. from .Rmd)
├── _category                        a Jekyll collection called "category"
│   ├── FAQ.md                         a page for each category listing all
│   ├── blog.md                        posts in that category--do not confuse
│   ├── lessons.md                     category tags with this collection (whose
│   └── quickstart.md                  purpose is to render each category page)
├── _tag                             a Jekyll collection called "tag"
│   ├── R                              one .md file per tag with no content
│   └── etc...
├── _config.yml                      top level site variables and configuration
├── _includes                        html snippets to include in layouts
│   ├── description.md                 a snippet builder
│   ├── footer.html                    the SESYNC footer for the landing page
│   ├── tag.html                       implements [/tags] page
│   └── title.html                     the title on each cateogry_page
├── _layouts                         html templates for conversion of md files
│   ├── category.html                  for each category
│   ├── tag.html                       for each tag
│   ├── default.html                   ... i've got nothing to add here
│   └── landing.html                   for the landing page
├── _posts                           ALL CONTENT (except images) GOES IN HERE
│   ├── YYYY-MM-DD-post-title.md       USE THIS FORMAT FOR ALL POSTS
│   └── etc...
├── _drafts                          ANY DRAFT GOES IN HERE (unpublished)
│   ├── draft-title.md                 USE THIS FORMAT FOR ALL POSTS
│   └── etc...
├── assets                           the CSS and images
│   ├── css                            the CSS ...
│   │   ├── _sesync.scss                 variables for SESYNC colors, etc.
│   │   ├── fonts                        fonts folder
│   │   ├── landing.scss                 for the landing page
│   │   └── style.scss                   for all other pages
│   └── images/                        IMAGES FOR EVERYTHING GO HERE
├── index.html                       a Jekyll page, the landing page
├── search.md                        a Jekyll page, the search results page
└── sesync-ci.github.io.Rproj        RStudio project settings
```

## How "categories" Work

The `_config.yml` file instructs Jekyll to build a static page for each file
in the "category" and "tag" collections, using layout templates of the same name.

## Acknowledgements

The front page uses [FullPage.js](https://github.com/alvarotrigo/fullPage.js) by
Alvaro Trigo <alvaro@alvarotrigo.com> and released under the
[MIT license](https://opensource.org/licenses/MIT).

The internal pages use
[the Leap Day theme for GitHub pages](https://github.com/pages-themes/leap-day)
in the public domain [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
