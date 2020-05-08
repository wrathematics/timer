datetime_to_seconds = function(dt) as.numeric(as.POSIXct(dt, origin="1970-01-01"))

clock = function() datetime_to_seconds(Sys.time())

seconds_to_clockface = function(s)
{
  hours = floor(s/60/60)
  minutes = floor((s - hours*60*60)/60)
  seconds = floor(s - hours*60*60 - minutes*60)
  
  list(hours=hours, minutes=minutes, seconds=seconds)
}

print_clockface = function(cf, label, reset=TRUE)
{
  if (reset)
    cat("\r")
  
  cat(sprintf("%s%02d:%02d:%02d", label, cf$hours, cf$minutes, cf$seconds))
}

audio_ping = function()
{
  if ("beepr" %in% utils::installed.packages())
    beepr::beep()
}



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



timer_clock = function(hours, minutes, seconds)
{
  total_seconds = 60*60*hours + 60*minutes + seconds
  t_top = clock() + total_seconds
  
  while (TRUE)
  {
    t = t_top - clock()
    if (t <= 0)
      break
    
    cf = seconds_to_clockface(t)
    print_clockface(cf, "time remaining: ")
    Sys.sleep(1)
  }
  
  cat("\n")
  audio_ping()
  
  while (TRUE)
  {
    t = clock() - t_top + 1
    cf = seconds_to_clockface(t)
    print_clockface(cf, "time over: ")
    
    cat("    ")
    
    t = clock() - t_top + total_seconds + 1
    cf = seconds_to_clockface(t)
    print_clockface(cf, "total time: ", reset=FALSE)
    Sys.sleep(1)
  }
  
  cat("\n")
  invisible(TRUE)
}
