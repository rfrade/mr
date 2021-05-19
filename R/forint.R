#' This function adds HUF at the end of the value passed as argument
#' @param numeric value to be formatted
#' @export
#' @examples
#' forint(10) -> 10 HUF
forint <- function(x){
  scales::dollar(x, prefix = '', suffix = ' HUF')
}