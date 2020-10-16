#' Quickly make a ggplot histogram
#'
#' @param .data: a vector of values, such as one returned by `rnorm()`
#'
#' @return a histogram ggplot object
#' @export
#' @import ggplot2
#'
#' @examples
#' rnorm(1000, 0, 1) %>% gghist()
#'
#'

gghist <- function(.data, bins = length(.data)/20){
  d <- data.frame(val = .data)
  ggplot(d, aes(x = val)) +
    geom_histogram(bins = bins)
}
