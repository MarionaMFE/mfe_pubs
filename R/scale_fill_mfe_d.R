#' MfE discrete filling for ggplot2 plots
#'
#' Function to apply MfE branded colours
#' @param primary defaults to dark_green
#' @param other defaults to orange
#' @param direction defaults to 1
#' @keywords ggplot-colour-formatting
#' @export
#' @examples
#' scale_fill_mfe()

# Isaac Bain: Easier way to use MfE colours in ggplot2
# Inspiration from: https://www.garrickadenbuie.com/blog/custom-discrete-color-scales-for-ggplot2/
# Mariona Roige: Have changed branded_pal function to add some user functionality to it
# a- direction change from the other side of the palette
# to use when looking for high contrasting colours. The blue side of the palette
# is not distinguishible enough to the eye.

# setup ggplot colour scale
scale_fill_mfe <- function(
  primary = "light_blue",
  other = "orange",
  direction = 1,
  ...
) {
  ggplot2::discrete_scale(
    "fill", "mfe",
    mfe_pal(primary, other, direction),
    ...
  )
}

# by convention colour also spelled without U.
scale_fill_mfe <- scale_fill_mfe


#mfe_pal()(2)
#mfe_pal(other = 'dark_green')(2)
#mfe_pal()(3)
#mfe_pal(direction = -1)(3)

