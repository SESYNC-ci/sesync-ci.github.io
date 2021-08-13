# Map of locations of participants in the 2021csi
# Time zone map downloaded from https://datashare.ed.ac.uk/handle/10283/2521
# Quentin D. Read, 13 August 2021

# Geocoding ---------------------------------------------------------------

locations <- c('Annapolis, Maryland', 'Bangor, Wales', 'Berkeley, California', 'Costa Rica', 'Durham, North Carolina', 'Honolulu, Hawaii', 'Princeton, New Jersey', 'Tampa, Florida', 'Orlando, Florida', 'Corvallis, Oregon', 'Lancaster, England', 'Tempe, Arizona', 'Fairbanks, Alaska', 'Montreal, Quebec', 'Vancouver, British Columbia', 'Seattle, Washington', 'Reston, Virginia', 'College Station, Texas')

library(tmaptools)

nominatim_loc_geo <- geocode_OSM(locations,
                                 details = FALSE, as.data.frame = TRUE)

write.csv(nominatim_loc_geo, '~/temp/csi_locations.csv', row.names = FALSE)

# Make map ----------------------------------------------------------------

library(sf)
library(ggplot2)

locations <- read.csv('~/temp/csi_locations.csv') %>%
  st_as_sf(coords = c('lon', 'lat'), crs = 4326)

tzmap <- st_read(dsn = '/nfs/qread-data/timezones')

fivecolors <- RColorBrewer::brewer.pal(5, 'Dark2')
n_tz <- nlevels(factor(tzmap$UTC_OFFSET))

p <- ggplot() +
  geom_sf(data = tzmap, aes(fill = UTC_OFFSET), size = 0.25, alpha = 0.75) +
  geom_sf(data = locations) +
  coord_sf(crs = '+proj=robin') +
  scale_fill_manual(values = rep_len(fivecolors, n_tz)) +
  theme_bw() +
  theme(legend.position = 'none',
        panel.border = element_blank())

ggsave('~/temp/csi2021map.png', p, height = 3, width = 5, dpi = 400)
