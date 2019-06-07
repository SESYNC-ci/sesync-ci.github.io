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

Tweaking figures for presentations or publications can be a tedious process, especially when I always need a reminder on "how to use greek letters or subscripts in y-axis", "remove legend", and "r pch". Here are a collection of some `ggplot2` functions and arguments that I find particularly useful and want to remember. 

### Special text in axis labels

Within an `xlab()` or `ylab()` function, use `expression(paste())` to use special characters. Use brackets (`[]`) for subscript, the caret (`^`) for superscript, and the names of greek letters e.g. `mu`. 


```r
  ylab(expression(paste("C", H[4], " (", mu,"mol ", L^-1,")"))) +
  xlab(expression(paste("DOC (mg ", L^-1,")")))
```

### Error bars

As described in detail on the [Cookbook for R](http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/) website, vertically oriented error bars can be added to a plot using `geom_errorbar()`. The necessary aesthetics are `ymin` and `ymax`, and usually I adjust the `width` to 0.1 or 0.2. Use `geom_errorbarh()` with `xmin` and `xmax` for horizontal error bars (or rotate the whole plot with `coord_flip()`).

### Rotating axis labels


```r
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
```

### Dealing with outliers

Zoom in without losing data points using `coord_cartesian()`

`geom_boxplot(outlier.shape = NA)` to not show points 

### Date axes

`scale_x_date()`

### Plotting characters

Map aesthetics to specific shapes using `scale_shape_manual()`


```r
  scale_shape_manual(values = c(21, 24), 
                     name = element_blank(),
                     labels = c("Landsat", "Sentinel2"))
```

### Smooth out density plot

`adjust` argument in `geom_density` smooths out density plot

`geom_density(adjust = 2)`
