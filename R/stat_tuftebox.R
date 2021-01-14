#' Stat for Tufte-style minimal boxplots
#' @rdname geom_tuftebox
#' @import ggplot2
#' @import grid
#'
#'#' @section Computed variables:
#' `stat_tuftebox()` provides the following variables, some of which depend on the orientation:
#' \describe{
#'   \item{ymin }{minimum observation, bottom of lower segment}
#'   \item{lower }{25% quantile, top of lower segment}
#'   \item{median }{median, point}
#'   \item{upper }{75% quantile, bottom of upper segment}
#'   \item{ymax }{maximum observation, top of upper segment}
#' }
#' @export
stat_tuftebox <- function(mapping = NULL, data = NULL, geom = "TufteBox",
                          position = "identity", show.legend = NA,
                          outliers = TRUE, inherit.aes = TRUE, ...){
  ggplot2::layer(
    stat = StatTufteBox,
    data = data,
    mapping = mapping,
    geom = geom,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(outliers = outliers, ...)
  )
}

#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
StatTufteBox <- ggproto("StatTufteBox", Stat,
                        compute_group = function(data, scales) {
                          probs <- c(0, 0.25, 0.5, 0.75, 1)
                          qq <- quantile(data$y, probs = probs, na.rm = T)
                          out <- qq %>% as.list() %>% as.data.frame()
                          names(out) <- c("ymin", "lower", "median",
                                          "upper", "ymax")
                          out$x <- data$x[1]
                          out
                        },
                        required_aes = c("x", "y")
)
