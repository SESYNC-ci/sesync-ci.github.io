**Under Development**

# SESYNC Cyberinfrastructure for Researchers & Teams

The resources available to SESYNC researchers and teams are many and varied. The
web site maintained in this repository should explain how to use all the things.

Please review [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on adding or
modifying content.

Please read below for information on the structure and function of this Jekyll
based web site.

## Files and Folders

The site uses the standard
[Jekyll directory structure](https://jekyllrb.com/docs/structure/), with some
flourishes augmenting the presentation of "categories" (cf. "tags").

```
├── 404.html                         custom "file not found" error
├── CONTRIBUTING.md                  instructions for content authors
├── Gemfile                          instructions for Jekyll
├── Gemfile.lock                     don't really know ...
├── README.md                        this README
├── _category_pages                  a Jekyll collection called "category_pages"
│   ├── FAQ.md                         a page for each category listing all
│   ├── blog.md                        posts in that category--do not confuse
│   ├── lessons.md                     category tags with this collection (whose
│   └── quickstart.md                  purpose is to render each category_page)
├── _config.yml                      top level site variables and configuration
├── _includes                        html snippets to include in layouts
│   ├── block.html                     for post pre-views on landing page
│   ├── footer.html                    the SESYNC footer for the landing page
│   └── title.html                     the title on each cateogry_page
├── _layouts                         html templates for conversion of md files
│   ├── category.html                  for each category_page
│   ├── default.html                   ... i've got nothing to add here
│   └── landing.html                   for the landing page
├── _posts                           ALL CONTENT (except images) GOES IN HERE
│   ├── YYYY-MM-DD-post-title.md       USE THIS FORMAT FOR ALL POSTS
│   └── etc...
├── assets                           the CSS and images
│   ├── css                            the CSS ...
│   │   ├── _sesync.scss                 variables for SESYNC colors, etc.
│   │   ├── fonts                        fonts folder
│   │   ├── landing.scss                 for the landing page
│   │   └── style.scss                   for all other pages
│   └── images                         IMAGES FOR EVERYTHING GO HERE
├── index.html                       a Jekyll page, the landing page
├── search.md                        a Jekyll page, the search results page
└── tags                             a folder so the /tags/ url points to
    └── index.md                       a Jekyll page, listing posts by tag
```

## How "categories" work

The `_config.yml` file instructs Jekyll to build a static page for each file
in the "category_pages" collection.

## Acknowledgements

The front page uses [FullPage.js](https://github.com/alvarotrigo/fullPage.js) by
Alvaro Trigo <alvaro@alvarotrigo.com> and released under the
[MIT license](https://opensource.org/licenses/MIT).

The internal pages use
[the Leap Day theme for GitHub pages](https://github.com/pages-themes/leap-day)
in the public domain [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
