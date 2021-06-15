#' Toggle error handling between rlang::entrace() and recover()
#'
#'
#' @import rlang
#'
#'
#'

toggle_error <- function(){
  op <- options()
  e <- as.character(op$error)

  if(grepl("frame number", e)){
    options(error = rlang::entrace)
    message("Errors now use rlang::entrace")
  } else {
    options(error = recover)
    message("Errors now use recover")
  }

}
