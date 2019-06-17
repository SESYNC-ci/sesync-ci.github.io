---
title: Overcoming the polygon extraction uncertainty principle
tags:
  - R
  - spatial
author: khondula
---

In quantum mechanics, according to the Heisenberg uncertainty principle, it is impossible to precisely and accurately measure both the position and velocity of an object at the same time. When conducting spatial analysis in R, I have found it impossible to determine overlapping cell values, polygon IDs, and cell IDs all at the same time. Although any 2 of these values can be extracted simulataneously, getting all three together requires some additional manipulation. 

A common geospatial operation is to extract information from gridded data layers that corresponds to a set of overlapping points, lines, or polygons. 

* raster extract, works until data are too big.  
* faster with velox, however IDs are created for sf objects so this can be an issue for rasters with different extents. solution is to use SP object with IDs
* velox doesnt preserve cell IDs which might be useful for example tracking a specific pixel through time. One option is to get parts individually then join - get cellnumbers for polygons with tabularaster::cellnumbers, or cellnumbers and cell values with tabularaster::as_tibble. Or, add layers to raster with cell IDs or x and y values in addition to the data layers, so any subsequent extraction will also have information that identifies the pixel. 
