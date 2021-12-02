#' alarm
#' 
#' A count down until the clock matches the given time(s).
#' 
#' @param timestr Time(s) that the alarm will go off.
#' 
#' @examples
#' \dontrun{
#' alarm("01:32")
#' alarm("14:59:15")
#' alarm(c("01:32","14:59:15"))
#' }
#' 
#' @export
alarm = function(timestr)
{
  strtosec=function(ts){
    curtime=as.POSIXct(format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
    dt=difftime(as.POSIXct(paste0(format(Sys.time(),"%Y-%m-%d "),ts)),curtime,units="secs")
    if(dt<0){
      # tomorrow's time (12am?)
      dt=difftime(as.POSIXct(paste0(format(Sys.time()+24*60*60,"%Y-%m-%d "),ts)),curtime,units="secs")
    }
    as.numeric(dt)
  }
  for(si in 1:length(timestr)){
    timer(seconds=strtosec(timestr[si]), hours=0, minutes=0, over_time = si==length(timestr))
  }
}
