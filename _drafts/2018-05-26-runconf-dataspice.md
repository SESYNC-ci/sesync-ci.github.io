---
title: Making dataspice at runconf
category: blog
tags:
  - metadata
  - R
  - reproducible-research
  - data
author: khondula
---

As a perk of being an [rOpenSci](https://ropensci.org/) fellow, I got the privilege to attend the organization's 5th 'unconference' last week. This meeting brought together a few dozen software developers, students, and all kinds of other R users from around the world to spend a few days cooking up some new tools based on ideas discussed online leading up to the event. 

I joined up with the [dataspice](https://github.com/ropenscilabs/dataspice) team, which was based on [Anna Krystalli's suggestion](https://github.com/ropensci/unconf18/issues/72) that there should be an easier way to create useful amount of metadata that adheres to standards but is still relatively intuitive. Although adhering to domain standards like [Ecological Metadata Language](https://knb.ecoinformatics.org/#external//emlparser/docs/index.html) undoubtedly adds a lot of value to datasets, such as supporting the search functionality of curated repositories like DataOne nodes, it requires some time investment to get familiar with the language and implement it successfully. 

We started out trying to determine what a minimal (useful) level of metadata might be, regardless of what repository a dataset ends up in (as long as it's online). This led us to Google's (in progress) description of a [Dataset](https://developers.google.com/search/docs/data-types/dataset). 

Google adopts the definition of a dataset from [schema.org](schema.org) and suggests a minimal number of categories that should describe a dataset, such as a title, description, keywords, variable measured, and spatial and temporal coverage. But because even google doesn't have a bounded definition of what a dataset is, the only "required" detail is identifying the "@type" property as a dataset, and giving it a name and description. 

caption: google's documentation says that name and description are required, but even just having a name is a valid dataset! according to the [structured data testing tool](https://search.google.com/structured-data/testing-tool) 

```
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Dataset",
  "name":"my data"
}
</script>
```


that could potentially let datasets be searchable through google and generate a little "card" that shows up with search results like when you search for a [local business](https://developers.google.com/search/docs/data-types/local-business). Try searching for "storm events data". 

this is powered by the json "linked data" format, which is a structured data format that allows for describing things with varying levels of detail. 

we wanted the tool to be able to generate this minimal metadata for tabular data, such as a csv file or a folder of csv files. After grouping the metadata categories and thinking about how someone might use our package, we realized that the idea of having "the simplest metadata tool" was a not going to work if "all" someone needed to do was fill out these 5 spreadsheets!" so we trimmed it down to 4!

although we couldn't automate the whole process, we wanted to make it as easy as possible to go from data files to the json-ld format, which could then be used to make a summary [webpage](https://github.com/ropenscilabs/qcoder) or "card" [example](https://cboettig.github.io/dataspice-web/), or build off of to make more in-depth metadata like EML or DarwinCore. 

we envisioned a workflow where someone has a folder of csv files that they want to make metadata about. after installing our R package, they `create_spice()`, fill out information using some helper functions or interactively with a shiny app, and then `write_spice()` to make the json file, and `build_site()` to make html. By the end of day 2 we had the basic functionality for most of these components, and a host of ideas for how to improve them. 

head over to the [github repo](https://github.com/ropenscilabs/dataspice) for more details and to try it out! 

Check out all of the projects from the unconf [here](https://ropenscilabs.github.io/runconf18-projects/)