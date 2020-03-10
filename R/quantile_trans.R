#' A transformation function to be used in ggplot2 scales
#'
#' @param prob: a sequence of probability values, ie c(0, 0.5, 1) or seq(0, 1, 0.25)
#' @param digits: number of digits to round the quantiles to
#'
#' @return a scale that is untransformed but has breaks specified by quantiles
#' @export
#' @import ggplot2
#'
quantile_trans <- function(val, prob, digits) {
  scales::trans_new(
    name = "quantile",
    transform = function(x) x,
    inverse = function(x) x,
    breaks = quantile_breaks(val, prob, digits))
}
