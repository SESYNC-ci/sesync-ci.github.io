---
title: Beef up your plots with cowplot
category: blog
tags:
  - dataviz
  - R
---

# {{ page.title }}

for multi-panel plots

https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html

`draw_plot(plot, x = 0, y = 0, width = 1, height = 1)`

* plot: the plot to place (ggplot2 or a gtable)
* x: The x location of the lower left corner of the plot.
* y: The y location of the lower left corner of the plot.
* width, height: the width and the height of the plot

The function ggdraw() is used to initialize an empty drawing canvas.

```
figure <- ggdraw() +
  draw_plot(h_biodiv, x = 0, y = .5, width = 0.4, height = 0.5) +
  draw_plot(dist_biodiv, x = .4, y = .5, width = 0.6, height = 0.5) +
  draw_plot(h_biogeo, x = 0, y = 0, width = 0.4, height = 0.5) +
  draw_plot(dist_biogeo, x = .4, y = 0, width = 0.6, height = 0.5) +
  draw_plot_label(c("a", "b", "c", "d"), c(0, 0.4, 0, 0.4), c(1,1, 0.5, 0.5), size = 15)

save_plot("figure.png", figure, ncol = 2, nrow = 2, base_aspect_ratio = 1.3)
```