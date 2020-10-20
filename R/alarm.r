#' alarm
#' 
#' A count down until the clock matches the given time.
#' 
#' @param timestr Time that the alarm will go off. 
#' 
#' @examples
#' alarm("01:32")
#' alarm("14:59:15")
#' 
#' @export
alarm = function(timestr)
{
  curtime=as.POSIXct(format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
  dt=difftime(as.POSIXct(paste0(format(Sys.time(),"%Y-%m-%d "),timestr)),curtime,units="secs")
  if(dt<0){
    # tomorrow's time (12am?)
    dt=difftime(as.POSIXct(paste0(format(Sys.time()+24*60*60,"%Y-%m-%d "),timestr)),curtime,units="secs")
  }
  timer(seconds=as.numeric(dt), hours=0, minutes=0)
}
