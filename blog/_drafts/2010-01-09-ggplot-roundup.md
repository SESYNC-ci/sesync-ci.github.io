---
# DO NOT EDIT THE .md ON GITHUB
# DO EDIT THE .Rmd AND knit THE .md LOCALLY
title: ggplot tricks not to forget about
author: khondula
tags:
 - ggplot
 - dataviz
output:
  md_document:
    preserve_yaml: true
---

Tweaking figures for presentations or publications can be a tedious
process, especially when I always need a reminder on "how to use greek
letters or subscripts in y-axis", "remove legend", and "r pch". Here are
a collection of some `ggplot2` functions and arguments that I find
particularly useful and want to remember.

### Getting oriented with proper axes

Within an `xlab()` or `ylab()` function, use `expression(paste())` to
use special characters. Use brackets (`[]`) for subscript, the caret
(`^`) for superscript, and the names of greek letters e.g. `mu`.

      ylab(expression(paste("C", H[4], " (", mu,"mol ", L^-1,")"))) +
      xlab(expression(paste("DOC (mg ", L^-1,")")))

-   Customize date axes with `scale_x_date()`
-   Rotate axis labels 90 degrees and right justify using the layer
    `theme(axis.text.x = element_text(angle = 90, hjust = 1))`

### Show me the data!

-   Map aesthetics to specific shapes using `scale_shape_manual()` with
    arguments values and labels:

<!-- -->

      scale_shape_manual(values = c(21, 24), 
                         name = element_blank(),
                         labels = c("Landsat", "Sentinel2"))

-   As described in detail on the [Cookbook for
    R](http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/)
    website, vertically oriented error bars can be added to a plot using
    `geom_errorbar()`. The necessary aesthetics are `ymin` and `ymax`,
    and usually I adjust the `width` to 0.1 or 0.2. Use
    `geom_errorbarh()` with `xmin` and `xmax` for horizontal error bars
    (or rotate the whole plot with `coord_flip()`).

-   Smooth out density plot using the `adjust` argument in
    `geom_density`

-   Zoom in without losing outlier data points using `coord_cartesian()`

-   Alternatively, lose the outliers on a boxplot with
    `geom_boxplot(outlier.shape = NA)`

### Putting it all together

-   For multi-panel plots, I like to "beef up" my plots using the
    [cowplot](https://cran.r-project.org/web/packages/cowplot/index.html)
    package in R. It has an intuitive way to arrange panels and add
    annotation labels, which is described in one of the package's
    [vignettes](https://cran.r-project.org/web/packages/cowplot/vignettes/plot_grid.html).

The basic idea is to initiate an empty drawing canvas with the
`ggdraw()` function, and then determined the location and sizing of each
panel with `draw_plot()` functions.

If you have 4 ggplot objects called panel\_a, panel\_b, panel\_c, and
panel\_d, creating a 4-panel figure with labels would look something
like this:

    figure <- ggdraw() +
      draw_plot(panel_a, x = 0, y = .5, width = 0.4, height = 0.5) +
      draw_plot(panel_b, x = .4, y = .5, width = 0.6, height = 0.5) +
      draw_plot(panel_c, x = 0, y = 0, width = 0.4, height = 0.5) +
      draw_plot(panel_d, x = .4, y = 0, width = 0.6, height = 0.5) +
      draw_plot_label(label = c("a", "b", "c", "d"), x = c(0, 0.4, 0, 0.4), y = c(1,1, 0.5, 0.5), size = 15)

The arguments for the draw\_plot function are:

-   **plot**: the plot to place (ggplot2 or a gtable)
-   **x**: The x location of the lower left corner of the plot.
-   **y**: The y location of the lower left corner of the plot.
-   **width, height**: the width and the height of the plot

There is also a handy function for saving this type of plot to a file:

    save_plot("figure.png", figure, ncol = 2, nrow = 2, base_aspect_ratio = 1.3)

As I haven't determined anything particulary bovine-related in the
package, I'm pretty sure the name references the
[author's](https://github.com/clauswilke) initials.
