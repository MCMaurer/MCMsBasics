#' Create ggplots to quickly explore data
#'
#' @param .data: a dataframe to make plots from
#'
#' @return either a list of the plots or simply the plots themselves
#' @export
#' @import dplyr
#' @import ggplot2
#' @import tidyr
#'
#' @examples
#' iris %>% ggskim()
#'
#'

ggskim <- function(.data, plot = T, ...){

  p_num <- .data %>%
    select_if(is.numeric) %>%
    pivot_longer(cols = everything(),
                 names_to = "column",
                 values_to = "value") %>%
    ggplot(aes(x = value)) +
    geom_histogram() +
    facet_wrap(vars(column), scales = "free")

  p_other <- .data %>%
    select_if(function(x) !is.numeric(x)) %>%
    mutate_if(.predicate = function(x) !is.factor(x), .funs = as.factor) %>%
    pivot_longer(cols = everything(),
                 names_to = "column",
                 values_to = "value") %>%
    ggplot(aes(x = value)) +
    geom_bar(stat = "count") +
    coord_flip() +
    facet_wrap(vars(column), scales = "free")

  if(plot){
    p_num
    p_other
  } else {
    return(list(p_num = p_num, p_other = p_other))
  }
}
