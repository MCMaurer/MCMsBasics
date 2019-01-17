#' A nice minimal ggplot theme
#'
#' @param base_family: the base font family, defaults to "Roboto Condensed"
#'
#' @return A ggplot theme
#' @export
#' @import ggplot2
#'
#' @examples
#' mtcars %>% ggplot2(aes(x = wt, y = mpg)) + geom_point() + minimal_ggplot_theme()
minimal_ggplot_theme <- function(base_family = "Roboto Condensed"){
  theme_bw(base_family = base_family) +
    theme(legend.background = element_blank(), legend.key = element_blank(),
          panel.background = element_blank(), panel.border = element_blank(),
          strip.background = element_blank(), plot.background = element_blank(),
          axis.line = element_blank(), panel.grid = element_blank(),
          axis.ticks = element_blank())
}
