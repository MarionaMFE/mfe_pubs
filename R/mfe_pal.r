#' MfE set up mfe_pal()
#'
#' @keywords ggplot-colour-formatting
#' @export
#' @examples
#' mfe_pal()


# created branded palette function
mfe_pal <- function(
  primary = "dark_green",
  other = "orange",
  direction = 1
) {
  stopifnot(primary %in% names(mfe_colours))

  function(n) {
    if (n > 7) warning("MfE colour Palette only has 7 colours.")

    if (n == 2) {
      other <- if (!other %in% names(mfe_colours)) {
        other
      } else {
        mfe_colours[other]
      }
      colour_list <- c(other, mfe_colours[primary])
    } else {
      if (direction >= 0) {colour_list <- mfe_colours[1:n]} else { colour_list<- tail(mfe_colours,n)}
    }

    colour_list <- unname(unlist(colour_list))
    colour_list
  }
}

