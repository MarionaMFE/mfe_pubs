
# mfePubs <img src="man/figures/mfepubslogo.png" align="right" width="120" />

`mfePubs` is a package for homogenising the graphical outputs of code
based analysis at MfE.

## Installation

``` r
# mfePubs is under development, so it is not available on CRAN
# and needs to be installed from github
# install.packages("devtools")
devtools::install_github("MarionaMFE/mfe_pubs")
```

## Contents

The package contains the following functions and templates:

1- `er template report`: Environmental Reporting R Markdown/Word
template

2- `mfe_theme()`: Function to set ggplot themes to mfe standard

3- `mfe_colours`: Function to apply mfe branded color palette to ggplot

4- `format_num()`: Function to standarise the format of numbers;
(decimal places, thousands marks )

5- `macron()`: Function that makes sure macrons are displayed in graphs

When you have downloaded the package and successfully installed it you
are good to go and write MfE word documents in R Markdown and create
charts with MfE themes and colors, including the correct usage of
Macrons in Te Reo.

## Usage

### Clean the data before plotting and prepare it for ggplot

``` r

library(mfePubs)

library(tidyverse)
library(reshape2)
library(tidyverse)
library(lubridate)

# load the kaya dataset attached with mfePubs package
data(kaya)

# tidy data (transpose it)
kaya %>% 
  rownames_to_column %>%
  gather(variable, value, -rowname) %>%
  spread(rowname, value) -> spread_table

# change variable names
names(spread_table) <- c('year', 'population', 'gdp_per_capita', 'co2', 'energy_per_gdp', 'co2_per_energy')

# remove first line and make 'year' a numeric variable
spread_table %>% 
  filter(year != 'X') %>%
  mutate(year = as.numeric(str_remove(year, 'X'))) %>%
  select (-co2) -> spread_table

data_long <- melt(spread_table, id = 'year')
```

### `theme_mfe()`

A basic explanation and summary here:

`theme_mfe()`: has no arguments and is added to the ggplot chain after
you have created a plot. What it does is generally makes text size, font
and colour, axis lines, axis text and many other standard chart
components into MfE style, which right now is pretty much a copy of
Stats NZ’s [`simplevis`
package](https://github.com/StatisticsNZ/simplevis).

The function is pretty basic and does not change or adapt based on the
type of chart you are making, so in some cases you will need to make
additional theme arguments in your ggplot chain if you want to make any
additions or changes to the style, for example to add or remove
gridlines etc. Also note that colours for lines in the case of a line
chart or bars for a bar chart, do not come out of the box from the
theme\_mfe() function, but need to be explicitly set in your other
standard ggplot chart functions.

Example of how it is used in a standard workflow:

``` r

plot <- ggplot(data_long, aes(x = year, y = as.numeric(value), colour = variable)) +
  geom_line(size = 1.5) +
  ggtitle('Kaya identity, New Zealand, 1990-2018') +
  ylab('base 100') +
  xlab('year') +
  scale_x_continuous(n.breaks=length(unique(data_long$year))/5)

plot
```

![](man/figures/README-example_theme_mfe-1.png)<!-- -->

This is what the ggplot default theme looks like. Now to apply the MfE
style just need to add the function call:

``` r

plot + theme_mfe()
```

![](man/figures/README-add_mfe_theme-1.png)<!-- -->
