#' A light ggplot theme for MCM's personal use
#'
#' @param base_family: the base font family
#' @param title_family: font to be used for the plot title
#' @param subtitle_family: font to be used for the subtitle
#' @param axis_family: font to be used for the axis titles
#' @param base_color: base color for text and lines
#' @param primary_color: color for primary components
#' @param accent_color: color for accent components
#' @param base_size: base font size
#' @param gridlines: should gridlines be displayed?
#' @param facet_outlines: should facets be outlined?
#' @param large_lineheight: should the subtitle lineheight be increased to 1 to prevent overlaps?
#'
#' @return A ggplot theme
#' @export
#' @import ggplot2 ggtext
#'
#' @examples
#' mtcars %>% ggplot(aes(x = wt, y = mpg)) + geom_point() + theme_mcm()
theme_mcm <- function (base_family = "fraunces", title_family = "fraunces",
                       subtitle_family = "fraunces", axis_family = "fraunces",
                       base_color = "gray10", primary_color = "white", accent_color = "black",
                       base_size = 10, mult1 = 1.2, mult2 = 1.4, mult3 = 1.5, mult4 = 2.25,
                       gridlines = F, facet_outlines = F, large_lineheight = F)
{
  a <- theme_bw() + theme(text = element_text(family = base_family,
                                              colour = base_color, size = base_size),
                          line = element_line(colour = base_color, size = 0.2),
                          legend.background = element_blank(),
                          legend.key = element_blank(),
                          panel.background = element_blank(),
                          panel.border = element_rect(fill = NA,
                                                      colour = base_color, size = 0.2),
                          strip.background = element_blank(),
                          axis.line = element_blank(),
                          panel.grid.minor = element_blank(),
                          axis.ticks = element_blank(),
                          plot.background = element_rect(fill = primary_color),
                          axis.text = element_text(family = base_family,
                                                   colour = base_color,
                                                   size = base_size),
                          plot.title = element_markdown(family = title_family,
                                                    face = "bold.italic",
                                                    colour = accent_color,
                                                    size = base_size * mult4),
                          axis.title = element_markdown(family = axis_family,
                                                    colour = accent_color,
                                                    size = base_size * mult2),
                          strip.text = element_markdown(family = axis_family,
                                                    colour = accent_color,
                                                    size = base_size * mult2),
                          legend.title = element_markdown(family = base_family,
                                                      colour = base_color,
                                                      size = base_size * mult2),
                          legend.text = element_markdown(family = axis_family,
                                                     colour = accent_color,
                                                     size = base_size * mult1))
  if (!gridlines) {
    a <- a + theme(panel.grid = element_blank())
  }
  if (!facet_outlines) {
    a <- a + theme(panel.border = element_blank())
  }
  if (large_lineheight) {
    a <- a + theme(plot.subtitle = element_markdown(family = subtitle_family,
                                                face = "italic",
                                                colour = accent_color,
                                                size = base_size * mult3,
                                                lineheight = 1))
  }
  else {
    a <- a + theme(plot.subtitle = element_markdown(family = subtitle_family,
                                                face = "italic",
                                                colour = accent_color,
                                                size = base_size * mult3))
  }
  return(a)
}


#' A dark ggplot theme for MCM's personal use
#'
#' @param base_family: the base font family
#' @param title_family: font to be used for the plot title
#' @param subtitle_family: font to be used for the subtitle
#' @param axis_family: font to be used for the axis titles
#' @param base_color: base color for text and lines
#' @param primary_color: color for primary components, including background
#' @param accent_color: color for accent components
#' @param base_size: base font size
#' @param gridlines: should gridlines be displayed?
#' @param facet_outlines: should facets be outlined?
#' @param large_lineheight: should the subtitle lineheight be increased to 1 to prevent overlaps?
#'
#'
#' @return A ggplot theme
#' @export
#' @import ggplot2 ggtext
#'
#' @examples
#' mtcars %>% ggplot(aes(x = wt, y = mpg)) + geom_point() + theme_mcm_dark()
theme_mcm_dark <- function(base_family = "fraunces", title_family = "fraunces",
                           subtitle_family = "fraunces", axis_family = "fraunces",
                           base_color = "white",
                           primary_color = "grey10",
                           accent_color = "grey90",
                           gridlines = F,
                           facet_outlines = F,
                           base_size = 10,
                           mult1 = 1.2,
                           mult2 = 1.4,
                           mult3 = 1.5,
                           mult4 = 2.25,
                           large_lineheight = F) {
  a <- theme_bw() +
    theme(
      text = element_text(
        family = base_family,
        colour = base_color,
        size = base_size
      ),
      line = element_line(
        colour = base_color,
        size = 0.2),
      legend.background = element_blank(),
      legend.key = element_blank(),
      panel.background = element_blank(),
      panel.border = element_rect(
        fill = NA,
        colour = base_color,
        size = 0.2
      ),
      strip.background = element_blank(),
      axis.line = element_blank(),
      panel.grid.minor = element_blank(),
      axis.ticks = element_blank(),
      plot.background = element_rect(fill = primary_color, color = NA),
      axis.text = element_text(
        family = base_family,
        colour = base_color,
        size = base_size
      ),
      plot.title = element_markdown(
        family = title_family,
        face = "bold.italic",
        colour = accent_color,
        size = base_size * mult4
      ),
      axis.title = element_markdown(
        family = axis_family,
        colour = accent_color,
        size = base_size * mult2
      ),
      strip.text = element_markdown(
        family = axis_family,
        colour = accent_color,
        size = base_size * mult2
      ),
      legend.title = element_markdown(
        family = axis_family,
        colour = accent_color,
        size = base_size * mult2
      ),
      legend.text = element_markdown(
        family = base_family,
        colour = base_color,
        size = base_size * mult1
      )
    )

  if (!gridlines) {
    a <- a + theme(panel.grid = element_blank())
  }

  if (!facet_outlines) {
    a <- a + theme(panel.border = element_blank())
  }

  if (large_lineheight){
    a <- a + theme(plot.subtitle = element_markdown(
      family = subtitle_family,
      face = "italic",
      colour = accent_color,
      size = base_size * mult3,
      lineheight = 1
    ))
  } else {
    a <- a + theme(plot.subtitle = element_markdown(
      family = subtitle_family,
      face = "italic",
      colour = accent_color,
      size = base_size * mult3
    ))
  }

  return(a)
}
