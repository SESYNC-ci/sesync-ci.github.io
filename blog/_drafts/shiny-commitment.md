---
title: So you want a website
tags:
  - R
  - shiny
  - github
author: khondula
---

This blog is about some possibilities and things to consider if you are interested in creating a website or tool for exploring data and models. It is important to consider your goals, level of commitment, and skillset. Tools like RShiny simplify making web applications, but hosting a website for that shiny application requires a longer term commitment. 

Interactive graphics, like leaflet maps, dygraphs, timelines from timevis, rendered notebooks (jupyter or Rmarkdown) produce HTML files that can be hosted on GitHub. Enabling the "GitHub pages" option will make your HTML page accessible at a url based on your github repository name. For example, https://amoeba.github.io/dataspice-example/. Link to example htmlwidgets? Once rendered to HTML, these files do not need to run any R code but can have a level of interactivity such as pop-ups, zooming, etc. that only requires a web browser. 

(image sequence of how to enable github pages). 

The "server" component of shiny apps uses R code to control the appearance of the app, i.e. to run R code based on user inputs and selections. So running a shiny app requires it to be hosted somewhere that can understand and run R code - this is your own computer when you click "run app" in RStudio. But you can't "export" a whole shiny app as an HTML file, so if you want to make your shiny app available to others, it requires figuring out where that R code will run. 

Who is your audience? Shiny app code can be hosted on github and R users can run your app in their own session using `runGitHub()`. For non-R users, apps can be hosted on shinyapps.io for free, depending on the amount of traffic received (maxes out at xx views per month). SESYNC's shiny server can be used for prototyping but it is not a long-term home. 
