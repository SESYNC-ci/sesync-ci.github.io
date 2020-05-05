---
title: "Oh, the Places You Can Get Census Population Data For!"
tags:
 - data
author: khondula
---

Every 10 years, the U.S. Census Bureau conducts a nationwide survey to count the number of people in the country, which is known as The Decennial Census. Although seemingly a straightforward concept, using these data to appropriately quantify population change for any given location within the country may require getting acquainted with some nuanced jargon. This blog is to introduce some concepts to help you get started. 


![oh-places](/assets/images/oh-places.jpg =100px)


## Census geographies

Check out the diagram of geographic relationships to see how different spatial units relate to each other. 

![census-geog-relationships](/assets/images/census-geog.jpg)

Although there is a strictly nested hierarchy between blocks, tracts, counties, etc., there are also almost twice as many(!) other named spatial scales either defined by or recognized by the Census that don't fall neatly into that structure. Cities, for example, can span state boundaries, and Places that fall under the jurisdiction of a governing body may contain portions of one or more county. 

Spatial data defining these regions is available on the [Census website](https://www.census.gov/geographies/mapping-files.html) along with a [guide](https://www.census.gov/programs-surveys/geography/guidance/tiger-data-products-guide.html) on the various products available through the Topologically Integrated Geographic Encoding and Referencing division -- a.k.a TIGER shapefiles. 

You can programmatically download these data from the Census [FTP site](https://www2.census.gov/geo/tiger/), for example to download and unzip the files for 2019 Core-based statistical areas:

```
wget -r -np zip ftp://ftp2.census.gov/geo/tiger/TIGER2019/CBSA/
  find . -name "*.zip" -exec unzip {} -d CBSA \;
```

Keep in mind that the number, names, and spatial extent of these areas change over time. For detailed information on individual changes, check out [Geographic Boundary Change Notes](https://www.census.gov/programs-surveys/geography/technical-documentation/boundary-change-notes.html). Look [here](https://www.census.gov/content/dam/Census/data/developers/understandingplace.pdf "understanding place primer") for a primer on understanding what a Place is and how it is defined according to the census.

These spatial data are also available as a Web Mapping Service, which means they can be added to custom maps e.g. [Leaflet](https://leafletjs.com/) with the folliwing

https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_wms.html

## Intercensal data

Although the official population count occurs only every 10 years, the census calculates estimates of populations for the between years. These intercensal datasets are provided through the [Population and Housing Unit Estimates](https://www.census.gov/programs-surveys/popest/data/tables.html) program, and are listed separately for the years 2000-2010 and 2010-2018. Note that some data for some levels are only available starting after 2010. In addition to just population numbers, these [datasets](https://www.census.gov/data/tables/time-series/demo/popest/2010s-total-metro-and-micro-statistical-areas.html) also include information about the components of change such as number of births and deaths, net domestic and internation migration. 

| Level  | Description | years |
|--------|-------------|-------|
| 040    | States | 2000&ndash;2010, 2010&ndash;2019 |
| 050    | Counties | 2000&ndash;2010, 2010&ndash;2019 |
| 061    | Minor civil division | 2000&ndash;2010, 2010&ndash;2019 |
| 071    | Minor civil division place part | 2000-2010, 2010&ndash;2019 |
| 157    | County place part | 2000&ndash;2010, 2010&ndash;2019 |
| 162    | Incorporated place | 2000&ndash;2010, 2010&ndash;2019 |
| 170    | Consolidated city | 2010&ndash;2019 |
| 172    | Consolidated city&mdash;place within consolidated city | 2010&ndash;2019 |
| 310    | Metropolitan/Micropolitan Statistical Area | 2000, 2010&ndash;2019 |
| 314    | Metropolitan Division | 2010&ndash;2019 |
| 330    | Combined statistical area | 2010&ndash;2019 |


## Resources

* [Population estimates Terms and Definitions](https://www.census.gov/programs-surveys/popest/guidance-geographies/terms-and-definitions.html)
* [Population estimates FAQ](https://www.census.gov/programs-surveys/popest/about/faq.html)
* [TIGERWEB](https://tigerweb.geo.census.gov/tigerweb/)
* R packages by Kyle Walker: [tidycensus](http://walker-data.com/tidycensus/) and [tigris](https://github.com/walkerke/tigris)
