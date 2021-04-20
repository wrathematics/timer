#' timer
#' 
#' A count down timer.
#' 
#' @param hours,minutes,seconds Time to count down from.
#' @param recur Should the timer repeat?
#' 
#' @name timer
#' @rdname timer
NULL



#' @rdname timer
#' @export
timer = function(hours=0, minutes=0, seconds=0, recur=FALSE)
{
  timer_clock(hours=hours, minutes=minutes, seconds=seconds, recur=recur)
}



#' @rdname timer
#' @export
hours = function(hours, recur=FALSE)
{
  timer(hours=hours, minutes=0, seconds=0, recur=recur)
}



#' @rdname timer
#' @export
minutes = function(minutes, recur=FALSE)
{
  timer(minutes=minutes, hours=0, seconds=0, recur=recur)
}



#' @rdname timer
#' @export
seconds = function(seconds, recur=FALSE)
{
  timer(seconds=seconds, hours=0, minutes=0, recur=recur)
}
