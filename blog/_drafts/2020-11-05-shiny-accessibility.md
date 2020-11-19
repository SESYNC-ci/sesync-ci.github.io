---
title: "Shiny app accessibility part 2"
tags:
 - Shiny
 - Accessibility
author: khondula
---

This year marks the 30th anniversary of the [Americans with Disabilities Act](https://adata.org/learn-about-ada), a transformative civil rights law that followed decades of action by disability activists. It is now commonly recognized that considering accessibility in design choices has ubiquitious benefits, i.e. the "curb cut effect[^1]." This holds especially true for technology, such as how closed captions on videos that make it possible for people with disabilities to access content also allows people in noisy environments to view content. As you [consider ways to provide long-term access to a shiny app](https://cyberhelp.sesync.org/blog/shiny-in-pubs.html), it's also a good time to consider how design choices might unintentionally hinder people from using your app. 

Web applications can be inaccessible to users that rely on keyboard navigation or assistive technologies like screen readers. Many websites lack basic accessibility provisions such as providing sufficient color contrast, alternative text for images, or navigable page layouts. The functionality of an app can be rendered useless if a user has no way of determining whether a checkbox is checked or can't read text against a low contrast background. Developers of RShiny have made substantial improvements for implementing accessibility standards, but there are continued [issues](https://github.com/rstudio/shiny/labels/Type%3A%20Accessibility) that could be affecting your applications. 

The internet has a detailed set of [technical specifications for Accessible Rich Internet Applications](https://www.w3.org/TR/wai-aria-practices/), which developers can implement to ensure that users can effectively interact with elements of a user interface. Many of these are simple changes that, when implemented, more clearly communicate the roles, states, and properties of elements on the page. Here are some steps you can take to evaluate and improve the design of your apps, along with resources to learn more.

### Evaluate accessibility

Most important is to test out how your application looks and behaves with assistive technology. Operating systems and web browswers have many built-in tools that allow you emulate vision deficiencies or the output of assistive technologies like screen readers. There are also a number of tools for evaluating accessibility against best practice recommendations and standards such as [section 508](https://digital.gov/2018/01/30/updated-it-accessibility-standards/), the part of the ADA specific for information technology. 

* The [Web Accessibilty Evaluation Tool](https://wave.webaim.org/) is a quick way to highlight problems on any webpage. 
* Simulate different types of vision deficiencies using one-click emulators such as [Color Oracle](https://colororacle.org/) or [Google Chrome's built-in developer tool](https://developers.google.com/web/updates/2020/03/devtools). 
* Check out more tools on this [list of web accessibility evaluation tools]( https://www.w3.org/WAI/ER/tools/)

### Accessible Shiny features

Tips
- function tagAppendAttributes in shiny to add attributes to html elements
- https://engineering-shiny.org/matters.html
- https://community.rstudio.com/t/making-shiny-apps-accessible-for-all-humans/8458/2

### Resources to learn more

* Posters with the [Dos and don'ts on designing for accessibility](https://accessibility.blog.gov.uk/2016/09/02/dos-and-donts-on-designing-for-accessibility/) from the UK Government
* The University of Washington page on [Accessible Technology](https://www.washington.edu/accessibility/web/aria/)
* [Accessible Technology in the workplace](https://accessibletech.org/accessible-technology/#general)
- [18F's Accessibility guide](https://accessibility.18f.gov/)
- Collections of [interviews](https://accessibility.blog.gov.uk/category/accessibility-and-me/) and [user profiles](https://www.gov.uk/government/publications/understanding-disabilities-and-impairments-user-profiles) of people with access needs 


[^1]: This is the idea that once assistive technology becomes sufficiently ubiquitous and widely used, it is considered normal. Read more [here](https://ssir.org/articles/entry/the_curb_cut_effect),  [here](https://medium.com/@mosaicofminds/the-curb-cut-effect-how-making-public-spaces-accessible-to-people-with-disabilities-helps-everyone-d69f24c58785), or check out this [podcast episode](https://99percentinvisible.org/episode/curb-cuts/)


