% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_tuftebox.R, R/stat_tuftebox.R
\name{geom_tuftebox}
\alias{geom_tuftebox}
\alias{stat_tuftebox}
\title{Geom for Tufte-style minimal boxplots}
\usage{
geom_tuftebox(
  mapping = NULL,
  data = NULL,
  stat = "TufteBox",
  position = "identity",
  show.legend = NA,
  na.rm = FALSE,
  inherit.aes = TRUE,
  ...
)

stat_tuftebox(
  mapping = NULL,
  data = NULL,
  geom = "TufteBox",
  position = "identity",
  show.legend = NA,
  outliers = TRUE,
  inherit.aes = TRUE,
  ...
)
}
\arguments{
\item{geom, stat}{Use to override the default connection between
`geom_tuftebox()` and `stat_tuftebox()`.}
}
\description{
Geom for Tufte-style minimal boxplots

Stat for Tufte-style minimal boxplots
}
\section{}{
NA
}

\examples{
p <- ggplot(mpg, aes(class, hwy))
p + geom_tuftebox()
}
