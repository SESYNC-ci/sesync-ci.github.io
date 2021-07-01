---
title: "Making a fifty-state USA map, 2021 edition"
tags:
 - R
 - Visualization
 - Geospatial
author: qread
---

For a recent project, I wanted to display a choropleth map of the fifty United States with Alaska and Hawaii displayed as insets (not in their true geographic locations). It's a little bit cumbersome to make inset maps in ggplot2 and usually requires a few different package dependencies.

An alternative that doesn't require any inset maps is to do a custom transformation on the polygons representing Alaska and Hawaii to "magically" move them somewhere off the southern coast of Arizona (sorry, Mexico!) The excellent R package urbnmapr already includes R objects of class sf that have USA state and county boundaries transformed in this way. That allows you to make maps with ggplot2 and geom_sf. So if you want to make a map with 

But what if you don't want to use state or county boundaries. For example you might want to plot a map with ecoregion or watershed boundaries. Or you might want to use a specific version of the USA county boundaries provided by the Census Bureau --- every few years there are small changes made to the county designations. Occasionally a county is split off from another county or two counties merge. In that case, the maps provided by urbnmapr won't quite do the trick. So it's probably best to do the transformation yourself.

I used the art of Googling to find a few useful posts on the subject. Unfortunately they are all a few years old and use methods based on the sp package. The sp package has been largely replaced by sf. I didn't want to have to convert everything from sf to sp and then back again. So I decided to update the code in the tutorials I found to use the more modern sf package (hence the name "2021 edition").

# Walkthrough

In this post I go through how to create a fifty-state map of the Nature Conservancy ecoregions in the United States, with Alaska and Hawaii transformed so that they sit below and to the left of the map.

First we load the sf package and read the TNC ecoregion geopackage shapefile in as a sf object.

```
library(sf)

tnc_map <- st_read(...)
```

Next, let's define a Lambert equal-area coordinate reference system and transform the TNC map to that CRS. The original tutorial I adapted this code from uses this projection system. Essentially any equal-area projection would work if you tweak the parameters of the custom transformations.

```
crs_lambert <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"

county_map_trans <- county_map %>%
  st_transform(crs = crs_lambert)
```

Now, let's get only the rows from the TNC object that are part of Alaska, filtering by xxx. We use `st_geometry()` to pull out only the geometry column from the subsetted spatial data frame, then calculate the centroid of Alaska. To get the centroid we use `st_union()` to combine all the ecoregions into one shape, then `st_centroid()` to find its center point.

```
alaska <- county_map_trans %>% filter(fips_state %in% '02')
alaska_g <- st_geometry(alaska)
alaska_centroid <- st_centroid(st_union(alaska_g))
```

Now for the actual transformations. We need to transform Alaska as follows:

- Rotate it by 39 degrees counterclockwise.
- Shrink it by a factor of 2.3.
- Move it to the east and south.

To rotate a geometric shape, we have to subtract its centroid so that the shape is centered around (0,0), multiply it by a rotation matrix, and then add the centroid back again. The function `rot()` I define here creates the transformation matrix for a given angle in radians.

```
rot <- function(a) matrix(c(cos(a), sin(a), -sin(a), cos(a)), 2, 2)
```

The sf package makes it really easy to apply all three transformations at once. We subtract the centroid, multiply by the rotation matrix for the angle -39 degrees (converted to radians), divide by 2.3, add back the centroid, then add a two-element vector to move all the points by a desired amount. If you don't like the exact results you get from this, you can modify the parameters by changing the -39 to change the rotation, the 2.3 for the scaling, and the c(1000000, -5000000) for the relocation.

```
alaska_trans <- (alaska_g - alaska_centroid) * rot(-39 * pi/180) / 2.3 + alaska_centroid + c(1000000, -5000000)
```

Now we manually replace the geometry column in the `alaska` subsetted spatial data frame with the transformed geometry, and manually reassign the coordinate reference system (which was lost when we started messing with transformations).

```
alaska <- st_set_geometry(alaska, alaska_trans) %>% st_set_crs(st_crs(county_map_trans))
```

We do more or less the same thing for Hawaii, except that we rotate by 35 degrees counterclockwise, we don't resize it at all, and we move it by a different amount. Again you can feel free to modify these parameters if you don't like the result. (To resize it, multiply or divide before adding the centroid back again).

```
hi_crs <- '+proj=aea +lat_1=8 +lat_2=18 +lat_0=3 +lon_0=-157 +x_0=0 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,-0,-0,-0,0 +units=m +no_defs'
hi_box <- c(xmin = -400000, ymin = 1761000, xmax = 230000, ymax = 2130000)

hawaii <- county_map %>% 
  filter(fips_state %in% '15') %>%
  st_transform(crs = hi_crs) %>%
  st_crop(hi_box) %>%
  st_transform(crs = crs_lambert)

hawaii_g <- st_geometry(hawaii)
hawaii_centroid <- st_centroid(st_union(hawaii_g))

hawaii_trans <- (hawaii_g - hawaii_centroid) * rot(-35 * pi/180) + hawaii_centroid + c(5200000, -1400000)
hawaii <- st_set_geometry(hawaii, hawaii_trans) %>% st_set_crs(st_crs(county_map_trans))
```

Now all the pieces are in place. We create the final object by removing the original Alaska and Hawaii rows from the USA map object, then bind the transformed Alaska and Hawaii objects to it.

```
county_map <- county_map_trans %>%
  filter(!fips_state %in% c('02', '15')) %>%
  rbind(alaska) %>%
  rbind(hawaii)
```

Check out our cool map!

## Code

All the code for the blog post is in one place here.