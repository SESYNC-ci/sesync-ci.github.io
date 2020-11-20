---
title: "Shiny app accessibility part 2"
tags:
 - Shiny
 - Accessibility
author: khondula
---

This year marks the 30th anniversary of the [Americans with Disabilities Act](https://adata.org/learn-about-ada), a transformative civil rights law that followed decades of action by disability activists. It is now commonly recognized that considering accessibility in design choices has ubiquitious benefits, i.e. the "curb cut effect[^1]." This holds especially true for technology, such as how closed captions on videos that make it possible for people with disabilities to access content also helps anyone just in a noisy environment. As you [consider ways to provide long-term access to a shiny app](https://cyberhelp.sesync.org/blog/shiny-in-pubs.html), it's also a good time to consider how design choices might unintentionally hinder people from using your app. 

Web applications can be inaccessible to users that rely on keyboard navigation or assistive technologies like screen readers. Many websites lack basic accessibility provisions such as providing sufficient color contrast, alternative text for images, or navigable page layouts. This means the functionality of an app can be rendered useless if a user has no way of determining e.g. whether a checkbox is checked or can't read text against a low contrast background.

The internet has a detailed set of [technical specifications for Accessible Rich Internet Applications](https://www.w3.org/TR/wai-aria-practices/), which developers can implement to ensure that users can effectively interact with elements of a user interface. Many of these are simple changes that, when implemented, more clearly communicate the roles, states, and properties of elements on the page. Here are some steps you can take to evaluate and improve the design of your apps, along with resources to learn more.

### Evaluate accessibility

An easy first step is to test out how your application looks and behaves with assistive technology or under certain impairments. Operating systems and web browswers have many built-in tools that allow you emulate vision deficiencies or the output of assistive technologies like screen readers. There are also a number of tools for evaluating websites against best practices and legal standards such as [section 508](https://digital.gov/2018/01/30/updated-it-accessibility-standards/), the part of the ADA specific for information technology, such as:

* The [Web Accessibilty Evaluation Tool](https://wave.webaim.org/) is a quick way to highlight problems on any webpage. 
* Simulate different types of vision deficiencies using one-click emulators such as [Color Oracle](https://colororacle.org/) or [Google Chrome's built-in developer tool](https://developers.google.com/web/updates/2020/03/devtools). 
* Check out more tools on this [list of web accessibility evaluation tools]( https://www.w3.org/WAI/ER/tools/)

maybe put in screenshot of color vision emulator?

### Accessible Shiny features

Developers of RShiny have made substantial improvements for implementing accessibility standards, with arguments built into functions you're already using. For example, a recently implemented feature[^2] creates an `alt` parameter in `render*()` functions which allows for dynamically updating alt text tags on images, such as a description of what a plot is showing:

*still cant get this to work!!*
```
 output$plot1 <- renderPlot(
      {
        hist(dt())
      },
      alt = reactive({
        paste("Dynamic alt text. Mean(x):", round(mean(dt()), 3))
      })
```

Another design consideration is the order in which fields get highlighted when navigating by keyboard instead of a mouse (i.e. using the tab key). By default, elements are navigated based on their order in the code source. You can override the order using the html tag [tabindex](https://www.w3.org/WAI/GL/wiki/Creating_Logical_Tab_Order_with_the_Tabindex_Attribute) which can be accomplished with the function `tagAppendAttributes()`. 

For more advanced control beyond what is possible with standard HTML tags, [ARIA attributes](https://webaim.org/techniques/aria/) can be used to more precisely define what certain user interface elements do and their current status. In many cases these labels have already been incorporated into the source code for Shiny's user inputs. For example, using a `dateInput` widget now employs an ARIA-compliant solution that doesn't require clicking with a mouse[^3]. The [WAVE](https://wave.webaim.org/) tool described above can help determine whether there are features in your app that could be improved. 

For more details, check out the design section of the book Engineering Production-Grade Shiny apps [here](https://engineering-shiny.org/matters.html#web-accessibility) or look through the issues and pull requests regarding accessibility on [shiny's GitHub page](https://github.com/rstudio/shiny/labels/Type%3A%20Accessibility). 

### Resources to learn more

* Posters with the [Dos and don'ts on designing for accessibility](https://accessibility.blog.gov.uk/2016/09/02/dos-and-donts-on-designing-for-accessibility/) from the UK Government
* The University of Washington page on [Accessible Technology](https://www.washington.edu/accessibility/web/aria/)
* [Accessible Technology in the workplace](https://accessibletech.org/accessible-technology/#general)
* [18F's Accessibility guide](https://accessibility.18f.gov/)
* Collections of [interviews](https://accessibility.blog.gov.uk/category/accessibility-and-me/) and [user profiles](https://www.gov.uk/government/publications/understanding-disabilities-and-impairments-user-profiles) of people with access needs 


[^1]: This is the idea that once assistive technology becomes sufficiently ubiquitous and widely used, it is considered normal. Read more [here](https://ssir.org/articles/entry/the_curb_cut_effect),  [here](https://medium.com/@mosaicofminds/the-curb-cut-effect-how-making-public-spaces-accessible-to-people-with-disabilities-helps-everyone-d69f24c58785), or check out this [podcast episode](https://99percentinvisible.org/episode/curb-cuts/). 
[^2]: Described in [this pull request](https://github.com/rstudio/shiny/pull/3006). Note that currently this is only available the development version of the shiny package. 
[^3]: See an example of the ARIA specification in action [here](https://www.w3.org/TR/wai-aria-practices-1.1/examples/dialog-modal/datepicker-dialog.html) that was recently incorporated with [this pull request](https://github.com/rstudio/shiny/issues/2951). 
