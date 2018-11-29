---
title: Images for Data Exploration in RShiny Apps
tags:
  - dataviz
  - R
  - shiny
author: khondula
---


Photos, as a source of data, or to aid in the interpretation of data, can be a useful addition to [RShiny](http://cyberhelp.sesync.org/tags/#-shiny) applications. Here are two examples of using photo data: one that dispalys images from URLs, and another that uses species names to find pictures of animals. 

## Display images from URLs

The first situation was using a social media dataset (images from Flickr) that was a table where each row contained information about a photograph, and columns contained data about that photo. One column contained URLs to the image file. The goal was to be able to browse through each image and potentially update other information in the table pertaining to that image. This can be done in Shiny with an interactive [DataTable](https://rstudio.github.io/DT/shiny.html), where clicking on a row displays an image and allows for making changes to its associated data. 

When a row in the table is clicked, the ID of that row becomes an input variable that can be used in the shiny server. That variable can then be used to select the URL text string in the "image_url" column of the `image_data` dataframe. That URL is then enclosed within html [img](https://www.w3schools.com/tags/tag_img.asp) tags to create as a text object called "image1". 

```
output$image1 <- renderText({
        c('<img src="', image_data[input$image_data_rows_selected, "image_url"], '">')
      })
```

Output objects rendered within the shiny server need to be paired with a corresponding output function in the user interface. Since the text output object "image1" is actually an html string, using it with `htmlOutput` will interpret the html and display the image wherever it is placed in the app! 

```
out1 <- htmlOutput("image1")
```

See a minimal example on github [here](https://github.com/khondula/image-viewer).

## Animal pictures from species names

Another shiny app that used images to aid in data exploration shiny app was based on a large biodiversity data set. The main purpose of the app was to display country-level [time series](https://rstudio.github.io/dygraphs/shiny.html) data for a selected species---but with thousands of different taxa, exploring the dataset based on latin names proved difficult! So, I wanted the app to display some contextual information about the selected species aside from its latin name and the time series data. This is possible with functions from the [rinat](https://cran.r-project.org/web/packages/rinat/vignettes/rinatVignette.html) package, whichs draws on [iNaturalist](http://www.inaturalist.org/) data---which includes urls of user-uploaded images based on taxa names. 

```
inat <- reactive({
    get_inat_obs(taxon_name = input$selected_species)
  })
```

The function `get_inat_obs()` retrieves a dataframe of species observations based on the species chosen in a drop-down menu. One of the columns contains image URLs, which can then be used to create an output image object. 

```
output$image1 = renderUI({
      tags$img(src=inat()$image_url[1], height = "200px")
  })
```

The [taxize](https://ropensci.org/tutorials/taxize_tutorial/) and [wikitaxa](https://cran.r-project.org/web/packages/wikitaxa/index.html)  packages also have useful functions for determining the common name, taxonomy, conservation status, geographic distribution, and more. 

![species_pix](/assets/images/species_pix2.png)

---

Learn more about creating interactive web applications using RShiny [here](http://cyberhelp.sesync.org/basic-Shiny-lesson/)




