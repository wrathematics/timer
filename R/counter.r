#' counter
#' 
#' Count up from 0.
#' 
#' @export
counter = function()
{
  t0 = clock_seconds()
  
  while (TRUE)
  {
    t = clock_seconds() - t0
    cf = seconds_to_clockface(t)
    print_clockface(cf, "")
    Sys.sleep(1)
  }
  
  cat("\n")
  invisible(TRUE)
}
