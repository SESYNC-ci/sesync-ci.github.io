---
title: Making dataspice at runconf
category: blog
tags:
  - dataviz
  - R
  - shiny
author: khondula
---

as part of being an ropensci fellow, I got the privilege to attend ropensci's 5th 'unconference'. this event brought together some really great people from around the world to spend a few days coding up some new R tools based on ideas discussed leading up to the event. 

I joined up with the [dataspice](https://github.com/ropenscilabs/dataspice) team, which was based on [Anna Krystalli's suggestion](https://github.com/ropensci/unconf18/issues/72) of creating something that makes it super easy to generate a minimal amount of metadata about a dataset. Adhering to standards like EML undoubtedly add a lot of value to datasets, and help support the search functionality of repositories like dataone nodes and the environmental data initiative, but ... create something more flexible and easy to use across any type of dataset. 

google's description of a dataset [guidelines](https://developers.google.com/search/docs/data-types/dataset) that could potentially let datasets be searchable through google and generate a little "card" that shows up with search results like when you search for a [local business](https://developers.google.com/search/docs/data-types/local-business). 

this is powered by the json "linked data" format, which is a structured data format that allows for describing things with varying levels of detail. 

google adopts the definition of a dataset from [schema.org](schema.org) and suggests a minimal number of categories that should describe a dataset, such as a title, description, keywords, and spatial and temporal coverage. But because even google doesn't have a bounded definition of what a dataset is, the only "required" detail is identifying the "@type" property as a dataset, and giving it a name and description. 

google's documentation says that name and description are required, but even just having a name is a valid dataset! according to the [structured data testing tool](https://search.google.com/structured-data/testing-tool) 

```
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Dataset",
  "name":"my data"
}
</script>
```

we wanted the tool to be able to generate this minimal metadata for tabular data, such as a csv file or a folder of csv files. 
"the simplest metadata tool, you only need to fill out these 5 spreadsheets!"

so we trimmed it down to 4!

although we couldn't automate the whole process, we wanted to make it as easy as possible to go from data files to the json-ld format, which could then be used to make a nice webpage, "card" [example](https://cboettig.github.io/dataspice-web/), or build off of to make more in-depth metadata like EML or DarwinCore. 

we envisioned a workflow where someone has a folder of csv files that they want to make metadata about. after installing our R package, they `create_spice()`, fill out information using some helper functions or interactively with a shiny app, and then `write_spice()` to make the json file, and `build_site()` to make html.

head over to the [github repo](https://github.com/ropenscilabs/dataspice) for more details and to try it out! 

[all projects link](https://ropenscilabs.github.io/runconf18-projects/)