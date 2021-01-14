#' Geom for Tufte-style minimal boxplots
#' @import ggplot2
#' @import scales
#' @import grid
#'
#' @param geom,stat Use to override the default connection between
#'   `geom_tuftebox()` and `stat_tuftebox()`.
#' @examples
#' p <- ggplot(mpg, aes(class, hwy))
#' p + geom_tuftebox()
#' @export
geom_tuftebox <- function(mapping = NULL,
           data = NULL,
           stat = "TufteBox",
           position = "identity",
           show.legend = NA,
           na.rm = FALSE,
           inherit.aes = TRUE,
           ...) {
    ggplot2::layer(
      stat = stat,
      data = data,
      mapping = mapping,
      geom = GeomTufteBox,
      position = position,
      show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, ...)
    )
  }

#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
GeomTufteBox <- ggproto(
  "GeomTufteBox",
  Geom,
  required_aes = c("x", "ymin", "lower", "median", "upper", "ymax"),
  default_aes = aes(shape = 19, size = 2),
  draw_key = draw_key_point,
  draw_panel = function(data, panel_scales, coord) {
    coords <- coord$transform(data, panel_scales) %>%
      mutate(
        lower = rescale(lower, from = panel_scales$y.range),
        upper = rescale(upper, from = panel_scales$y.range),
        median = rescale(median, from = panel_scales$y.range)
      )
    median <- pointsGrob(
      x = coords$x,
      y = coords$median,
      pch = coords$shape,
      size = unit(coords$size *
                    3, "pt")
    )
    lower <- segmentsGrob(
      x0 = coords$x,
      x1 = coords$x,
      y0 = coords$ymin,
      y1 = coords$lower,
      gp = gpar(lwd = coords$size)
    )
    upper <- segmentsGrob(
      x0 = coords$x,
      x1 = coords$x,
      y0 = coords$upper,
      y1 = coords$ymax,
      gp = gpar(lwd = coords$size)
    )
    gTree(children = gList(median, lower, upper))

  }
)
