---
title: "Mapbox working title"
tags:
 - R
 - Visualization
 - Geospatial
author: qread
---

# Introduction

- We can use leaflet and other great tools for interactive maps
- Static maps are still important!
- ggmap was a great resource but Google is now charging for their tiles
- Mapbox is a freemium resource which does the trick
- I couldn't find any existing package so I wrote one myself! (A very simple and minimalist package which really just does one thing, for this blogpost)
- Look at the bottom of this blogpost for a list of resources and other packages you might want to try out
- Every time you turn around a new geospatial visualization package in R comes out, which renders an older one obsolete ... it's hard to keep track of!

# Walkthrough

In this document I go through how to do the following, all from within R:

- Download good-quality satellite imagery from Mapbox raster tile API for a given extent and zoom level
- Use GDAL to georeference the resulting image files and mosaic them together
- Load the mosaicked file as a raster and use it as a base image for a static map

## Downloading and georeferencing the tiles

Walk through what this is doing. 

- Set API key
- Set a zoom level and the NW and SE corners of the map in lat-long.
- Use a function from the package to find what tiles we need

```
library(qdrmapbox)
library(glue)

set_mapbox_api_key('~/Documents/mapboxapikey.txt')

# Define zoom and map corners
zoom <- 8
upper_left <- c(39.8, -79.5)
lower_right <- c(37.8, -74.8) 

md_tile_index <- find_tile_numbers(zoom = zoom, upper_left = upper_left, lower_right = lower_right)
```

Zoom level 8 means 2^8 by 2^8, or 256 by 256, tiles to cover the entire globe (this is the same numbering system used for the zoom levels of Google Maps and other tile servers so this tile index function will work for other things besides Mapbox). At this zoom level we need eight tiles to cover the state of Maryland. The output of `find_tile_numbers()` gives you the x and y indexes of the tiles.

```
md_tile_index

##   zoom  x  y
## 1    8 71 97
## 2    8 72 97
## 3    8 73 97
## 4    8 74 97
## 5    8 71 98
## 6    8 72 98
## 7    8 73 98
## 8    8 74 98
```

Give an example of the API call. Also call out my good practices of not ever including the API key in any variable that's saved to the workspace even inside a function. Now that's good security. It's only ever an "invisible" environment variable.

```
download_dir <- '~/mdtiles'

md_tile_df <- download_mapbox_tiles(tile_numbers_mat = md_tile_index, download_dir = download_dir, resolution = 'high', jpg_quality = 90)
```

The function `download_mapbox_tiles()` downloads the tiles into a local directory given the index numbers we just found. Mapbox has low and high resolutions and JPEG quality settings of 70%, 80%, and 90%. I chose the highest in both cases. This shows what we just did. I saved the output of `download_mapbox_tiles()` to a data frame because it contains the file names of the downloaded tiles which we can use in the next step to georeference.

```
head(md_tile_df, 2)

##   zoom  x  y                                                                  api_call                file_name         output_file_name
## 1    8 71 97 https://api.mapbox.com/v4/mapbox.satellite/8/71/97@2x.jpg90?access_token= ~/mdtiles/tile_71_97.jpg ~/mdtiles/tile_71_97.tif
## 2    8 72 97 https://api.mapbox.com/v4/mapbox.satellite/8/72/97@2x.jpg90?access_token= ~/mdtiles/tile_72_97.jpg ~/mdtiles/tile_72_97.tif
```

Use GDAL to georeference the tiles and build a virtual raster out of them.

```
georeference_all_tiles(md_tile_df)

build_virtual_raster(md_tile_df, glue::glue('{download_dir}/mdimage.vrt'))
```

## Making the map

This is just a silly example using county boundary and city location data from the `USAboundaries` R package to plot the counties of Maryland and cities colored by their population size on a log scale, with the satellite imagery from Mapbox as a background. We use the excellent `ggspatial` package to turn the RGB raster to an annotation ... so it can be plotted in its true RGB colors but doesn't affect the fill or color scales of any of the actual data we plot on the map.

```
# Load more mapping packages
library(sf)
library(raster)
library(USAboundaries)
library(ggspatial)
library(ggplot2)

mdimage_raster <- stack(glue('{download_dir}/mdimage.vrt'))

md_counties <- us_counties(resolution = 'high', states = 'MD')
md_cities <- us_cities(states = 'MD')

ggplot() +
  annotation_spatial(data = mdimage_raster, alpha = 0.9) +
  geom_sf(data = st_geometry(md_counties), color = 'white', fill = NA) +
  geom_sf(data = md_cities, aes(color = population), size = 2) +
  coord_sf(crs = 3857) +
  annotation_scale(text_col = 'white') +
  scale_color_viridis_c(trans = 'log10', labels = function(x) format(x, scientific = FALSE))
```

# Other packages to try out

Here include the list of packages and links I put together in the original ticket.

# Code

Here is all the code from this blog post in one R script so you can run it more easily.
