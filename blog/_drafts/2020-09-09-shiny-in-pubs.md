---
title: "Only You Can Prevent Link Rot"
tags:
 - Shiny
 - R
author: khondula
---

Links to content on the web are increasingly common in published papers&emdash;as cited references but more often appearing in elsewhere in the article. This includes links to web applications, such as those created with RShiny, where readers can explore data, models, and visualizations of results presented in a manuscript through dynamic content and interactive websites created by the authors. Web applications may even be the main focus of a paper, such as description of software like a decision support tool. Although interactive content and visualizations have great potential to enhance communication and engagement around the topic of an article, current practice has raised alarm as a significant step backwards in the trajectory of scientific publishing because of the amount of information that is likely to become inaccessible or lost within a relatively short period of time[^1]. Read on if you are considering linking to a Shiny app in a publication!

## The Problem 

### 404'ed

The average half life for a typical URL is 2 years, meaning that any link you come across in a journal article has a high probability of bringing you to a "content not found" 404 error. Investigations of this phenomenon, dubbed "link rot", find around 30-40% of web links in published articles are inaccessible[^2]. This is a predictable outcome given that websites undergo periodic reorganization, researchers move institutions, and hardware gets replaced. Some content is incidentally preserved through automated archive engines, however this does not apply to material that is copyrighted, behind paywalls, or websites that include code to prevent indexing. And for dynamic websites like Shiny apps, archive engines can only capture the design of the landing page not their interactive elements. 

## Content drift

Website content is also constantly changing, so there is always some degree of uncertainty whether the information at a given URL is the same as what was intended to be referenced. A 1999 study showed that 50% of websites ending in `.com` substantially change content every 11 days, and 50% of `.gov` pages change within 4 months, and a more recent study in 2016 found that 75% of references in scientific articles linked to content that was changed from when it was referenced[^3].

### Accessibility

Even at websites where the originally referenced material remains active, web applications can be inaccessible to users that rely on assistive technologies like screen readers. Many websites lack basic accessibility provisions such as providing alternative text for non-text objects and providing methods for interacting with an interface using only a keybaord. The functionality of a web apps can be rendered useless if a user has no way of determining whether a checkbox is checked or can't read text against a low contrast background. Developers of RShiny have made substantial improvements for implementing accessibility standards, but there are continued [issues ](https://github.com/rstudio/shiny/labels/Type%3A%20Accessibility) that could be affecting your applications. 

## Our Recommendations

The longevity of the app's web-hosting platform should be considered&mdash;as is the case whenever including a URL web link in a manuscript&mdash;to achieve continued accessibility and functionality as long as possible. Websites belonging to individual researchers, lab groups, university deparatments, and grant-funded research centers like SESYNC are subject to periodic migration, reorganization, or retirement; and consequently, many links in published papers inevitably become inactive. Even if a link to an app remains active, there is no guarantee that an app will continue to function&mdash;or function in the same way&mdash;into the future as underlying infrastructure of a given platform gets updated.

While it's possible that some publishers of scientific journals may eventually support responsive content or web applications themselves, for now we will assume that articles are based on text and images and any interactive content must be hosted elsewhere on the web[^4]. If you link to such a web app in a manuscript, here's what we recommend for improving accessibility:

### Link to a long-term host

