#' Quickly make a ggplot histogram from a dataframe and variable name
#'
#' @param .data: a vector of values, such as one returned by `rnorm()`
#' @param bins: how many bins the histogram uses. Defaults to ggplot's default
#'
#' @return a histogram ggplot object
#' @export
#' @import ggplot2
#'
#' @examples
#' mtcars %>% gghist(mpg)
#'
#'

gghist <- function(.data, var, bins = NULL){
  ggplot(.data, aes(x = !!enquo(var))) +
    geom_histogram(bins = bins)
}
