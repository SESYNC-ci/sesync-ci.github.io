---
title: "Improving Accessibility in Apps and Websites"
tags:
 - Shiny
 - R
 - Accessibility
author: khondula
---

## The Problem 

### Accessibility

Even at websites where the originally referenced material remains active, web applications can be inaccessible to users that rely on assistive technologies like screen readers. Many websites lack basic accessibility provisions such as providing alternative text for non-text objects and providing methods for interacting with an interface using only a keybaord. The functionality of a web apps can be rendered useless if a user has no way of determining whether a checkbox is checked or can't read text against a low contrast background. Developers of RShiny have made substantial improvements for implementing accessibility standards, but there are continued [issues](https://github.com/rstudio/shiny/labels/Type%3A%20Accessibility) that could be affecting your applications. 

## Our Recommendations
 
### Test for accessibility 

The internet has a detailed set of [technical specifications for Accessible Rich Internet Applications](https://www.w3.org/TR/wai-aria-practices/), which developers can implement to ensure that users can effectively interact with elements of a user interface. Many of these are simple changes that, when implemented, more clearly communicate the roles, states, and properties of elements on the page. The University of Washington has a great introduction and set of resources linked from their page on [Accessible Technology](https://www.washington.edu/accessibility/web/aria/). Most important is to test out how your application looks and behaves with assistive technology. Tools like the [Web Accessibilty Evaluation Tool](https://wave.webaim.org/) are a quick way to highlight problems on any webpage. You can install one-click emulators for color deficiencies ([Color Oracle](https://colororacle.org/)), or use built-in operating system tools like VoiceOver in Macbooks, or check out more tools on the list of web accessibility evaluation tools [here]( https://www.w3.org/WAI/ER/tools/). 


[^1]: e.g. Dellavalle et al. 2003 [Going, Going, Gone: Lost Internet References](https://doi.org/10.1126/science.1088234),<br>Duda and Camp 2008 [Ecology in the information age: patterns of use and attrition rates of internet-based citations in ESA journals, 1997–2005](https://www.jstor.org/stable/20440844),<br>Hennessey and Ge 2013 [A cross disciplinary study of link decay and the effectiveness of mitigation techniques](https://dx.doi.org/10.1186%2F1471-2105-14-S14-S5),<br>Klein et al. 2014 [Scholarly Context Not Found: One in Five Articles Suffers from Reference Rot](https://doi.org/10.1371/journal.pone.0115253).
[^2]: Rates in ecology and environmental science are near average or below: 30% of links were inactive from 9 years of papers published in ecology journals; 37% of links from the titles or abstracts of papers published in Environmental Science journals over 14 years were inactive.
[^3]: Cho and Garcia-Molina 1999. [The Evolution of the Web and Implications for an Incremental Crawler](http://ilpubs.stanford.edu:8090/376/1/1999-22.pdf), Jones et al 2016 [Scholarly Context Adrift: Three out of Four URI References Lead to Changed Content](https://doi.org/10.1371/journal.pone.0171057)
[^4]: See [this post](https://cyberhelp.sesync.org/blog/shiny-sharing.html) to learn about getting your app on the web to begin with.
[^5]: [Publish a Shiny App Quickstart guide](https://cyberhelp.sesync.org/quickstart/how-do-i-publish-a-shiny-app-on-the-sesync-server.html)
[^6]: shinyapps.io [pricing models](https://www.shinyapps.io/#pricing)
[^7]: How to [Share apps](https://shiny.rstudio.com/tutorial/written-tutorial/lesson7/)
[^8]: Read more about publishing datasets [here](https://cyberhelp.sesync.org/quickstart/sharing-data-products.html)

