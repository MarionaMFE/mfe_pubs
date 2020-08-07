
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

3- `scale_colour_mfe` and `scale_fill_mfe`: Functions to apply mfe
branded color palettes to discrete variables in ggplot graphs.

4- `format_num()`: Function to standarise the format of numbers;
(decimal places, thousands marks )

5- `macron()`: Function that makes sure macrons are properly displayed
in graphs.

When you have downloaded the package and successfully installed it you
are good to go and write MfE word documents in R Markdown and create
charts with MfE themes and colors, including the correct usage of
Macrons in Te Reo.

## Usage

### Functions

#### Clean the data before plotting and prepare it for ggplot

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

kayaplot <- ggplot(data_long, aes(x = year, y = as.numeric(value), colour = variable)) +
  geom_line(size = 1.5) +
  ggtitle('Kaya identity, New Zealand, 1990-2018') +
  ylab('base 100') +
  xlab('year') +
  scale_x_continuous(n.breaks=length(unique(data_long$year))/5)

kayaplot
```

![](man/figures/README-example_theme_mfe-1.png)<!-- -->

This is what the ggplot default theme looks like. Now to apply the MfE
style just need to add the function call:

``` r

kayaplot + theme_mfe() 
```

![](man/figures/README-add_mfe_theme-1.png)<!-- -->

### `scale_color_mfe()`

To continue with the kaya plot example, we could add MfE branded
colours. The function `scale_color_mfe()` can do that in one line of
code:

``` r
kayaplot + 
  theme_mfe() +
  scale_colour_mfe(direction = -1)
```

![](man/figures/README-scale_colour-1.png)<!-- -->

### `scale_fill_mfe()`

``` r

kaya_barplot <- ggplot(data_long, aes(x = year, y = as.numeric(value), fill = variable)) +
  geom_col() +
  ggtitle('Kaya identity, New Zealand, 1990-2018') +
  ylab('base 100') +
  xlab('year') +
  scale_x_continuous(n.breaks=length(unique(data_long$year))/5) +
  theme_mfe() +
  scale_fill_mfe(direction = -1)

kaya_barplot
```

![](man/figures/README-color_discrete-1.png)<!-- -->

The MfE colours can be used in the functions
`ggplot2::scale_color_manual`and `ggplot2::scale_fill_manual` and they
can be accessed by their names:

``` r
mfe_colours
#> $dark_blue
#> [1] "#1C556C"
#> 
#> $blue
#> [1] "#32809C"
#> 
#> $dark_green
#> [1] "#0F7B7D"
#> 
#> $light_green
#> [1] "#2C9986"
#> 
#> $turquoise
#> [1] "#6FC7B7"
#> 
#> $brown
#> [1] "#8B391D"
#> 
#> $orange
#> [1] "#DA5A28"

image(volcano, col = unname(unlist(mfe_colours)))
```

![](man/figures/README-colour_custom_Scale-1.png)<!-- -->

``` r


kaya_barplot_custom <- ggplot(data_long, aes(x = year, y = as.numeric(value), fill = variable)) +
  geom_col() +
  ggtitle('Kaya identity, New Zealand, 1990-2018') +
  ylab('base 100') +
  xlab('year') +
  scale_x_continuous(n.breaks=length(unique(data_long$year))/5) +
  theme_mfe() +
  scale_fill_manual(values = c(mfe_colours$dark_blue, 
                               mfe_colours$turquoise, 
                               mfe_colours$brown, 
                               mfe_colours$light_green))

kaya_barplot_custom
```

![](man/figures/README-colour_custom_Scale-2.png)<!-- -->

### `er template report`

This template is an RMarkdown template that replicates the format and
style from the ER word template. The template is made available with
package installation. To access the template follow the steps:

1- From RStudio File/ New File/ R Markdown / From Template

<img src="man/figures/rmarkdown_template.png" align="centre" width="600" />

2- Detailed instructions about the template can be found
[here](https://github.com/mfe-nz/ER_template_markdown)

### `format_num()`

The function format\_num() is for homogenising the format of the
numbers, for example, to ensure all the numbers within an R Markdown
document follow the same rules of decimal positions and markers.

``` r
format_num(156346831441)
#> [1] "156,346,831,441.00"
format_num(15)
#> [1] "15.00"
format_num(0.0000000005)
#> [1] "0.00"
format_num(0.2)
#> [1] "0.20"
```
