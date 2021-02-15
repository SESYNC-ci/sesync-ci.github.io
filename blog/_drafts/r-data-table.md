---
title: "Goodbye %>%, hello := (Using R data.table to speed up my data science)"
tags:
 - R
author: qread
---

**DRAFT**

I have used tidyverse since at least 2015 in R. Before that I used base R. I have long admired the tidyverse's design philosophy and it's really helped me speed up writing data analysis and processing scripts interactively. But there are some negatives of tidyverse. It's not very stable and code from a few years ago often breaks if you are keeping your package and R versions up to date. More importantly, it doesn't care that much about code being fast or lean in terms of memory use. Enter data.table.

- What advantages does it have
  + Give a couple examples of data.table calls, compared to tidyverse ones
- How did I learn it (working through the vignettes)
- Translated an existing set of scripts from tidyverse to data.table
- It was actually helpful that I did a lot of this stuff in base R way back when, since data.table is closer to base R.
- Used purrr from tidyverse some in the new script, which is really nice for the list columns (data.table also supports these -- not sure whether it adopted that feature from tidyverse or not?)
- data.table has actually been around for longer than the tidyverse, since about 2012, and constantly being updated, but is a lot more stable. The old data.table code still works.

There are other options that allow hybrid solutions where tidyverse code can work with data.table's performance, or even packages like dbplyr that let you use SQL in tidyverse language (data.table is also based on SQL). This would be nice if you really like the %>% better than the :=. But data.table also has some appealing syntax.

