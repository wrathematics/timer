library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Timer"),
    fluidRow(
      sidebarPanel(
        numericInput("hbox", "Hours", min=0, value=0, width=100),
        numericInput("mbox", "Minutes", min=0, value=0, width=100),
        numericInput("sbox", "Seconds", min=0, value=0, width=100),
        br(),
        actionButton("button_reset", "Reset"),
        actionButton("button_start", "Start")
      ),
      mainPanel(
        htmlOutput("countdown")
      )
    )
  )
)
