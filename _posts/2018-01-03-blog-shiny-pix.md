---
title: Photo data in RShiny apps
category: blog
tags:
  - dataviz
  - R
  - shiny
---

# {{ page.title }}

Photos, as a source of data, or to aid in the interpretation of data, can be a useful addition to [RShiny](http://cyberhelp.sesync.org/tags/#-shiny) applications. Here are two examples of using photo data: one that uses images from URLs, and another that uses species names to find pictures of animals. 

## Display images from URLs

The first situation was using a dataset from social media (Flickr) where each row contained information about a  photograph, and one column contained URLs to that image file. The goal was to be able to easily view each image and potentially update other information in the table pertaining to that image. By using the [DataTables](https://rstudio.github.io/DT/shiny.html) library, I made the table interactive, so that each image could be viewed and annotated. 

The ID of the selected row in the table can then be used as in input object (called `image_data_rows_selected` below) to select the URL text string in the "image_url" column of the `image_data` dataframe. That URL is enclosed within html [img](https://www.w3schools.com/tags/tag_img.asp) tags to render as a text object called "image1". 

```
output$image1 <- renderText({c('<img src="', image_data[input$image_data_rows_selected, "image_url"], '">')})
```

Output objects rendered within the shiny server need to be paired with a corresponding output function in the user interface. Since the output object "image1" is an html string, using it with `htmlOutput` will interpret the html string and display the jpeg image wherever it is placed in the app! 

```
out1 <- htmlOutput("image1")
```

See a minimal example on github [here](https://github.com/khondula/image-viewer).

## Animal pictures from species names

Another situation where it was handy to add images to a data exploration shiny app was based on a large biodiversity data set. The main purpose of the app was to display country-level [time series](https://rstudio.github.io/dygraphs/shiny.html) of species data---but in a dataset with thousands of different species, exploring the data based on latin names proved difficult! I incorporated functions from the [rinat](https://cran.r-project.org/web/packages/rinat/vignettes/rinatVignette.html) package to draw on [iNaturalist](http://www.inaturalist.org/) data, which includes urls of user-uploaded images based on taxa names. 

```
inat <- reactive({
    get_inat_obs(taxon_name = input$selected_species)
  })
    
output$image1 = renderUI({
      src = inat()$image_url[1] # just the first image
      tags$img(src=src, height = "200px")
  })
```

The [taxize](https://ropensci.org/tutorials/taxize_tutorial/) and [wikitaxa](https://cran.r-project.org/web/packages/wikitaxa/index.html)  packages also have useful functions for determining the common name, conservation status, geographic distribution, and lots of other taxonomic information. 

---

Learn more about creating interactive web applications using RShiny [here](http://cyberhelp.sesync.org/basic-Shiny-lesson/)




