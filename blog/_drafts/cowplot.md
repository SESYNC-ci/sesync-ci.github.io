---
title: Beef up your plots with cowplot
tags:
  - Vizualization
  - R
author: khondula
---

For multi-panel plots, I like to use the [cowplot](https://cran.r-project.org/web/packages/cowplot/index.html) package in R. It has an intuitive way to arrange panels and add annotation labels, which is described in one of the package's [vignettes](https://cran.r-project.org/web/packages/cowplot/vignettes/plot_grid.html). 

The basic idea is to initiate an empty drawing canvas with the `ggdraw()` function, and then determined the location and sizing of each panel with `draw_plot()` functions. 

If you have 4 ggplot objects called panel_a, panel_b, panel_c, and panel_d, creating a 4-panel figure with labels would look something like this:

```
figure <- ggdraw() +
  draw_plot(panel_a, x = 0, y = .5, width = 0.4, height = 0.5) +
  draw_plot(panel_b, x = .4, y = .5, width = 0.6, height = 0.5) +
  draw_plot(panel_c, x = 0, y = 0, width = 0.4, height = 0.5) +
  draw_plot(panel_d, x = .4, y = 0, width = 0.6, height = 0.5) +
  draw_plot_label(label = c("a", "b", "c", "d"), x = c(0, 0.4, 0, 0.4), y = c(1,1, 0.5, 0.5), size = 15)
```
The arguments for the draw_plot function are: 

* **plot**: the plot to place (ggplot2 or a gtable)
* **x**: The x location of the lower left corner of the plot.
* **y**: The y location of the lower left corner of the plot.
* **width, height**: the width and the height of the plot

There is also a handy function for saving this type of plot to a file: 

```
save_plot("figure.png", figure, ncol = 2, nrow = 2, base_aspect_ratio = 1.3)
```

As I haven't determined anything particulary bovine-related in the package, I'm pretty sure the name references the [author's](https://github.com/clauswilke) initials. 
