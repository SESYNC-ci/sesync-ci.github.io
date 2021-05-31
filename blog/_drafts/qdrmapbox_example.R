library(qdrmapbox)
library(glue)

set_mapbox_api_key('~/Documents/mapboxapikey.txt')

# Define zoom and map corners
zoom <- 8
upper_left <- c(39.8, -79.5)
lower_right <- c(37.8, -74.8) 

md_tile_index <- find_tile_numbers(zoom = zoom, upper_left = upper_left, lower_right = lower_right)

md_tile_index # 8 tiles are needed.

download_dir <- '~/mdtiles'

md_tile_df <- download_mapbox_tiles(tile_numbers_mat = md_tile_index, download_dir = download_dir, resolution = 'high', jpg_quality = 90)

md_tile_df[1:2, ]

georeference_all_tiles(md_tile_df)

build_virtual_raster(md_tile_df, glue('{download_dir}/mdimage.vrt'))

# Make a map --------------------------------------------------------------

# Load more mapping packages
library(sf)
library(raster)
library(USAboundaries)
library(ggspatial)
library(ggplot2)

mdimage_raster <- stack(glue('{download_dir}/mdimage.vrt'))

md_counties <- us_counties(resolution = 'high', states = 'MD')
md_cities <- us_cities(states = 'MD')

p <- ggplot() +
  annotation_spatial(data = mdimage_raster, alpha = 0.9) +
  geom_sf(data = st_geometry(md_counties), color = 'white', fill = NA) +
  geom_sf(data = md_cities, aes(color = population), size = 2) +
  coord_sf(crs = 3857) +
  mapbox_logo(xmin = -8870000, xmax = -8820000, ymin = 4535000, ymax = 4590000) +
  annotate('text', x = Inf, y = -Inf, label = '\u00a9 Mapbox \u00a9 OpenStreetMap', hjust = 1, vjust = -1, color = 'white', size = 2) +
  scale_color_viridis_c(trans = 'log10', labels = function(x) format(x, scientific = FALSE))

ggsave('~/Documents/temp/marylandmapbox.png', p, dpi = 200, width = 8, height = 6)
