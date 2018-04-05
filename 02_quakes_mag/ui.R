library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Earthquakes off Fiji"),
  
  sidebarLayout(
    sidebarPanel(
      # http://shiny.rstudio.com/gallery/widget-gallery.html
      sliderInput(
        "slider_mag", label = h3("Magnitude"), 
        min = min(quakes$mag), max = max(quakes$mag), step = 0.2,
        value = c(min(quakes$mag), max(quakes$mag)))),
    
    mainPanel(
       plotOutput("hist_mag")))))
