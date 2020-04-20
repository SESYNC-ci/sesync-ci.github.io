# Resources for learning GitHub Pages

compiled by Q Read, K Hondula, and R Blake

13 April 2020

These are resources, including tutorials and examples, on how to use [GitHub Pages](https://pages.github.com/). Most of them are based in [Markdown](https://daringfireball.net/projects/markdown/) and [Jekyll](https://jekyllrb.com/). Markdown is a "lightweight markup language," meaning a way to write a text document with minimal formatting codes that can be rendered into a document such as a webpage. Jekyll is a package written in the Ruby language (to be cute, but confusing, they call packages in Ruby "gems") that turns documents written in Markdown into (static) HTML sites with nice layouts. It isn't necessary to use Markdown and Jekyll to use GitHub Pages, but Jekyll has built-in support for GitHub Pages so everything integrates pretty well. This means GitHub takes care of converting your human-readable files (like Markdown) to HTML, including all of the relative link paths to navigate your website based on configuration files. [Hugo](https://gohugo.io/) is an alternative to Jekyll. 

## Pros and Cons

### pro

- Free, no ads!
- You can customize it however you want.
- You can use your page to demonstrate your skill in website creation to potential employers, because they can look at the underlying code on your repo.

### con

- It seems like the main weakness of GitHub Pages and associated templates is that they don't look that great on smartphones. There might be some ways around this but it is something to be aware of.
- It takes more initial learning time than other point and click interfaces for creating sites, especially if you really want to customize things.

## Tutorials for beginners

- "Official" guide: https://guides.github.com/features/pages/
- GitHub help page on setting up Jekyll with GH pages: https://help.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll
- SESYNC has a Cyberhelp lesson about making R interactive documents, that has an exercise at the end where you turn the document into a GitHub page: https://cyberhelp.sesync.org/interactive-rmarkdown-lesson/
- Karl Broman's tutorial: https://kbroman.org/simple_site/ (Kelly H likes this one but says it may be "a little bit old by now")
- https://www.thinkful.com/learn/a-guide-to-using-github-pages/
- http://jmcglone.com/guides/github-pages/
- https://github.com/jules32/rmarkdown-website-tutorial
- More about using Hugo as a website framework and options available: https://ropensci.org/technotes/2019/01/09/hugo/

## Some more basics & tips

- Making your website accessible (FYI don't use "click here!" links): https://webaccess.berkeley.edu/ask-pecan/click-here
- User (my-github-username.github.io) vs project (my-github-username.github.io/my-awesome-project) pages: https://help.github.com/en/enterprise/2.14/user/articles/user-organization-and-project-pages

## Templates for personal sites

These are focused on academic personal sites but could be used for other purposes. Lots more templates are out there.

- https://academicpages.github.io (Jekyll based template)
- https://sourcethemes.com/academic/ (Hugo based template)

## Example sites using GitHub Pages

- The SESYNC cyberhelp website: https://cyberhelp.sesync.org/ check out the [readme](https://github.com/SESYNC-ci/sesync-ci.github.io/blob/master/README.md) for the structure and [contributing](https://github.com/SESYNC-ci/sesync-ci.github.io/blob/master/CONTRIBUTING.md) for how we modify content
- Palmer lab (made by Kelly H) 
  + [link to site](https://palmerlab.umd.edu) 
  + [link to underlying code repo](https://github.com/palmerlab-umd/palmerlab-umd.github.io) 
  + *Kelly H notes*: We copied a template from another lab website and contacted them first about using it because licensing is kind of opaque for this stuff.
- quentinread.com (made by Q, using the academicpages.github.io template) 
  + [link to site](http://quentinread.com) 
  + [link to underlying code repo](https://github.com/qdread/qdread.github.io)
- https://www.allanlab.org/aboutwebsite.html - this academic site also contains some information on how the site was made, and how to get started
- https://tinystats.github.io/teacups-giraffes-and-statistics/index.html
- http://nelson.rbind.io/ - uses Hugo Academic template linked to above