#' webtimer
#' 
#' Runs a shiny-based webapp timer.
#' 
#' @details
#' If shiny is not available, then this does nothing.
#' 
#' @param launch.browser Should the app automatically launch in browser?
#' 
#' @export
webtimer = function(launch.browser=TRUE)
{
  if ("shiny" %in% utils::installed.packages())
  {
    app_path = system.file("shiny", package="timer")
    shiny::runApp(appDir=app_path, launch.browser=launch.browser)
  }
  else
    return(FALSE)
}
