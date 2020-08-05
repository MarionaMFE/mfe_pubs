
# mfePubs <img src="man/figures/mfepubslogo.png" align="right" width="120" />

`mfePubs` is a package for homogenising the graphical outputs of code
based analysis in MfE.

## Installation

``` r
# mfePubs is under development, so it is not available on CRAN
# and needs to be installed from github
# install.packages("devtools")
devtools::install_github("MarionaMFE/mfe_pubs")
```

When you have downloaded the package and successfully installed it you
are good to go and create charts.

## Usage

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
