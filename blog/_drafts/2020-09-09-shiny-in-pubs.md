---
title: "Only You Can Prevent Link Rot"
tags:
 - Shiny
 - R
author: khondula
---

Links to content on the web are increasingly common in published papers&emdash; sometimes as cited references, but more often appearing elsewhere in the article. This includes links to web applications, such as those created with RShiny, where readers can explore data, models, and visualizations of results presented in a manuscript through dynamic content and interactive websites created by the authors. Web applications may even be the main focus of a paper, such as description of software like a decision support tool. Although interactive content and visualizations have great potential to enhance communication and engagement around the topic of an article, current practice has raised alarm as a significant step backwards in the trajectory of scientific publishing because of the amount of information that is likely to become inaccessible or lost within a relatively short period of time[^1]. Read on if you are considering linking to a Shiny app in a publication!

## The Problem 

### 404'd

The average half life for a typical URL is 2 years, meaning that any link you come across in a journal article has a high probability of bringing you to a "content not found" 404 error. Investigations of this phenomenon, dubbed "link rot", find around 30-40% of web links in published articles are inaccessible[^2]. This is a predictable outcome given that websites undergo periodic reorganization, researchers move institutions, and hardware gets replaced. Some content is incidentally preserved through automated archive engines, however this does not apply to material that is copyrighted, behind paywalls, or websites that include code to prevent indexing. And for dynamic websites like Shiny apps, archive engines can only capture the design of the landing page not their interactive elements. 

## Content drift

Website content is also constantly changing, so there is always some degree of uncertainty whether the information at a given URL is the same as what was intended to be referenced. A 1999 study showed that 50% of websites ending in `.com` substantially change content every 11 days, and 50% of `.gov` pages change within 4 months, and a more recent study in 2016 found that 75% of references to web content in scientific articles linked to content that was changed from when it was referenced[^3]. If a dataset was downloaded from an online web portal, it may not be possible to tell whehther the underlying data was updated since it was used.    

## Our Recommendations

<img src="../../assets/images/only-you.jpg" alt="smokey-psa" width="250"  style="padding-right: 25px"/> The longevity of the app's web-hosting platform should be considered&mdash;as is the case whenever including a URL web link in a manuscript&mdash;to achieve continued accessibility and functionality as long as possible. Websites belonging to individual researchers, lab groups, university departments, and grant-funded research centers like SESYNC are subject to periodic migration, reorganization, or retirement; and consequently, many links in published papers inevitably become inactive. Even if a link to an app remains active, there is no guarantee that an app will continue to function&mdash;or function in the same way&mdash;into the future as underlying infrastructure of a given platform gets updated.

While it's possible that some publishers of scientific journals may eventually support responsive content or web applications themselves, for now we will assume that articles are based on text and images and any interactive content must be hosted elsewhere on the web[^4]. If you link to such a web app in a manuscript, here's what we recommend for improving accessibility:

### Link to a long-term host

Although SESYNC hosts a Shiny server[^5] for researchers and teams, it is **only intended for use throughout the duration of funded projects** to assist in data exploration, sharing results, and prototyping applications. Because apps hosted at `shiny.sesync.org` will be deactivated at the end of a project's lifecycle, you should not include this URL in a journal article. Instead, a more reliable solution is to host your app with an account on a platform designed for long-term hosting, such as [shinyapps.io](https://docs.rstudio.com/shinyapps.io/). If you anticipate computing needs or site traffic beyond what is available to you with shinyapps.io[^6], reach out to us at [cyberhelp@sesync.org](mailto:cyberhelp@sesync.org) to discuss solutions. Alternatively, if you or your institution have capabilities for web hosting, you can also download and configure your own [Shiny server](https://github.com/rstudio/shiny-server/blob/master/README.md). 

Note that if the interactive functionality of your app does not actually require R code to run (e.g. output you can save as an html file), you *do not need a backend server* to host your app and can use a free hosting service such as [GitHub Pages](https://pages.github.com/) instead. Learn more about htmlwidgets and see examples [here](https://bookdown.org/yihui/rmarkdown/html-widgets.html) or [here](http://www.htmlwidgets.org/showcase_leaflet.html). 

### Use object rather than location-based identifiers

In other words: publish the source code and underlying data sets! Whereas URLs are addresses to locations on the internet, other standardized systems like digital object identifiers (DOIs) refer to specific pieces of information such as documents, images, software code, or datasets. In studies of link rot, even when there is identical attrition rates between links to URLs and DOIs, all of the inactive DOIs are recoverable by searching the web (inactive links are mostly due to typographic errors) or using the DOI system at [doi.org](https://www.doi.org/)

Instead of linking to a "live" version of an app on a server, consider directing readers directly to the code for your app by linking to a uniquely identifiable [release of a GitHub repository](https://cyberhelp.sesync.org/blog/shiny-sharing.html) using [Zenodo](https://guides.github.com/activities/citable-code/). The Readme file and/or repository website can include the link to the location of the hosted app, so even if the hosting platform changes (e.g. if you move institutions), the link in the published article still lets readers find the app. By registering a DOI for the code, you can also specifically refer to the current version of an app while leaving open the possibility of future updates and improvements. 

This option also has an added benefit for people with R and Shiny installed on their computers. By sharing the files that make your app, anyone with R and Shiny installed will be able to run a local version of your app by copying a web link into functions in the shiny package like `runUrl`, `runGitHub`, or `runGist`[^7].

Datasets used in your application should also have their own DOI, obtained from an appropriate DOI-issuing repository such as FigShare, Dryad, or a domain-specific repository[^8]. Although a minimal amount of data can be stored along with the code in a GitHub repository, hosting the data in an appropriate repository will enable greater re-use, visibility, and adherence to metadata standards. 

[^1]: e.g. by Dellavalle et al. 2003 [Going, Going, Gone: Lost Internet References](https://doi.org/10.1126/science.1088234),<br>Duda and Camp 2008 [Ecology in the information age: patterns of use and attrition rates of internet-based citations in ESA journals, 1997–2005](https://www.jstor.org/stable/20440844),<br>Hennessey and Ge 2013 [A cross disciplinary study of link decay and the effectiveness of mitigation techniques](https://dx.doi.org/10.1186%2F1471-2105-14-S14-S5),<br>Klein et al. 2014 [Scholarly Context Not Found: One in Five Articles Suffers from Reference Rot](https://doi.org/10.1371/journal.pone.0115253).
[^2]: Rates in ecology and environmental science are near average or below: 30% of links were inactive from 9 years of papers published in ecology journals; 37% of links from the titles or abstracts of papers published in Environmental Science journals over 14 years were inactive.
[^3]: Cho and Garcia-Molina 1999. [The Evolution of the Web and Implications for an Incremental Crawler](http://ilpubs.stanford.edu:8090/376/1/1999-22.pdf), Jones et al 2016 [Scholarly Context Adrift: Three out of Four URI References Lead to Changed Content](https://doi.org/10.1371/journal.pone.0171057)
[^4]: See [this post](https://cyberhelp.sesync.org/blog/shiny-sharing.html) to learn about getting your app on the web to begin with.
[^5]: [Publish a Shiny App Quickstart guide](https://cyberhelp.sesync.org/quickstart/how-do-i-publish-a-shiny-app-on-the-sesync-server.html)
[^6]: shinyapps.io [pricing models](https://www.shinyapps.io/#pricing)
[^7]: How to [Share apps](https://shiny.rstudio.com/tutorial/written-tutorial/lesson7/)
[^8]: Read more about publishing datasets in our Quickstart guide [here](https://cyberhelp.sesync.org/quickstart/sharing-data-products.html)

