#' Set the y axis scale to continuous with quantile breaks
#'
#' @param val: the column to calculate breaks from, ie mtcars$mpg
#' @param prob: a sequence of probability values, ie c(0, 0.5, 1) or seq(0, 1, 0.25)
#' @param digits: number of digits to round the quantiles to
#'
#' @return
#' @export
#' @import ggplot2
#'
scale_y_quantile <- function(val, prob = seq(0, 1, 0.25), digits = 1, ...) {
  scale_y_continuous(..., trans = quantile_trans(val, prob, digits))
}
