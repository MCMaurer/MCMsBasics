#' Select only unique columns
#'
#' @param .data: a dataframe whose columns will be evaluated for uniqueness and then have duplicates removed
#' @param keep: a vector of quoted column names for columns that should be kept regardless of duplicate status. Defaults to NA
#' @param reverse: should columns be evaluated for duplicates in reverse order? Defaults to FALSE
#'
#' @return a dataframe with only unique columns
#' @export
#' @import dplyr
#'
#' @examples
#' mtcars2 <- mtcars %>% mutate(hp2 = hp)
#' mtcars2 %>% distinct_cols()
#'

distinct_cols <- function(.data, keep = NA, reverse = FALSE){

  if(!is.na(keep)){
    keepers <- seq_along(.data)[colnames(.data) %in% keep]
  } else{
    keepers <- NA
  }

  col_seq <- seq_along(.data)

  status <- duplicated(as.list(.data), fromLast = reverse)
  distinct <- col_seq[!status]
  distinct <- sort(unique(c(distinct, keepers)))

  dups <- col_seq[!(col_seq %in% distinct)]

  dup_names <- paste(colnames(.data)[dups], collapse = ", ")

  x <- select(.data, all_of(distinct))

  warning(paste0("Columns ", dup_names, " have been removed."))
  return(x)
}
