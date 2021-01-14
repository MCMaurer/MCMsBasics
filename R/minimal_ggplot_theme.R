#' A nice minimal ggplot theme
#'
#' @param base_family: the base font family, defaults to "Roboto Condensed"
#' @param gridlines: should gridlines be displayed? defaults to F
#' @param dark: use dark theme?
#'
#' @return A ggplot theme
#' @export
#' @import ggplot2
#'
#' @examples
#' mtcars %>% ggplot(aes(x = wt, y = mpg)) + geom_point() + minimal_ggplot_theme()
minimal_ggplot_theme <- function(base_family = "Roboto Condensed", gridlines = F, dark = F){
  min_theme <- theme_bw(base_family = base_family) +
    theme(legend.background = element_blank(), legend.key = element_blank(),
          panel.background = element_blank(), panel.border = element_blank(),
          strip.background = element_blank(), plot.background = element_blank(),
          axis.line = element_blank(), panel.grid.minor = element_blank(),
          axis.ticks = element_blank())

  if(!gridlines){
    min_theme <- min_theme + theme(panel.grid = element_blank())
  }

  if(dark){
    min_theme <- min_theme + theme(line = element_line(colour = "white"), text = element_text(colour = "white"), plot.background = element_rect(fill = "gray5"), axis.text = element_text(colour = "white"))
  }

  return(min_theme)
}
