#' timer
#' 
#' A count down timer.
#' 
#' @param hours,minutes,seconds Time to count down from.
#' @param recur Should the timer repeat?
#' @param over_time Display the time elapsed since the alarm?
#' 
#' @name timer
#' @rdname timer
NULL



#' @rdname timer
#' @export
timer = function(hours=0, minutes=0, seconds=0, recur=FALSE, over_time=TRUE)
{
  timer_clock(hours=hours, minutes=minutes, seconds=seconds, recur=recur, over_time=over_time)
}



#' @rdname timer
#' @export
hours = function(hours, recur=FALSE, over_time=TRUE)
{
  timer(hours=hours, minutes=0, seconds=0, recur=recur, over_time=over_time)
}



#' @rdname timer
#' @export
minutes = function(minutes, recur=FALSE, over_time=TRUE)
{
  timer(minutes=minutes, hours=0, seconds=0, recur=recur, over_time=over_time)
}



#' @rdname timer
#' @export
seconds = function(seconds, recur=FALSE, over_time=TRUE)
{
  timer(seconds=seconds, hours=0, minutes=0, recur=recur, over_time=over_time)
}
