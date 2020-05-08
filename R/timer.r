#' timer
#' 
#' A count down timer.
#' 
#' @param hours,minutes,seconds Time to count down from.
#' 
#' @name timer
#' @rdname timer
NULL



#' @rdname timer
#' @export
timer = function(hours=0, minutes=0, seconds=0)
{
  timer_clock(hours=hours, minutes=minutes, seconds=seconds)
}



#' @rdname timer
#' @export
hours = function(hours)
{
  timer(hours=hours, minutes=0, seconds=0)
}



#' @rdname timer
#' @export
minutes = function(minutes)
{
  timer(minutes=minutes, hours=0, seconds=0)
}



#' @rdname timer
#' @export
seconds = function(seconds)
{
  timer(seconds=seconds, hours=0, minutes=0)
}
