datetime_to_seconds = function(dt) as.numeric(as.POSIXct(dt, origin="1970-01-01"))

clock_seconds = function() datetime_to_seconds(Sys.time())

seconds_to_clockface = function(s)
{
  hours = floor(s/60/60)
  minutes = floor((s - hours*60*60)/60)
  seconds = floor(s - hours*60*60 - minutes*60)
  
  list(hours=hours, minutes=minutes, seconds=seconds)
}

get_clockface = function(cf, label, reset=TRUE)
{
  sprintf("%s%02d:%02d:%02d", label, cf$hours, cf$minutes, cf$seconds)
}

print_clockface = function(cf, label, reset=TRUE)
{
  if (reset)
    cat("\r")
  
  cat(get_clockface(cf, label, reset))
}

audio_ping = function()
{
  cat("\a")
  if ("beepr" %in% utils::installed.packages())
    beepr::beep()
}



timer_clock = function(hours, minutes, seconds, recur=FALSE)
{
  spacer = "    "
  total_seconds = 60*60*hours + 60*minutes + seconds
  
  ct = 0L
  while (TRUE)
  {
    t_top = clock_seconds() + total_seconds
    tot = seconds_to_clockface(total_seconds*ct)
    
    while (TRUE)
    {
      t = t_top - clock_seconds()
      if (t <= 0)
      break
      
      cf = seconds_to_clockface(t)
      if (isTRUE(recur))
      {
        print_clockface(cf, paste0("(reps ", ct, ")", spacer, "countdown: "))
        print_clockface(tot, paste0(spacer, "total: "), reset=FALSE)
      }
      else
        print_clockface(cf, "countdown: ")
      
      Sys.sleep(1)
    }
    
    audio_ping()
    if (isFALSE(recur))
    {
      cat("\n")
      break
    }
    
    ct = ct + 1L
  }
  
  while (TRUE)
  {
    t = clock_seconds() - t_top + 1
    cf = seconds_to_clockface(t)
    print_clockface(cf, "time over: ")
    
    cat(spacer)
    
    t = clock_seconds() - t_top + total_seconds + 1
    cf = seconds_to_clockface(t)
    print_clockface(cf, "total time: ", reset=FALSE)
    Sys.sleep(1)
  }
  
  cat("\n")
  invisible(TRUE)
}
