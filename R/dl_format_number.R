#' A Function by Dan Lawrence
#'
#' This function allows you to express your love of cats.
#' @param number_value the value that you are trying to modify
#' @keywords number-formatting
#' @export
#' @examples
#' format_num()

format_num <- function(number_value, accuracy = 0.01) {
  scales::number(number_value,
                 accuracy =  accuracy,
                 big.mark = ",")
}
