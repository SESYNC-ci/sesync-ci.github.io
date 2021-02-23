---
title: "Goodbye %>%, hello := (Using R data.table to speed up my data science)"
tags:
 - R
author: qread
---

**DRAFT**

I have used tidyverse since at least 2015 in R. Before that I used base R. I have long admired the tidyverse's design philosophy and it's really helped me speed up writing data analysis and processing scripts interactively. But there are some negatives of tidyverse. It's not very stable and code from a few years ago often breaks if you are keeping your package and R versions up to date. More importantly, it doesn't care that much about code being fast or lean in terms of memory use. Enter data.table.

## Why did I learn it?

Both data.table and tidyverse are really well-designed but have different goals. The main goal of data.table is to run quickly and efficiently on huge data frames with millions of rows. 

For my food waste research I had a big data problem, because I have 20 different scenarios times ~3100 counties in the United States, with pairwise flows of 10 different goods between the counties, so 20 * 3100^2 * 10 which ends up being a huge data frame. Just doing basic operations in tidyverse such as pivot, summarize, and mutate was taking a day even running a lot of cores in parallel on the Slurm cluster. That bothered me for a few reasons, especially because I was still trying to work out some kinks in the analysis and it was annoying to have to run things for a day every time I wanted to check if the full analysis worked. That's why I thought it would be nice to learn data.table. It had been on the back burner for a long time but this time I actually decided to sit down and learn it.

## Some examples

If you've used tidyverse you have certainly seen the `%>%` (pipe) operator. The pipe allows you to chain many data-manipulation commands into one statement without having(to(nest(lots(of(functions(like(this))))))). 

Data.table also has a signature operator, `:=`. This is a special assignment operator that lets you create new data frame columns in-place without having to reassign the entire data.table to a new object. This saves time and memory.

For example in tidyverse you could write

```
mydata <- mydata %>%
  mutate(new_column = column1^2 + column2)
```

The equivalent in data.table would be

```
mydata[, new_column := column1^2 + column2]
```

You can also chain commands in data.table using brackets, so you can end up writing statements in a similar way to tidyverse.

For example, this in tidyverse:

```
```

is this in data.table:

```
```

## How did I learn it?

I went through the vignettes on data.table's homepage, which are a very nice tutorial that I would recommend to beginners who are otherwise familiar with R.

In the end it was helpful that I first learned data munging in base R, before tidyverse had taken over the world. This is because data.table is a little closer to base R syntax so some things were more familiar to me than if I had only learned tidyverse ways of doing things -- this is kind of like a native English speaker learning German, where you occasionally recognize a cognate or bit of grammar that resembles "old-fashioned" English.

## Hybrid solution

In the end, I used mostly data.table syntax with some of the `map()` family of functions from the `purrr` package (tidyverse's list manipulation package) mixed in. I also found a few custom functions through the art of Googling that allowed me to mimic some tidyverse behavior like grouping a data.table and making a list column in each group. Maybe this isn't the optimal data.table solution but it helped me translate my code from tidyverse to data.table without having to completely rethink how it's done.

## Conclusion

I am happy with the performance benefit I got from learning data.table, it was a fun learning experience, and it's always nice to learn a new "language" or new syntax within a language. Just like learning a new foreign language, it helps your mind get out of set ways of thinking and frees you to come up with more creative solutions even in the language you already know. Of course this fits with my quest to make my code more efficient and thereby get the same outcome while consuming less energy.

There are other options that allow hybrid solutions where tidyverse code can work with data.table's performance, or even packages like dbplyr that let you use SQL in tidyverse language (data.table is also based on SQL). This would be nice if you really like the %>% better than the :=. But data.table also has some appealing syntax.

- What advantages does it have
  + Give a couple examples of data.table calls, compared to tidyverse ones
- How did I learn it (working through the vignettes)
- Translated an existing set of scripts from tidyverse to data.table
- It was actually helpful that I did a lot of this stuff in base R way back when, since data.table is closer to base R.
- Used purrr from tidyverse some in the new script, which is really nice for the list columns (data.table also supports these -- not sure whether it adopted that feature from tidyverse or not?)
- data.table has actually been around for longer than the tidyverse, since about 2012, and constantly being updated, but is a lot more stable. The old data.table code still works.
