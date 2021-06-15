#' Make a halfeye ggplot for all beta values from a `brms` model
#'
#' @param model: a `brms` model object
#' @param start_string: what is the starting string of the model parameters that should be plotted. Defaults to "b_" to get all fixed beta values.
#'
#' @return a halfeye ggplot object with one halfeye for each beta parameter
#' @export
#' @import ggplot2
#' @import dplyr
#' @importFrom tidyr pivot_longer
#' @importFrom tidybayes stat_halfeye
#' @importFrom brms posterior_samples
#'
#' @examples
#' m1 %>% beta_halfeye_plot()
#'
#'

beta_halfeye_plot <- function(model, start_string = "b_"){
  posterior_samples(m1) %>%
  select(starts_with(start_string)) %>%
  pivot_longer(everything()) %>%
  ggplot(aes(x = value, y = name)) +
  geom_vline(xintercept = 0, linetype = 2, color = "gray90") +
  stat_halfeye() +
  theme_bw()
}
