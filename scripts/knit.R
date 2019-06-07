#!/usr/bin/env Rscript
require(methods)
require(knitr)
require(yaml)
require(stringr)

opts_knit$set(
  root.dir = '.',
  base.url = '{{ site.baseurl }}/')
opts_chunk$set(
  comment = NA,
  error = FALSE,
  screenshot.force = FALSE)

deps <- list()
args <- commandArgs(trailingOnly=TRUE)
f.Rmd <- args[[1]]
f.md <- args[[2]]
f <- str_replace(f.md, '_.*/[0-9\\-]*(.*).md$', '\\1')
opts_chunk$set(
  fig.path = file.path('assets', 'images', f, ''),
  cache.path = file.path('cache', f, '')
)
knit(input = f.Rmd, output = f.md)
deps <- c(deps, knit_meta())
deps <- unique(deps)
deps <- lapply(deps, FUN = function(d) {
  # create path for htmlwidgets
  htmlwidgets <- str_extract(d$src$file, 'htmlwidgets.*')
  htmlwidgets_dest <- dirname(htmlwidgets)
  dir.create(htmlwidgets, showWarnings = FALSE, recursive = TRUE)
  system2('rsync', c('-a', '--update', d$src$file, htmlwidgets_dest))
  d$src <- htmlwidgets
  return(unclass(d))
})

if (length(deps) > 0) {
  f <- '_data/htmlwidgets.yml'
  if (!(file.exists(f) && identical(yaml.load_file(f), deps))) {
    cat(as.yaml(deps), file = f)
  }
}
