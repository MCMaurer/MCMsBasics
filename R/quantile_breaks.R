#' Get a vector of quantile values from a vector
#'
#' @param prob: a sequence of probability values, ie c(0, 0.5, 1) or seq(0, 1, 0.25)
#' @param digits: number of digits to round the quantiles to
#'
#' @return a vector of quantile values rounded to a specified number of digits
#' @export
#'
#' @examples
#' quantile_breaks(1:10, c(0,0.5,1), 2)
quantile_breaks <- function(value, prob, digits = 1) {
  function(x) round(as.numeric(quantile(value, prob)), digits = digits)
}
