# Easier way to use MfE colours in ggplot2
# Inspiration from: https://www.garrickadenbuie.com/blog/custom-discrete-color-scales-for-ggplot2/

# setup named list of MfE colours
branded_colors <- list(
  "dark_blue"   = "#1b556b",
  "blue"    = "#32809c",
  "dark_green" = "#0f7b7d",
  "light_green"  = "#6fc7b7",
  "brown"   = "#723b24", 
  "orange"   = "#da5a28"
)

# created branded palette function
branded_pal <- function(
  primary = "dark_blue", 
  other = "orange", 
  direction = 1
) {
  stopifnot(primary %in% names(branded_colors))
  
  function(n) {
    if (n > 6) warning("Branded Color Palette only has 6 colors.")
    
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

