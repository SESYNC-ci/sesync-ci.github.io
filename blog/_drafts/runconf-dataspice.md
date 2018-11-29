---
title: Making dataspice at runconf
tags:
  - Metadata
  - R
  - Reproducible Research
  - Data
author: khondula
---

As a perk of being an [rOpenSci](https://ropensci.org/) fellow, I recently got to attend the organization's 5th 'unconference'. This meeting brought together around 60 R users from around the world to spend a few days cooking up some new tools for the R community based on ideas discussed online leading up to the event. 

I joined up with the metadata team, and in 2 days we produced the beginnings of the [dataspice](https://github.com/ropenscilabs/dataspice) package. This was based on [Anna Krystalli's suggestion](https://github.com/ropensci/unconf18/issues/72) that there should be a way to create a minimal amount of useful metadata that both adheres to standards but is intuitively easy to use and widely applicable. Although creating metadata based on domain standards like [Ecological Metadata Language](https://knb.ecoinformatics.org/#external//emlparser/docs/index.html) undoubtedly adds a lot of value to datasets, such as supporting the search functionality of curated repositories, it requires considerable time to get familiar with the language and implement it successfully. 

We started looking into Google's specification of a [Dataset](https://developers.google.com/search/docs/data-types/dataset), which would be a lowest common denominator of metadata that could support search and discovery of datasets regardless of what they are about or what repository they end up in (if any!). Google adopts their definition from [schema.org](http://schema.org/Dataset) and recommends a minimal number of those properties that should describe a dataset, such as a title, description, keywords, variable measured, and spatial and temporal coverage. But because even Google doesn't have a bounded definition of what a dataset is, it seems like the only required detail is identifying the "@type" property as a dataset, and providing a name. So, at the minimum, our package would need to produce a [json-ld](https://json-ld.org/) file that looks something like this:

```
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Dataset",
  "name":"My dataset"
}
</script>
```

For a tabular dataset (e.g. `csv` or `tsv` files), some key elements of the metadata are human readable descriptions of what is in each column, and what units numeric data are in. For our framework, these translate to the dataset's [measured variable](http://pending.webschemas.org/variableMeasured) properties, which themselves can have properties of type (such as text or number), unit, and description.  

Although we couldn't automate the whole process, we wrote functions that create the metadata structure for a given set of data files. These templates are a few spreadsheets that can be filled in manually or with some helper functions or a Shiny app. 

Once the information is filled in, `dataspice` will slot it into a properly formatted json file, and then create a summary [webpage](https://amoeba.github.io/dataspice-example/) or [card](https://cboettig.github.io/dataspice-web/) about the "spiced" dataset. This information could also later be used to help automate the creation of more in-depth metadata like EML. 

Head over to our [GitHub repo](https://github.com/ropenscilabs/dataspice) for more details and to try it out! 

Check out descriptions and code for all of the other unconference projects on **ropenscilabs** [GitHub](https://ropenscilabs.github.io/runconf18-projects/). 
