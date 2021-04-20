timer_naive = function(hours, minutes, seconds)
{
  while (hours > 0 || minutes > 0 || seconds > 0)
  {
    if (seconds == 0)
    {
      if (minutes > 0)
      {
        minutes = minutes - 1
        seconds = 60
      }
      else if (minutes == 0 && hours > 0)
      {
        hours = hours - 1
        minutes = 59
        seconds = 60
      }
    }
    
    seconds = seconds - 1
    cf = list(hours=hours, minutes=minutes, seconds=seconds)
    print_clockface(cf, "time remaining: ")
    Sys.sleep(1)
  }
  
  cat("\n")
  invisible(TRUE)
}
