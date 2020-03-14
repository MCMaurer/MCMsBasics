#' A nice minimal ggplot theme
#'
#' @param base_family: the base font family, defaults to "Roboto Condensed"
#' @param gridlines: should gridlines be displayed? defaults to F
#'
#' @return A ggplot theme
#' @export
#' @import ggplot2
#'
#' @examples
#' mtcars %>% ggplot(aes(x = wt, y = mpg)) + geom_point() + minimal_ggplot_theme()
minimal_ggplot_theme <- function(base_family = "Roboto Condensed", gridlines = F){
  min_theme <- theme_bw(base_family = base_family) +
    theme(legend.background = element_blank(), legend.key = element_blank(),
          panel.background = element_blank(), panel.border = element_blank(),
          strip.background = element_blank(), plot.background = element_blank(),
          axis.line = element_blank(),
          axis.ticks = element_blank())

  if(!gridlines){
    min_theme <- min_theme + theme(panel.grid = element_blank())
  }

  return(min_theme)
}
