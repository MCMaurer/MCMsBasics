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

ggskim <- function(.data, ...){

  d_num <- .data %>%
    select_if(is.numeric)

  if(ncol(d_num) > 0){

    d_num <- d_num %>%
      pivot_longer(cols = everything(),
                   names_to = "column",
                   values_to = "value")


    p_num <- d_num %>%
      ggplot(aes(x = value)) +
      geom_histogram() +
      facet_wrap(vars(column), scales = "free")
  }

  d_other <- .data %>%
    select_if(function(x) !is.numeric(x))

  if(ncol(d_other) > 0){
    d_other <- d_other %>%
      mutate_if(.predicate = function(x) !is.factor(x), .funs = as.factor) %>%
      pivot_longer(cols = everything(),
                   names_to = "column",
                   values_to = "value")
    p_other <- d_other %>%
      ggplot(aes(x = value)) +
      geom_bar(stat = "count") +
      coord_flip() +
      facet_wrap(vars(column), scales = "free")
  }

  p_list <- list()

  if(exists("p_num")){
    p_list$p_num <- p_num
  }

  if(exists("p_other")){
    p_list$p_other <- p_other
  }

  return(p_list)
}
