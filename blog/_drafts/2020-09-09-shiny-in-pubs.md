---
title: "Only You Can Prevent Link Rot"
tags:
 - Shiny
 - R
author: khondula
---

Links to content on the web are increasingly common in published papers&emdash;as cited references but more often appearing in elsewhere in the article test. This includes links to web applications, such as those created with RShiny, where readers can explore data, models, and visualizations of results presented in a manuscript through dynamic content and interactive websites. Web applications may even be the main focus of a paper, such as description of software like a decision support tool. Although interactive content and visualizations have great potential to enhance communication and engagement around the topic of an article, current practice has raised alarm as a significant step backwards in the trajectory of scientific publishing because of the amount of information that is likely to become inaccessible or lost within a relatively short period of time[^1].

## The Problem 

### 404'ed

The average half life for a typical URL is 2 years, meaning that any link you come across in a journal article has a high probability of bringing you to a "content not found" 404 error. Investigations of this phenomenon, dubbed "link rot", find around 30-40% of web links in published articles are inaccessible[^3]. This is a predictable outcome given that websites undergo periodic reorganization, researchers move institutions, and hardware gets replaced. Some content is incidentally preserved through automated archive engines, however this does not apply to material that is copyrighted, behind paywalls, or websites that include code to prevent indexing. And for dynamic websites like Shiny apps, archive engines can only capture the design of the landing page not their interactive elements. 

## Content drift

- content drift: cited study by Cho and Garcia-Molina showed that 50% of .com web pages change content over 11 days, and 50% of pages in .gov domain change. more than 40% of .com pages change every day[^4]
- followup study Jones et al 2016 looking at the same corpus found that for 75% of references, content has drifted away from when it was referenced 

### Accessibility

Even at websites where the originally referenced material remains active, web applications can be inaccessible to users that rely on assistive technologies like screen readers. Many websites lack basic accessibility provisions such as providing alternative text for non-text objects and providing methods for interacting with an interface using only a keybaord. The functionality of a web apps can be rendered useless if a user has no way of determining whether a checkbox is checked or can't read text against a low contrast background. Developers of RShiny have made substantial improvements for implementing accessibility standards, but there are continued [issues ](https://github.com/rstudio/shiny/labels/Type%3A%20Accessibility) that could be affecting your applications. 

## Our Recommendations

The longevity of the app's web-hosting platform should be considered&mdash;as is the case whenever including a URL web link in a manuscript&mdash;to achieve continued accessibility and functionality as long as possible. Websites belonging to individual researchers, lab groups, university deparatments, and grant-funded research centers like SESYNC are subject to periodic migration, reorganization, or retirement; and consequently, many links in published papers inevitably become inactive. Even if a link to an app remains active, there is no guarantee that an app will continue to function&mdash;or function in the same way&mdash;into the future as underlying infrastructure of a given platform gets updated.

While it's possible that some publishers of scientific journals may eventually support responsive content or web applications themselves, for now we will assume that articles are based on text and images and any interactive content must be hosted elsewhere on the web[^5]. If you link to such a web app in a manuscript, here's what we recommend for improving accessibility:

### Link to a long-term host

Although SESYNC hosts a Shiny server[^5] for researchers and teams, it is only intended for use throughout the duration of funded projects to assist in data exploration, sharing results, and prototyping applications. Because apps hosted at http://shiny.sesync.org/ will be deactivated at the end of a project's lifecycle, we don't recommend including this URL in a journal article. Instead, a more reliable solution is to host your app with an account on a platform designed for long-term hosting such as [shinyapps.io](https://docs.rstudio.com/shinyapps.io/). If you anticipate site traffic beyond what is available to you with shinyapps.io[^6], reach out to us at [cyberhelp@sesync.org](mailto:cyberhelp@sesync.org) to discuss solutions. Alternatively, if you or your institution have capabilities for web hosting, you can also download and configure a [Shiny server](https://github.com/rstudio/shiny-server/blob/master/README.md). 

If the interactive functionality of your app does not require R code to run (e.g. output from any [htmlwidgets](http://gallery.htmlwidgets.org/) packages), you *do not need a backend server* to host your app and can use a free hosting service such as [GitHub Pages](https://pages.github.com/) instead of a server. 

### Use object rather than location-based identifiers

ie. Publish the source code and any underlying data sets
* github making your code citable https://guides.github.com/activities/citable-code/

- references to DOIs can go inactive but they were all recoverable
- references to DOIs for journal articles started appearing in ESA journals in 2003. identical attrition rate between URLs and DOIs, but all inactive DOIs were discoverable by searching the internet and inactive links were mostly due to typographic errors

Instead of linking to a "live" version of an app on a server, consider directing readers directly to the code for your app by linking to a uniquely identifiable [release of a GitHub repository](https://cyberhelp.sesync.org/blog/shiny-sharing.html). The Readme file and/or repository website can include the link to the location of the hosted app. This is a good solution if your main audience is people with R and Shiny installed on their computers, and/or if the URL might change after the paper is published (e.g. from a shiny.sesync.org site to a shinyapps.io site). By sharing the files that make your app, anyone with R and Shiny installed will be able to host a local version of your app using either `runUrl`, `runGitHub`, or `runGist`[^7]; and by registering a DOI for the code, you can specifically refer to the current version of an app while leaving open the possibility of future updates and improvements. 

Datasets used in your application should also have their own DOI, obtained from an appropriate DOI-issuing repository such as FigShare, Zenodo, Dryad, or a domain-specific repository[^8]. Although a minimal amount of data can be stored along with the code in a GitHub repository, hosting the data in an appropriate repository will enable greater re-use, visibility, and adherence to metadata standards. 
 
### Test for accessibility 

* Evaluate applications using web accessibility evaluation tools
Color Oracle
- similar to emulators for color vision deficiencies (like color oracle), can test accessibility using built-in functions on macbooks (VoiceOver) for ChromeVox Classic Extension, list here https://www.w3.org/WAI/ER/tools/ including WAVE which highlights problems on any page: https://wave.webaim.org/
- lots of good links here: https://www.washington.edu/accessibility/web/aria/

![](../../assets/images/only-you.jpg)

[^1]: raised alarm papers
[^2]: details on link rot rates, ecology and environmental science from duda and camp, hennessey and ge 2013
[^3]: content drift cites
[^4]: See [this post](https://cyberhelp.sesync.org/blog/shiny-sharing.html) to learn about getting your app on the web to begin with.
[^5]: [Publish a Shiny App Quickstart guide](https://cyberhelp.sesync.org/quickstart/how-do-i-publish-a-shiny-app-on-the-sesync-server.html)
[^6]: shinyapps.io [pricing models](https://www.shinyapps.io/#pricing)
[^7]: How to [Share apps](https://shiny.rstudio.com/tutorial/written-tutorial/lesson7/)
[^8]: Read more about publishing datasets [here](https://cyberhelp.sesync.org/quickstart/sharing-data-products.html)

