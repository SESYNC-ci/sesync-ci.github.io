---
title: Sharing your RShiny app
tags:
  - R
  - Shiny
  - GitHub
author: khondula
---

RShiny and related packages have lowered the bar for making web applications in R without requring knowledge of the languages of web browsers (CSS, Javascript, HTML). This also means that sharing your app usually requires finding a platform that can run R code. Here are some (non mutually exclusive) options to consider for making your Shiny apps available on the web. 

1. Share the code on GitHub

Putting your app code and any associated files (data, images, etc.) in a GitHub repository makes your app avaialble for anyone with R installed to run it from their local R session by using the [runGitHub](https://github.com/rstudio/shiny_example) function in the shiny package or downloading the repository. As with any GitHub repository, this also means you can also "release" a version of the app to [get a citable DOI using Zenodo](https://guides.github.com/activities/citable-code/). 

2. Host a live version on shinyapps.io

Whereas SESYNC's shiny server is only designed for prototyping and testing, RStudio's [shinyapps.io](http://www.shinyapps.io/) is available as a longer term solution. There is a free tier that allows limited web traffic (up to 5 applications and 25 hours per month), and pay plans that offer more traffic, apps, and support. Hosting on other cloud services like [AWS](https://www.r-bloggers.com/shiny-server-on-aws/) or [Digital Ocean](https://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/) will require more configuration but can also be used to run your app.

3. Publish HTML websites 

Another possibility is sharing visualizations or reports as rendered HTML pages that don't require R code to run. For example, [interactive visualizations](https://www.htmlwidgets.org/showcase_leaflet.html) like the output from leaflet maps, dygraphs, timevis, or [R Markdown](https://rmarkdown.rstudio.com/) can be saved as HTML files that can be opened up in a web browser like Firefox or Chrome. They can also be hosted on GitHub as websites based on the repository name by [enabling the GitHub pages option](https://guides.github.com/features/pages/) in the repository Settings. 

4. Speed up your app

The first step to making your app faster is to figure out where the bottlenecks are. RStudio's Shiny website has several in depth articles on how to improve performance through [plot caching](http://shiny.rstudio.com/articles/plot-caching.html) and [load testing](https://rstudio.github.io/shinyloadtest/), but a few initial steps to take are to: a) do as much filtering and summarizing data outside of shiny as possible, and b) save large data frames as [feather](https://blog.rstudio.com/2016/03/29/feather/) files instead of csv to read them in faster. 

