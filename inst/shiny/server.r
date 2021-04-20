library(shiny)

get_time_string = function(t)
{
  cf = timer:::seconds_to_clockface(t)
  timer:::get_clockface(cf, "")
}


shinyServer(function(input, output, session){
  state = reactiveValues(t_first=0, beeps=1)
  
  observeEvent(input$button_reset, {
    state$t_first = 0
    state$beeps = 1
    
    state$h = 0
    state$m = 0
    state$s = 0
  })
  
  observeEvent(input$button_start, {
    state$t_first = timer:::clock_seconds()
    state$beeps = 1
    
    state$h = as.numeric(input$hbox)
    state$m = as.numeric(input$mbox)
    state$s = as.numeric(input$sbox)
  })
  
  observeEvent(input$button_22, {
    state$t_first = timer:::clock_seconds()
    state$beeps = 1
    
    state$h = state$s = 0
    state$m = 22
  })
  
  observeEvent(input$button_90, {
    state$t_first = timer:::clock_seconds()
    state$beeps = 1
    
    state$h = state$s = 0
    state$m = 90
  })
  
  output$countdown = renderUI({
    total_seconds = 60*60*state$h + 60*state$m + state$s
    if (total_seconds == 0 || state$t_first == 0)
      HTML("")
    else
    {
      t_top = state$t_first + total_seconds
      t = t_top - timer:::clock_seconds()
      
      invalidateLater(1000, session)
      
      if (t <= 0)
      {
        if (state$beeps > 0)
        {
          state$beeps = state$beeps - 1L
          timer:::audio_ping()
        }
        
        t = 1 - t
        
        cf = get_time_string(t)
        cf_tot = get_time_string(t+total_seconds)
        
        HTML(paste(
          "<font size=10>Over Time</font><br>",
          "<p style='font-size:100px; color:red'>", cf, "</p><br>",
          "<font size=10>Total</font><br>",
          "<p style='font-size:100px; color:red'>", cf_tot, "</p>"
        ))
      }
      else
      {
        cf = get_time_string(t)
        HTML(paste(
          "<font size=10>Remaining</font><br>",
          "<p style='font-size:100px'>", cf, "</p>"
        ))
      }
    }
  })
})
