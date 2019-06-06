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
statistical model that isn’t directly plotted from data? For example, a
conceptual diagram, mind map, flowchart of your research process, or
statistical model diagram. The R package
[DiagrammeR](http://rich-iannone.github.io/DiagrammeR/index.html) makes
it much easier to create high quality figures and diagrams in situations
like these.

There are three main ways to use the DiagrammeR package.

1.  The package contains R functions that help you [create a
    diagram](http://rich-iannone.github.io/DiagrammeR/graph_creation.html).
    These include `create_graph` for defining the structure of your
    diagram, and `render_graph` for printing your diagram in the RStudio
    viewer. With `render_graph` you can also output your graph in DOT
    (graph description language).

2.  DOT is also used by [Graphviz](https://www.graphviz.org/), which is
    implemented in DiagrammeR. Diagrams specified with Graphviz must
    pass a valid diagram specification in DOT to the function `grViz()`.
    At the minimum, you will need graph, node, and edge statements (see
    example below).

3.  The [mermaid](https://mermaidjs.github.io/) library is also
    implemented in DiagrammeR. Diagrams specified with mermaid must pass
    a valid diagram specification to the function `mermaid()`. You must
    begin by specifying `graph` in this function (see example below).

For exporting/printing/saving your diagrams, the package
[DiagrammeRsvg](https://github.com/rich-iannone/DiagrammeRsvg) can be
useful. You can also use the Export functionality in RStudio to save
graphs.

    library(DiagrammeR) ; library(DiagrammeRsvg) ; library(rsvg) 

    ## Registered S3 methods overwritten by 'ggplot2':
    ##   method         from 
    ##   [.quosures     rlang
    ##   c.quosures     rlang
    ##   print.quosures rlang

example using DiagrammeR functions
----------------------------------

A simple diagram:

    # define nodes dataframe
    nodes <- create_node_df(n = 4, 
                            type = "lower",
                            style = "filled",
                            color = "teal", 
                            shape = "circle", 
                            data = c(3.5, 2.6, 9.4, 2.7))

    # define edges datagrame
    edges <- create_edge_df(from = c(1, 2, 3, 3),
                            to = c(2, 4, 4, 2))

    # create graph
    my_graph <- create_graph(nodes_df = nodes, edges_df = edges)

    # print graph
    render_graph(my_graph)

    ## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-dc04d42f6ae55eefae02">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [style = \"filled\", color = \"teal\", shape = \"circle\", fillcolor = \"#F0F8FF\", fontcolor = \"#000000\"] \n  \"2\" [style = \"filled\", color = \"teal\", shape = \"circle\", fillcolor = \"#F0F8FF\", fontcolor = \"#000000\"] \n  \"3\" [style = \"filled\", color = \"teal\", shape = \"circle\", fillcolor = \"#F0F8FF\", fontcolor = \"#000000\"] \n  \"4\" [style = \"filled\", color = \"teal\", shape = \"circle\", fillcolor = \"#F0F8FF\", fontcolor = \"#000000\"] \n  \"1\"->\"2\" \n  \"2\"->\"4\" \n  \"3\"->\"4\" \n  \"3\"->\"2\" \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
    # export graph
    export_graph(my_graph, file_name = "simple.png",
                 file_type = "PNG")

Research provenance example using Graphviz
------------------------------------------

I’ve found it easiest and most customizable to create diagrams using
Graphviz.

A simple diagram:

    my_graph2 <- grViz("digraph{
             
                       graph[rankdir = LR]  
             
                       node[shape = rectangle, style = filled]  
                       A[label = 'Figure']
                       B[label = 'Analysis.R']
                       C[label = 'Data.csv']

                       edge[color = black]
                       B -> A
                       C -> B

                       }")

    # export graph
    export_svg(my_graph2) %>% charToRaw() %>% rsvg() %>% png::writePNG("simple_grv.png")  

A more complex diagram, specifying different colors for some nodes, and
using subgraph clustering.

    my_graph3 <- grViz("digraph{
             
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

    # export graph
    export_svg(my_graph3) %>% charToRaw() %>% rsvg() %>% png::writePNG("example_grv.png")  

Adapted from a more detailed “real life” example located in this
research [data
package](https://knb.ecoinformatics.org/view/urn:uuid:64e28478-7964-4fcb-b002-49a7915fbe4e).

Structural equation model example using mermaid
-----------------------------------------------

It’s also pretty easy to create diagrams in mermaid, but it seems
slightly less customizable. It also not currently possible to export a
diagram created in mermaid to a static file (ex: svg, png). If you need
to create a figure for publication, for example, it may be best to use
the Graphviz implementation above.

A simple diagram:

    my_graph4 <- mermaid("
                         graph LR
                         A[Nutrients]
                         A-->B[Phytoplankton]
                         B-->B1[Mussels]
                         ")
    my_graph4

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-a2537076f348a35e552d">{"x":{"diagram":"\n                     graph LR\n                     A[Nutrients]\n                     A-->B[Phytoplankton]\n                     B-->B1[Mussels]\n                     "},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
A more complex diagram specifying colors and shapes for nodes, and
labels for edges.

    my_graph5 <- mermaid("
                         graph BT
                         A((Salinity))
                            A-->B(Barnacles)
                            B-.->|-0.10|B1{Mussels}
                            A-- 0.30 -->B1
                           
                         C[Air Temp]
                            C-->B
                            C-.->E(Macroalgae)
                               E-->B1
                            C== 0.89 ==>B1

                            style A fill:#FFF, stroke:#333, stroke-width:4px
                            style B fill:#9AA, stroke:#9AA, stroke-width:2px
                            style B1 fill:#879, stroke:#333, stroke-width:1px
                            style C fill:#ADF, stroke:#333, stroke-width:2px
                            style E fill:#9C2, stroke:#9C2, stroke-width:2px
                            
                         ")

    my_graph5

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-160332ca76b49c6f16db">{"x":{"diagram":"\n                     graph BT\n                     A((Salinity))\n                        A-->B(Barnacles)\n                        B-.->|-0.10|B1{Mussels}\n                        A-- 0.30 -->B1\n                       \n                     C[Air Temp]\n                        C-->B\n                        C-.->E(Macroalgae)\n                           E-->B1\n                        C== 0.89 ==>B1\n\n                        style A fill:#FFF, stroke:#333, stroke-width:4px\n                        style B fill:#9AA, stroke:#9AA, stroke-width:2px\n                        style B1 fill:#879, stroke:#333, stroke-width:1px\n                        style C fill:#ADF, stroke:#333, stroke-width:2px\n                        style E fill:#9C2, stroke:#9C2, stroke-width:2px\n                        \n                     "},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
Adapted from Klinger & Blake (in prep.)
