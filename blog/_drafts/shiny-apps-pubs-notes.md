# publishing shiny apps

post on *sharing* shiny apps: https://cyberhelp.sesync.org/blog/shiny-sharing.html

RShiny applications are sometimes included in published papers for readers to interact with data, models, and visualizations presented in the manuscript. Other manuscripts present applications or decision support tools as the main focus of the paper. 

In either case, the longevity of the app's web-hosting platform should be considered whenever including a URL web link in a manuscript to ensure continued accessibility and functionality. Websites associated with individuals, lab groups, university deparatments, etc. are subject to periodic reorganization and therefore links in published papers will inevitably become inactive without ongoing maintenance. Even if a link to an app remains active, as underlying infrastructure of a given platform updates there is no guarantee that an app will continue to function--or function in the same way--with new software versions. 

* This [post](https://community.rstudio.com/t/can-i-publish-a-shiny-app-in-a-scientific-journal-how-where/6306/3
) on RStudio's forum has some discussion about publishing shiny apps in scientific journals. Suggestions include:

> *My understanding is that most journals are text/image based and so would not support serving responsive content or Web Apps. A Shiny App is just like any other Web App, and so requires a "backend" / server side component, as well as the client-side JavaScript/HTML. At very least, I'm sure you could include the code in your paper, a link to the app if hosted elsewhere on ShinyApps.io , or a link to the github repo where your code is stored. The iframe might be an option, as I mentioned earlier, but I can think of a few reasons journals may not allow that behavior.*

> *The advice I'd give you depends on what you want to achieve. Do you want something to help readers of the paper explore the results, or do you want something to help non-readers (stakeholders, the public) digest them? ... If you want something that'll help the public or stakeholders understand, or something to help put a spotlight on the paper, I'd skip Shiny entirely and use htmlwidgets.* 

> *You can upload your app to github, connect zenodo (https://zenodo.org/ ), make a release on GtiHub and get DOI from zenodo*

One user also posted a [link](https://www.software.ac.uk/which-journals-should-i-publish-my-software) to a list of journals that publish software such as Journal of Open Source Software, Methods in Ecology and Evolution, and Environmental Modeling and Software however note that some article types in journals have changed since that was published (e.g. Nature's Toolbox, EMS short communications).

The University of Oxford has a service available to researchers called [The Interactive Data Network](https://oxshef.github.io/oxshef_shiny/idn_info.html) that provides and maintains an insitutional shinyapps.io subsscription. This service requires apps have data hosted in a DOI-issuing repository and app code deposited in a DOI-issuing repository. There is a 3 year cycle for supporting apps and a process for retiring them described on the website. 

## Some examples of papers with Shiny apps

1. Futre Urban Climates web application (Matt fitzpatrick paper in Nature Communications) - originally published at http://shiny.al.umces.edu/FutureCities.html, which now has a redirect page to the live app at: https://fitzlab.shinyapps.io/cityapp/ as well as a link to the paper. The first link was a redirect from a tinyurl link in the paper. 

> *Therefore, in supplement to the summaries presented here, we developed an online, interactive web application (https:// tinyurl.com/urbanclimate) that allows the general public, educa- tors, decision makers, and stakeholders to explore in greater detail [...]*


1. This [article](https://peerj.com/articles/589/) in PeerJ has an app that lets readers interact with data from the paper. The article was published in October 2014 and in July 2015 a correction to the article was published updating the app link from http://glimmer.rstudio.com/afisher/EDA/ to a currently active link at shinyapps.io. (linked from rstudio community post)

1. [Tracking the pulse of the Earth’s fresh waters](https://www-nature-com.proxy-um.researchport.umd.edu/articles/s41893-018-0047-7) links to this app on SESYNC's shiny server: https://shiny.sesync.org/apps/gages/ that is still active. Unsure how it is referenced in original article. There is an "About" tab on the app that includes links to the paper, study source code, map source code, and app developer's email address. 

1. Marine Socio-Environmental Correlates website - data paper published in Ecology (Lauren yeager work)

1. Article [Translating statistical species-habitat models to interactive decision support tools](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0188244) - links to active app hosted on shinyapps.io, which includes an About tab that has a citation for the app, and links to the paper and a github repo. The paper's data availability statement also links to their github repo. 

## Recommendations

Loosely following the model/criteria of Oxford's IDN, where hosted apps must have DOIs for both underlying data and underlying code. DOIs for code can be obtained for releases of GitHub repos using Zenodo. 

Also provide advice about a well-structured "About" tab and what should at minimum be included? 

Currently we have a SESYNC-themed design for shiny apps but perhaps only the MSEC app is using it.  

