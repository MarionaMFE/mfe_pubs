#' MfE colours for ggplot2 plots
#'
#' Function to apply MfE branded colors
#' @param font_family defaults to Helvetica
#' @param font_size_title defaults to 11
#' @param font_size_body defaults to 10
#' @keywords ggplot-colour-formatting
#' @export
#' @examples

# Isaac Bain: Easier way to use MfE colours in ggplot2
# Inspiration from: https://www.garrickadenbuie.com/blog/custom-discrete-color-scales-for-ggplot2/

# setup named list of MfE colours
mfe_colors <- list(
  "dark_blue" = "#1C556C",
  "blue" = "#32809C",
  "dark_green" = "#0F7B7D",
  "light_green" = "#2C9986",
  "turquoise" = "#6FC7B7" ,
  "brown" = "#8B391D",
  "orange"= "#DA5A28"
)

# created branded palette function
branded_pal <- function(
  primary = "dark_blue",
  other = "orange",
  direction = 1
) {
  stopifnot(primary %in% names(branded_colors))

  function(n) {
    if (n > 7) warning("Branded Color Palette only has 7 colors.")

    if (n == 2) {
      other <- if (!other %in% names(branded_colors)) {
        other
      } else {
        branded_colors[other]
      }
      color_list <- c(other, branded_colors[primary])
    } else {
      color_list <- branded_colors[1:n]
    }

    color_list <- unname(unlist(color_list))
    if (direction >= 0) color_list else rev(color_list)
  }
}

# setup ggplot colour scale
scale_colour_branded <- function(
  primary = "dark_blue",
  other = "orange",
  direction = 1,
  ...
) {
  ggplot2::discrete_scale(
    "colour", "branded",
    branded_pal(primary, other, direction),
    ...
  )
}

# by convention colour also spelled without U.
scale_color_branded <- scale_colour_branded




# setup ggplot fill scale
scale_fill_branded <- function(
  primary = "dark_blue",
  other = "orange",
  direction = 1,
  ...
) {
  ggplot2::discrete_scale(
    "fill", "branded",
    branded_pal(primary, other, direction),
    ...
  )
}

