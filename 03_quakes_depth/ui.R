library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Earthquakes off Fiji"),
  
  sidebarLayout(
    sidebarPanel(
      
      sliderInput(
        "slider_mag", label = h3("Magnitude"), 
        min = min(quakes$mag), max = max(quakes$mag), step = 0.2,
        value = c(min(quakes$mag), max = max(quakes$mag))),
      
      sliderInput(
        "slider_depth", label = h3("Depth"), 
        min = min(quakes$depth), max = max(quakes$depth), step = 50,
        value = c(min(quakes$depth), max = max(quakes$depth)))),
    
    mainPanel(
      plotOutput("hist_var"),
      
      selectInput(
        "select_var", label = h3("Variable to plot"),
        choices = c(
          "Magnitude" = "mag", 
          "Depth (m)" = "depth"))))))
