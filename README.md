**Under Development**

# SESYNC Cyberinfrastructure for Researchers & Teams

The resources available to SESYNC researchers and teams are many and varied. The
web site maintained in this repository should explain how to use all the things.

Please review [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on adding new content.

Please read below (when it exists) for information on the structure and function of
this Jekyll based web site.

## Files and Folders

The site uses the standard [Jekyll directory structure](https://jekyllrb.com/docs/structure/). The table below throws some additional light on the contents.

```
├── 404.html                         custom "file not found" error
├── CONTRIBUTING.md                  instructions for content creators
├── Gemfile                          instructions for Jekyll
├── Gemfile.lock                     don't really know ...
├── README.md                        project README
├── _category_pages                  a Jekyll collection called "category_pages"
│   ├── FAQ.md                         a page for each category, listing
│   ├── blog.md                        all posts in that category. do not confuse
│   ├── lessons.md                     a category with this collection (whose
│   └── quickstart.md                  only purpose is to render these pages).
├── _config.yml                      top level site variables and configuration
├── _includes                        html snippets to include in layouts
│   ├── block.html                     for post pre-views on landing page
│   ├── footer.html                    the SESYNC footer for the landing page
│   └── title.html                     the title on each cateogry_page
├── _layouts                         html templates for conversion of md files
│   ├── category.html                  used by each category_page
│   ├── default.html                   ... duh
│   ├── landing.html                   for the landing page
│   └── search.html                    for the search results page
├── _posts                           ALL CONTENT GOES IN HERE
│   ├── YYYY-MM-DD-post-title.md       the date is not visible, except for posts with "category: blog"
│   └── etc...
├── assets                           the CSS and images
│   ├── css
│   │   ├── _sesync.scss
│   │   ├── fonts
│   │   ├── landing.scss
│   │   └── style.scss
│   └── images
├── index.html                       a Jekyll page, the landing page
├── search.md                        a Jekyll page, the search results page
└── tags                             a folder so the the /tags/ url points to
    └── index.md                       a Jekyll page, the listing of all posts by category and tag
```

## Acknowledgements

The front page uses [FullPage.js](https://github.com/alvarotrigo/fullPage.js) by Alvaro Trigo <alvaro@alvarotrigo.com> and released under the [MIT license](https://opensource.org/licenses/MIT).

The internal pages use [the Leap Day theme for GitHub pages](https://github.com/pages-themes/leap-day) in the public domain [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
