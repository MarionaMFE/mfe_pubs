#' A Function to Format Numbers
#'
#' Consistenly formatting of numbers.
#' @param number_value the number to modify
#' @keywords number-formatting
#' @export
#' @examples
#' format_num(1520000)
#' > "1,520,000.00"
#' format_num(0.00008)
#' > "0.00"

format_num <- function(number_value, accuracy = 0.01) {
  scales::number(number_value,
                 accuracy =  accuracy,
                 big.mark = ",")
}
