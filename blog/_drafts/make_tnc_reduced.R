library(tidyverse)

# Use NLCD weighting for domestic, global crop/pasture datalayers weighting for foreign
nlcd_county_tnc <- read_csv('data/raw_data/landuse/output_csvs/NLCD_2016_countyTNC.csv', col_types = "ncccccccnncnccncncccnccccccncnnnnnnnnnnnnnnnnn")
nlcd_county_tnc_hi <- read_csv('data/raw_data/landuse/output_csvs/HI_NLCD_2001_countyTNC.csv', col_types = "ncccccccnncnccncncccnccccccncnnnnnnnnnnnnnn")
nlcd_county_tnc_ak <- read_csv('data/raw_data/landuse/output_csvs/AK_NLCD_2016_countyTNC.csv', col_types = "ncccccccnncnccncncccnccccccncnnnnnnnnnnnnnnnnnnnn")

# Fill in the Alaska and Hawaii rows: get rid of AK and HI from main df, retain only AK and HI from smaller ones,
# and then bind rows together.
nlcd_county_tnc <- nlcd_county_tnc %>% filter(!fips_state %in% c('02', '15'))
nlcd_county_tnc_hi <- nlcd_county_tnc_hi %>% filter(fips_state %in% c('15'))
nlcd_county_tnc_ak <- nlcd_county_tnc_ak %>% filter(fips_state %in% c('02'))

ak_eco <- unique(nlcd_county_tnc_ak$ECO_CODE)
hi_eco <- unique(nlcd_county_tnc_hi$ECO_CODE)


library(sf)
tncusa <- st_read('/nfs/qread-data/raw_data/landuse/ecoregions/tnc_usa.gpkg')

# Select only necessary columns and add state ID column (Alaska, Hawaii, lower48)

tncusa <- tncusa[, c('ECO_CODE', 'ECO_NAME')]

tncusa$state <- 'lower48'
tncusa$state[tncusa$ECO_CODE %in% ak_eco] <- 'Alaska'
tncusa$state[tncusa$ECO_CODE %in% hi_eco] <- 'Hawaii'

# Remove the "Northwestern Hawaii Scrub" area so that we don't have little outlying islands
tncusa <- tncusa[!tncusa$ECO_NAME %in% 'Northwestern Hawaii Scrub', ]

st_write(tncusa, '/nfs/public-data/tnc_ecoregions_usa.gpkg', driver = 'GPKG')