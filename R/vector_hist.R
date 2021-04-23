#' Quickly make a ggplot histogram from a single vector
#'
#' @param .data: a vector of values, such as one returned by `rnorm()`
#' @param bins: how many bins the histogram uses. Defaults to ggplot's default
#'
#' @return a histogram ggplot object
#' @export
#' @import ggplot2
#'
#' @examples
#' rnorm(1000, 0, 1) %>% vector_hist()
#'
#'

vector_hist <- function(.data, bins = NULL){
  d <- data.frame(val = .data)
  ggplot(d, aes(x = val)) +
    geom_histogram(bins = bins)
}