Although SESYNC hosts a Shiny server[^5] for researchers and teams, it is **only intended for use throughout the duration of funded projects** to assist in data exploration, sharing results, and prototyping applications. Because apps hosted at `shiny.sesync.org` will be deactivated at the end of a project's lifecycle, we don't recommend including this URL in a journal article. Instead, a more reliable solution is to host your app with an account on a platform designed for long-term hosting, such as [shinyapps.io](https://docs.rstudio.com/shinyapps.io/). If you anticipate computing needs or site traffic beyond what is available to you with shinyapps.io[^6], reach out to us at [cyberhelp@sesync.org](mailto:cyberhelp@sesync.org) to discuss solutions. Alternatively, if you or your institution have capabilities for web hosting, you can also download and configure your own [Shiny server](https://github.com/rstudio/shiny-server/blob/master/README.md). 

Note that if the interactive functionality of your app does not actually require R code to run (e.g. output from any [htmlwidgets](http://gallery.htmlwidgets.org/) packages), you *do not need a backend server* to host your app and can use a free hosting service such as [GitHub Pages](https://pages.github.com/) instead. 

### Use object rather than location-based identifiers

In other words: publish the source code and underlying data sets! Whereas URLs are addresses to locations on the internet, other standardized systems like digital object identifiers (DOIs) refer to specific pieces of information such as documents, images, software code, or datasets. In studies of link rot, even when there is identical attrition rates between links to URLs and DOIs, all of the inactive DOIs are recoverable by searching the web (inactive links are mostly due to typographic errors). 

Instead of linking to a "live" version of an app on a server, consider directing readers directly to the code for your app by linking to a uniquely identifiable [release of a GitHub repository](https://cyberhelp.sesync.org/blog/shiny-sharing.html). The Readme file and/or repository website can include the link to the location of the hosted app. This is a good solution if your main audience is people with R and Shiny installed on their computers, and/or if the URL might change after the paper is published (e.g. from a shiny.sesync.org site to a shinyapps.io site). By sharing the files that make your app, anyone with R and Shiny installed will be able to host a local version of your app by copying a web link into a functions in the shiny package like `runUrl`, `runGitHub`, or `runGist`[^7]; and by registering a DOI for the code, you can specifically refer to the current version of an app while leaving open the possibility of future updates and improvements. 

Datasets used in your application should also have their own DOI, obtained from an appropriate DOI-issuing repository such as FigShare, Zenodo, Dryad, or a domain-specific repository[^8]. Although a minimal amount of data can be stored along with the code in a GitHub repository, hosting the data in an appropriate repository will enable greater re-use, visibility, and adherence to metadata standards. 
 
### Test for accessibility 

The internet has a detailed set of [technical specifications for Accessible Rich Internet Applications](https://www.w3.org/TR/wai-aria-practices/), which developers can implement to ensure that users can effectively interact with elements of a user interface. Many of these are simple changes that, when implemented, more clearly communicate the roles, states, and properties of elements on the page. The University of Washington has a great introduction and set of resources linked from their page on [Accessible Technology](https://www.washington.edu/accessibility/web/aria/). Most important is to test out how your application looks and behaves with assistive technology. Tools like the [Web Accessibilty Evaluation Tool](https://wave.webaim.org/) are a quick way to highlight problems on any webpage. You can install one-click emulators for color deficiencies ([Color Oracle](https://colororacle.org/)), or use built-in operating system tools like VoiceOver in Macbooks, or check out more tools on the list of web accessibility evaluation tools [here]( https://www.w3.org/WAI/ER/tools/). 

![](../../assets/images/only-you.jpg){height=30%}

[^1]: e.g. Dellavalle et al. 2003 [Going, Going, Gone: Lost Internet References](https://doi.org/10.1126/science.1088234),<br>Duda and Camp 2008 [Ecology in the information age: patterns of use and attrition rates of internet-based citations in ESA journals, 1997–2005](https://www.jstor.org/stable/20440844),<br>Hennessey and Ge 2013 [A cross disciplinary study of link decay and the effectiveness of mitigation techniques](https://dx.doi.org/10.1186%2F1471-2105-14-S14-S5),<br>Klein et al. 2014 [Scholarly Context Not Found: One in Five Articles Suffers from Reference Rot](https://doi.org/10.1371/journal.pone.0115253).
[^2]: Rates in ecology and environmental science are near average or below: 30% of links were inactive from 9 years of papers published in ecology journals; 37% of links from the titles or abstracts of papers published in Environmental Science journals over 14 years were inactive.
[^3]: Cho and Garcia-Molina 1999. [The Evolution of the Web and Implications for an Incremental Crawler](http://ilpubs.stanford.edu:8090/376/1/1999-22.pdf), Jones et al 2016 [Scholarly Context Adrift: Three out of Four URI References Lead to Changed Content](https://doi.org/10.1371/journal.pone.0171057)
[^4]: See [this post](https://cyberhelp.sesync.org/blog/shiny-sharing.html) to learn about getting your app on the web to begin with.
[^5]: [Publish a Shiny App Quickstart guide](https://cyberhelp.sesync.org/quickstart/how-do-i-publish-a-shiny-app-on-the-sesync-server.html)
[^6]: shinyapps.io [pricing models](https://www.shinyapps.io/#pricing)
[^7]: How to [Share apps](https://shiny.rstudio.com/tutorial/written-tutorial/lesson7/)
[^8]: Read more about publishing datasets [here](https://cyberhelp.sesync.org/quickstart/sharing-data-products.html)

