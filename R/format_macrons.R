#' Format macrons
#'
#' Function to apply MfE branded colours
#' @param x the vowel that we want to put a macron on
#' @keywords macron-formatting
#' @export
#' @examples
#' mac()
#'

# Function by Ben Curran.


mac <- function(x){
         if (x == "a") {
  result <- paste("\u101", sep = "")
  } else if (x == "A") {
  result <- paste("\u100", sep = "")
  } else if (x == "e") {
  result <- paste("\u113", sep = "")
  } else if (x == "E") {
  result <- paste("\u112", sep = "")
  } else if (x == "i") {
  result <- paste("\u12b", sep = "")
  } else if (x == "I") {
  result <- paste("\u12a", sep = "")
  } else if (x == "o") {
  result <- paste("\u14d", sep = "")
  } else if (x == "O") {
  result <- paste("\u14c", sep = "")
  } else if (x == "u") {
  result <- paste("\u16b", sep = "")
  } else if (x == "U") {
  result <- paste("\u16a", sep = "")
  } else (print("Entry not recognised"))

  return(result)
  # return(sentenceString = trimws(result))
  # paste((result), sep = "")
  # paste(trimws(result))

}

#mac("E")
# Doesn't work yet
#p("T",mac("e"),"n\u101 koe. Welcome. This site presents data about resource management received and processed by local authorities under the Resource Management Act (RMA).")
# Works if you do this but this is obviously not what we want, tried to do this through the function and failed.
#p(paste0("T",mac("e"),"n\u101 koe. Welcome. This site presents data about resource management received and processed by local authorities under the Resource Management Act (RMA).", sep = ""))

# if (x == "a") {
#   result <- paste("\u101", sep = "")
# } else if (x == "A") {
#   result <- paste("\u100", sep = "")
# } else if (x == "e") {
#   result <- paste("\u113", sep = "")
# } else if (x == "E") {
#   result <- paste("\u112", sep = "")
# } else if (x == "i") {
#   result <- paste("\u12b", sep = "")
# } else if (x == "I") {
#   result <- paste("\u12a", sep = "")
# } else if (x == "o") {
#   result <- paste("\u14d", sep = "")
# } else if (x == "O") {
#   result <- paste("\u14c", sep = "")
# } else if (x == "u") {
#   result <- paste("\u16b", sep = "")
# } else if (x == "U") {
#   result <- paste("\u16a", sep = "")
# } else (print("Entry not recognised"))

# macs_value <- c("a", "A", "e", "E", "i", "I", "o", "O", "u", "U")
# value <- c(1,2,3,4,5,6,7,8,9,10)
# m_v <- data.frame(macs_value, value)

#s <- p('T',mac("e"),'n',mac("a"),' koe. Welcome.')
#a <- p(mac("a"),mac("A"),mac("e"),mac("E"),mac("i"),mac("I"),mac("o"),mac("O"),mac("u"),mac("U"))
#print(s)
#print(a)

# macs <- function(x){
#   result <- "\u101"
#   return(result)
# }

# a,A,e,E,i,I,o,O,u,U

# library(data.table)
#
# Possibly promising method if I can get it to work
# macs <- function(x) {
#
#   macs_value <- c("a", "A", "e", "E", "i", "I", "o", "O", "u", "U")
#   value <- c("\u101", "\u100", "\u113", "\u112", "\u12b", "\u12a", "\u14d", "\u14c", "\u16b", "\u16a")
#   m_v <- data.frame(macs_value, value)
#   macron <- m_v$value[m_v$macs_value]
#
#   return(macron)
#
# }
#
# macs(a)

#
# mac <- function(a,A,e,E,i,I,o,O,u,U){
#   result <- "\u101"
#   result <- "\u100"
#   result <- "\u113"
#   result <- "\u112"
#   result <- "\u12b"
#   result <- "\u12a"
#   result <- "\u14d"
#   result <- "\u14c"
#   result <- "\u16b"
#   result <- "\u16a"
#   return(result)
# }
#
#
# mac <- "A"
#
# if (a) {
#   print("\u101")
# } else if (A) {
#   print("\U100")
# } else if (e) {
#   print("\u113")
# } else {
#   print("Entry not recognised")
# }
#
# mac <- function(x){
#   if ('a'){
#     result <- "\u101"
#   } else if ('A'){
#     result <- "\U100"
#   }
#   return(result)
# }

# a == 1, A == 2, e == 3, E == 4 , i == 5 , I == 6, o == 7, O == 8, u == 9, U == 10

# a, A, e, E, i, I, o, O, u, U
