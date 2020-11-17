---
title: "Improving Accessibility in Apps and Websites"
tags:
 - Shiny
 - R
 - Accessibility
author: khondula
---

## Notes

Topics
- why/motivation - supporting a variety of assisstive tech, and designing your site thoughtfully
- types/categories of impairments:  can affect ability to perceive... color, alt-text, tabindex
- checklists/guides
- tools/emulators: 

Resources

- https://accessibility.18f.gov/
- https://engineering-shiny.org/matters.html
- https://community.rstudio.com/t/making-shiny-apps-accessible-for-all-humans/8458/2
- https://digital.gov/2018/01/30/updated-it-accessibility-standards/
- user profiles: https://www.gov.uk/government/publications/understanding-disabilities-and-impairments-user-profiles
- profiles https://accessibility.blog.gov.uk/category/accessibility-and-me/
- https://www.rostrum.blog/2018/05/12/accessibility-workshop-at-sprint18/
- make the point about curb cuts, designing for accessibility can improve user experience for everyone. Impairments range from permanent to situational - eg. captions on video content make it accessible for people who are deaf and those in a noisy room
- remember the prevalence of disability increases with age
- can seem overwhelming to make something 100% accessibile for everyone. goal should be to make progress and remove exclusionary barriers, stop accidental exclusion

- posters about designing for accessibility: https://github.com/UKHomeOffice/posters/blob/master/accessibility/dos-donts/posters_en-UK/accessibility-posters-set.pdf
- https://accessibility.blog.gov.uk/2016/09/02/dos-and-donts-on-designing-for-accessibility/

Google Chrome has a built-in feature that allows to simulate some vision deficiency. To access this feature, open your developer console, then open the “More Tools” > “Rendering” menu. There, you will find at the very bottom an input called “Emulate vision deficiencies”, which will allow to simulate Blurred vision, and four types of color blindness.

https://addons.mozilla.org/en-US/firefox/addon/accessibility-checker/

Tips
- function tagAppendAttributes in shiny to add attributes to html elements

## The Problem 


### Accessibility

Even at websites where the originally referenced material remains active, web applications can be inaccessible to users that rely on assistive technologies like screen readers. Many websites lack basic accessibility provisions such as providing alternative text for non-text objects and providing methods for interacting with an interface using only a keybaord. The functionality of a web apps can be rendered useless if a user has no way of determining whether a checkbox is checked or can't read text against a low contrast background. Developers of RShiny have made substantial improvements for implementing accessibility standards, but there are continued [issues](https://github.com/rstudio/shiny/labels/Type%3A%20Accessibility) that could be affecting your applications. 

## Our Recommendations
 
### Test for accessibility 

The internet has a detailed set of [technical specifications for Accessible Rich Internet Applications](https://www.w3.org/TR/wai-aria-practices/), which developers can implement to ensure that users can effectively interact with elements of a user interface. Many of these are simple changes that, when implemented, more clearly communicate the roles, states, and properties of elements on the page. The University of Washington has a great introduction and set of resources linked from their page on [Accessible Technology](https://www.washington.edu/accessibility/web/aria/). Most important is to test out how your application looks and behaves with assistive technology. Tools like the [Web Accessibilty Evaluation Tool](https://wave.webaim.org/) are a quick way to highlight problems on any webpage. You can install one-click emulators for color deficiencies ([Color Oracle](https://colororacle.org/)), or use built-in operating system tools like VoiceOver in Macbooks, or check out more tools on the list of web accessibility evaluation tools [here]( https://www.w3.org/WAI/ER/tools/). 



