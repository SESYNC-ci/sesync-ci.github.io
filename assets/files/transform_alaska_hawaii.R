library(sf)
library(dplyr)

tnc_map <- st_read('/nfs/public-data/tnc_ecoregions_usa.gpkg')

crs_lambert <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"

tnc_map_trans <- tnc_map %>%
  st_transform(crs = crs_lambert)

alaska <- tnc_map_trans %>% filter(state %in% 'Alaska')
alaska_g <- st_geometry(alaska)
alaska_centroid <- st_centroid(st_union(alaska_g))

rot <- function(a) matrix(c(cos(a), sin(a), -sin(a), cos(a)), 2, 2)

alaska_trans <- (alaska_g - alaska_centroid) * rot(-39 * pi/180) / 2.3 + alaska_centroid + c(1000000, -5000000)

alaska <- alaska %>% st_set_geometry(alaska_trans) %>% st_set_crs(st_crs(tnc_map_trans))

hawaii <- tnc_map_trans %>% filter(state %in% 'Hawaii')

hawaii_g <- st_geometry(hawaii)
hawaii_centroid <- st_centroid(st_union(hawaii_g))

hawaii_trans <- (hawaii_g - hawaii_centroid) * rot(-35 * pi/180) + hawaii_centroid + c(5200000, -1400000)
hawaii <- hawaii %>% st_set_geometry(hawaii_trans) %>% st_set_crs(st_crs(tnc_map_trans))

tnc_map_final <- tnc_map_trans %>%
  filter(!state %in% c('Alaska', 'Hawaii')) %>%
  rbind(alaska) %>%
  rbind(hawaii)
