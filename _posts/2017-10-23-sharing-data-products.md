---
category: quickstart
tags:
  - data
  - reproducible-research
---

# {{ page.title }}

## Introduction

Choosing to put your data products in a long-term repository can:

1.	let others find and access your dataset
1.	provide a permanent uniquely identifiable code (DOI) for citing your dataset
1.	enable re-use and greater visibility of your work

Data repositories vary in many ways including their specificity of topics and data types, requirements for submission, the types and formats of data they will accept, and level of curation. In general, you should put your data where there are other similar types of data. For heterogeneous & interdisciplinary datasets, this might mean considering a generic rather than domain-specific repository, or considering different options for various components of your synthesized dataset. Your synthesis data products may span interest of many disciplines so a discipline-specific repository may not be the correct place, or portions of your synthesis project data products may go to different places with formal or informal reference to other data repositories.

SESYNC’s Cyberinfrastructure team is ready to help you navigate this landscape and find appropriate solutions to make your data products accessible in the long term, discoverable, and citable. We can help you determine: 

**link to blog/quickstart page on writing data management plans**

## Choosing a repository

> Generic repositories are flexible and accept many forms of data

[Dryad](http://datadryad.org/) is one of several generic data repositories that is very flexible and can accept many forms of data, for a base charge of $120 for datasets under 20 GB. The [Harvard Dataverse](https://dataverse.harvard.edu/) is another generic data repository that accepts individual files up to 2.5 GB and datasets up to 10 GB. 

> Domain-specific repositories cover a narrower range of data but can offer more intense data curation based on similar types of data formats and workflows.

Although any dataset should have comprehensive metadata to aid interpretation, domain-specific repositories often require adherence to standards for file formats and/or metadata, such as [Ecological Metadata Language](https://knb.ecoinformatics.org/) used by the ecology-focused [Knowledge Network for Biodiversity](https://knb.ecoinformatics.org/) or [Darwin Core] (http://rs.tdwg.org/dwc/) for biodiversity data. 
                                                                                 
## Publication format

> Datasets can be the focus of a publication or released in support of a publication. 

Datasets that support manuscripts are traditionally considered Supplementary Material contained in online appendices. You may also consider a peer-reviewed data publication which focuses on a thorough description of the dataset and how it was constructed, rather than analysis. Several journals specialize in data publications such as [Scientific Data](http://www.nature.com/sdata/), and [Earth System Science Data](http://www.earth-system-science-data.net/), whereas other journals have specialized article formats for this type of manuscript, such as [Ecology data papers](http://esajournals.onlinelibrary.wiley.com/hub/journal/10.1002/(ISSN)1939-9170/resources/data_paper_inst_ecy.html). 
                                                                                Other papers may feature or describe the details of a database including its organization, development, and how to access it without any formal identification as a data publication. In all cases, the dataset and publication should be cross-referenced so each is easily accessible and discoverable from the other. The database described can vary from a single file available for download to a query-able and interactive interface. 
                                                                                ## examples

1. A queryable interactive database - Marine Socio-Environmental correlates: https://shiny.sesync.org/apps/msec/ 

1. Journal article describing database (R data object) (are there any example databases where contributions are made through pull requests?) - http://onlinelibrary.wiley.com/doi/10.1111/1365-2745.12334/abstract,	http://www.compadre-db.org/Data/Compadre 

1. Journal article describing a database and corresponding dataset (multiple CSV files, in LTER repository) - http://onlinelibrary.wiley.com/doi/10.1890/15-1027/full, https://lter.limnology.wisc.edu/dataset/global-database-methane-concentrations-and-atmospheric-fluxes-streams-and-rivers 

## What to publish

> Publishing data vs. model code or data processing steps?

If the products of your synthesis work are software/models, or use datasets that already exist in public repositories, it may be more appropriate to archive your computer code instead of (or in addition to) datasets. Some types of models may have specialized repositories, such as Open ABM (https://www.openabm.org/models) for agent-based models. Code for a processing public datasets and/or running a model can be hosted on Github with unique identifiers assigned to releases of the repository through Zenodo (https://guides.github.com/activities/citable-code/) such as acquiring and processing FAO data to use in a network model (https://github.com/SESYNC-ci/cereals-network-shocks).

## Qualitative data

*Qualitative Data Repository description and example*

## Using publicly available data

> We used all or almost all publicly available data sources – should they still be archived?

## Further reading  
  
### Repository repositories

1. Data ONE is a federation of data repositories that supports easy discovery of and access to environmental and Earth science data, as well as various data management tools and educational resources. member nodes listed at (https://www.dataone.org/current-member-nodes)

1. Registry of Research Data Repositories (http://www.re3data.org/) 

### Resources and tools

1. Ecological Society of America: https://www.esa.org/esa/science/data-sharing/resources-and-tools/

1. United States Geological Survey: https://www2.usgs.gov/datamanagement/index.php 

1. Oak Ridge National Laboratory: https://daac.ornl.gov/PI/archive.shtml (document: https://daac.ornl.gov/PI/BestPractices-2010.pdf) 

1. White, E.P., Baldridge, E., Brym, Z.T., Locey, K.J., McGlinn, D.J. and Supp, S.R., 2013. Nine simple ways to make it easier to (re) use your data. Ideas in Ecology and Evolution, 6(2). http://ojs.library.queensu.ca/index.php/IEE/article/view/4608 
