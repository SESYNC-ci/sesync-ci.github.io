---
# DO NOT EDIT THE .md ON GITHUB
# DO EDIT THE .Rmd AND knit THE .md LOCALLY
title: Creating visualizations with DiagrammeR
tags:
  - Visualization
  - R
author: rblake
output:   
  md_document:
    preserve_yaml: true
always_allow_html: yes
---

Have you ever needed to create a visualization of a research process or
statistical model that isn't directly plotted from data? The R package
[DiagrammeR](http://rich-iannone.github.io/DiagrammeR/index.html) makes
it much easier to create high quality figures and diagrams in situations
like these. Both Graphviz and Mermaid libraries are implemented in
DiagrammeR, and I'll give and example of each below. For
exporting/printing/saving your diagrams, the package
[DiagrammeRsvg](https://github.com/rich-iannone/DiagrammeRsvg) can be
useful.

Research provenance example
---------------------------

    library(DiagrammeR)

    grViz("digraph{
             
           graph[rankdir = LR]  
             
           node[shape = rectangle, style = filled]  
           
           node[fillcolor = Coral, margin = 0.2]
           A[label = 'Figure 1: Map']
           B[label = 'Figure 2: Metrics']
           
           node[fillcolor = Cyan, margin = 0.2]
           C[label = 'Figures.Rmd']
           
           node[fillcolor = Violet, margin = 0.2]
           D[label = 'Analysis_1.R']
           E[label = 'Analysis_2.R']
                      
           subgraph cluster_0 {graph[shape = rectangle]; 
                               style = rounded; bgcolor = Gold; 
                               label = 'Data Source 1'
                                          
                               node[shape = rectangle, fillcolor = LemonChiffon, margin = 0.25];
                               F[label = 'my_dataframe_1.csv'];
                               G[label = 'my_dataframe_2.csv']
                               }    
                               
           subgraph cluster_1 {graph[shape = rectangle]; 
                               style = rounded; bgcolor = Gold; 
                               label = 'Data Source 2'
                                          
                               node[shape = rectangle, fillcolor = LemonChiffon, margin = 0.25];
                               H[label = 'my_dataframe_3.csv'];
                               I[label = 'my_dataframe_4.csv']
                               } 
                      
           edge[color = black, arrowhead = vee, arrowsize = 1.25]
           C -> {A B}
           D -> C
           E -> C
           F -> D
           G -> D
           H -> E
           I -> E
                      
           }")

    ## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.

<!--html_preserve-->
<script type="application/json" data-for="htmlwidget-491ccdeb3dfb88d3a568">{"x":{"diagram":"digraph{\n         \n       graph[rankdir = LR]  \n         \n       node[shape = rectangle, style = filled]  \n       \n       node[fillcolor = Coral, margin = 0.2]\n       A[label = \"Figure 1: Map\"]\n       B[label = \"Figure 2: Metrics\"]\n       \n       node[fillcolor = Cyan, margin = 0.2]\n       C[label = \"Figures.Rmd\"]\n       \n       node[fillcolor = Violet, margin = 0.2]\n       D[label = \"Analysis_1.R\"]\n       E[label = \"Analysis_2.R\"]\n                  \n       subgraph cluster_0 {graph[shape = rectangle]; \n                           style = rounded; bgcolor = Gold; \n                           label = \"Data Source 1\"\n                                      \n                           node[shape = rectangle, fillcolor = LemonChiffon, margin = 0.25];\n                           F[label = \"my_dataframe_1.csv\"];\n                           G[label = \"my_dataframe_2.csv\"]\n                           }    \n                           \n       subgraph cluster_1 {graph[shape = rectangle]; \n                           style = rounded; bgcolor = Gold; \n                           label = \"Data Source 2\"\n                                      \n                           node[shape = rectangle, fillcolor = LemonChiffon, margin = 0.25];\n                           H[label = \"my_dataframe_3.csv\"];\n                           I[label = \"my_dataframe_4.csv\"]\n                           } \n                  \n       edge[color = black, arrowhead = vee, arrowsize = 1.25]\n       C -> {A B}\n       D -> C\n       E -> C\n       F -> D\n       G -> D\n       H -> E\n       I -> E\n                  \n       }","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
Adapted from a more detailed "real life" example located in this
research [data
package](https://knb.ecoinformatics.org/view/urn:uuid:64e28478-7964-4fcb-b002-49a7915fbe4e).

Structural equation model example
---------------------------------

    mermaid("
             graph BT
             A[Salinity]
                A-->B(Barnacles)
                B-.->|-0.18|B1(Mussels)
                A-- 0.31 -->B1
                
             C[Air Temp]
                C-->B
                C-.->E(Macroalgae)
                   E-->B1
                C== 0.35 ==>B1
            ")

<!--html_preserve-->
<script type="application/json" data-for="htmlwidget-62767127313e6ce806e6">{"x":{"diagram":"\n         graph BT\n         A[Salinity]\n            A-->B(Barnacles)\n            B-.->|-0.18|B1(Mussels)\n            A-- 0.31 -->B1\n            \n         C[Air Temp]\n            C-->B\n            C-.->E(Macroalgae)\n               E-->B1\n            C== 0.35 ==>B1\n        "},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
Klinger & Blake (in prep.)
