#' clock
#' 
#' Show the current clock time, updated every second.
#' 
#' @export
clock = function()
{
  while (TRUE)
  {
    c = format(Sys.time(), format="%H:%M:%S")
    cat(sprintf("\r%s", c))
    
    Sys.sleep(1)
  }
  
  cat("\n")
  invisible(TRUE)
}
