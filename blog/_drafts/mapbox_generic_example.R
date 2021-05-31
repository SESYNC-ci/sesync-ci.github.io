
# Load packages -----------------------------------------------------------



library(glue)
library(curl)
library(purrr)
library(gdalUtils)

Sys.setenv(MAPBOXAPIKEY = readLines('~/Documents/mapboxapikey.txt'))


# Define functions --------------------------------------------------------



find_tile_number <- function(zoom, lat_deg, lon_deg) {
  lat_rad <- lat_deg * pi / 180 # Convert lat to radians
  n <- 2 ^ zoom
  xtile <- floor(n * ((lon_deg + 180) / 360))
  ytile <- floor(n * (1 - (log(tan(lat_rad) + 1/cos(lat_rad)) / pi)) / 2)
  
  xtileseq <- seq(min(xtile), max(xtile))
  ytileseq <- seq(min(ytile), max(ytile))
  expand.grid(x = xtileseq, y = ytileseq)
}

corner_coords <- function(zoom, xtile, ytile) {
  n = 2 ^ zoom
  xcorners <- xtile + c(0, 1) # NW, SE
  ycorners <- ytile + c(0, 1)
  lon_deg = xcorners / n * 360.0 - 180.0
  lat_rad = atan(sinh(pi * (1 - 2 * ycorners / n)))
  lat_deg = lat_rad * 180.0 / pi
  cbind(lat = lat_deg, lon = lon_deg)
}

georeference_tile <- function(file_name, output_file_name, x, y, zoom, ...) {
  # Determine the two extreme corners of the tile.
  corners <- corner_coords(zoom, x, y)
  
  gdal_translate(file_name,
                 output_file_name,
                 of = 'GTiff',
                 a_ullr = c(corners[1, 'lon'], corners[1, 'lat'], corners[2, 'lon'], corners[2, 'lat']),
                 a_srs = "EPSG:4326")
}


# Get tiles ---------------------------------------------------------------

# Define zoom and map corners
zoom <- 8

upper_left <- c(39.8, -79.5)
lower_right <- c(37.8, -74.8) 

tile_numbers_mat <- find_tile_number(zoom=zoom, lat_deg=c(upper_left[1], lower_right[1]), lon_deg=c(upper_left[2], lower_right[2]))

tile_numbers_mat # 8 tiles are needed.

baseurl <- "https://api.mapbox.com/v4/mapbox.satellite"
download_dir <- 'C:/Users/qread/Documents/temp/mdtiles'

api_calls <- glue('{baseurl}/{zoom}/{tile_numbers_mat[,"x"]}/{tile_numbers_mat[,"y"]}@2x.jpg90?access_token=')
file_names <- glue('{download_dir}/tile_{tile_numbers_mat[,"x"]}_{tile_numbers_mat[,"y"]}.jpg') 
output_file_names <- gsub('jpg', 'tif', file_names)
tile_numbers_df <- data.frame(tile_numbers_mat, api_call = api_calls, file_name = file_names, output_file_name = output_file_names)

pwalk(tile_numbers_df, function(api_call, file_name, ...) curl_download(url = glue('{api_call}{Sys.getenv("MAPBOXAPIKEY")}'), destfile = file_name))


# Georeference and mosaic -------------------------------------------------

pwalk(tile_numbers_df, georeference_tile, zoom = zoom)

gdalbuildvrt(Sys.glob(glue('{download_dir}/*.tif')),
             glue('{download_dir}/mdimage.vrt'))


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

ggplot() +
  annotation_spatial(data = mdimage_raster, alpha = 0.9) +
  geom_sf(data = st_geometry(md_counties), color = 'white', fill = NA) +
  geom_sf(data = md_cities, aes(color = population), size = 2) +
  coord_sf(crs = 3857) +
  annotation_scale(text_col = 'white') +
  scale_color_viridis_c(trans = 'log10', labels = function(x) format(x, scientific = FALSE))

attribution <- '(c) Mapbox, (c) OpenStreetMap'
attribution_long <- 'Prints use map data from Mapbox and OpenStreetMap and their data sources. To learn more, visit https://www.mapbox.com/about/maps/ and http://www.openstreetmap.org/copyright.'
