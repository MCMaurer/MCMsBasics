#' Make the names nice
#'
#' @param .data: a dataframe whose names are to be changed
#'
#' @return a dataframe with nice names
#' @export
#' @import dplyr
#' @import stringr
#'
#' @examples
#' iris %>% nice_names()
#'
#'

nice_names <- function(.data, ...){
  .data %>%
    rename_all(~ str_to_lower(.) %>%
                 str_replace_all(., " ", "_") %>%
                 str_replace_all(., "\\.", "_")
    )
}
