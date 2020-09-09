---
title: "Linking to RShiny apps in publications"
tags:
 - Shiny
 - R
author: khondula
---

Links to RShiny applications are sometimes included in published papers for readers to explore data, models, and visualizations of results presented in the manuscript, or even as the main focus of a paper that presents an application such as a decision support tool. In either case, the longevity of the app's web-hosting platform should be considered&mdash;as is the case whenever including a URL web link in a manuscript&mdash;to achieve continued accessibility and functionality as long as possible. Websites belonging to individual researchers, lab groups, university deparatments, and grant-funded research centers like SESYNC are subject to periodic migration, reorganization, or retirement; and consequently, many links in published papers inevitably become inactive. And even if a link to an app remains active, there is no guarantee that an app will continue to function&mdash;or function in the same way&mdash;into the future as underlying infrastructure of a given platform gets updated.

While it's possible that some scientific journals may eventually support responsive content or web applications, for now we will assume that publications are based on text and images and any interactive content must be hosted elsewhere on the web[^1]. If you link to such a web app in a manuscript, here's what we recommend for improving long-term accessibility:

## Link to a long-term host

Although SESYNC hosts a Shiny server[^2] for researchers and teams, it is only intended for use throughout the duration of funded projects to assist in data exploration, sharing results, and prototyping applications. Because apps hosted at http://shiny.sesync.org/ will be deactivated at the end of a project's lifecycle, we don't recommend including this URL in a journal article. Instead, a more reliable solution is to host your app with an account on a platform designed for long-term hosting such as [shinyapps.io](https://docs.rstudio.com/shinyapps.io/). If you anticipate site traffic beyond what is available to you with shinyapps.io[^3], reach out to us at [cyberhelp@sesync.org](mailto:cyberhelp@sesync.org) to discuss solutions. Alternatively, if you or your institution have capabilities for web hosting, you can also download and configure a [Shiny server](https://github.com/rstudio/shiny-server/blob/master/README.md). 

Note that if the interactive functionality of your app does not require R code to run (e.g. output from any [htmlwidgets](http://gallery.htmlwidgets.org/) packages), you *do not need a backend server* to host your app and can use a free website hosting service such as [GitHub Pages](https://pages.github.com/). 

## Publish the source code

Instead of linking to a "live" version of an app on a server, consider directing readers directly to the code for your app by linking to a uniquely identifiable [release of a GitHub repository](https://cyberhelp.sesync.org/blog/shiny-sharing.html). The Readme file and/or repository website can include the link to the location of the hosted app. This is a good solution if your main audience is people with R and Shiny installed on their computers, and/or if the URL might change after the paper is published (e.g. from a shiny.sesync.org site to a shinyapps.io site). By sharing the files that make your app, anyone with R and Shiny installed will be able to host a local version of your app using either `runUrl`, `runGitHub`, or `runGist`[^4]; and by registering a DOI for the code, you can specifically refer to the current version of an app while leaving open the possibility of future updates and improvements. 

## Publish underlying data

Datasets used in your application should also have their own DOI, obtained from an appropriate DOI-issuing repository such as FigShare, Zenodo, Dryad, or a domain-specific repository[^5]. Although a minimal amount of data can be stored along with the code in a GitHub repository, hosting the data in an appropriate repository will enable greater re-use, visibility, and adherence to metadata standards. 
 

[^1]: See [this post](https://cyberhelp.sesync.org/blog/shiny-sharing.html) to learn about getting your app on the web to begin with.
[^2]: [Publish a Shiny App Quickstart guide](https://cyberhelp.sesync.org/quickstart/how-do-i-publish-a-shiny-app-on-the-sesync-server.html)
[^3]: shinyapps.io [pricing models](https://www.shinyapps.io/#pricing)
[^4]: How to [Share apps](https://shiny.rstudio.com/tutorial/written-tutorial/lesson7/)
[^5]: Read more about publishing datasets [here](https://cyberhelp.sesync.org/quickstart/sharing-data-products.html)