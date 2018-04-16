---
title: 
category: blog
tags:
  - dataviz
  - R
author: khondula
---

Leaflet maps with satellite data! a cool integration of shiny and leaflet. 

based on leaflet lesson worksheet 3

```
library(shiny)

ui <- fluidPage(
  leafletOutput("map", height = 800)
)

ui <- fluidPage(
    leafletOutput("map", height = 800),
      absolutePanel(top = 100, right = 10, draggable = TRUE,
              dateInput("dateinput", "Imagery Date", value = "2018-03-28"
                    )
))

server <- function(input, output) {

  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles(group = "OSM") %>%
      addProviderTiles(providers$NASAGIBS.ModisTerraTrueColorCR, group = "Modis",
                       options = providerTileOptions(time = input$dateinput)) %>%
      setView(lng = -76.505206, lat = 38.9767231, zoom = 7) %>%
      addLayersControl(baseGroups = c("Modis", "OSM"),
                       options = layersControlOptions(collapsed = FALSE)
      )
  })

}

shinyApp(ui, server)
```