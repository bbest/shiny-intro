shinyUI(fluidPage(
  
  titlePanel("Earthquakes off Fiji"),
  
  sidebarLayout(
    sidebarPanel(
      
      # http://shiny.rstudio.com/gallery/widget-gallery.html
      sliderInput(
        "slider_mag", label = h3("Magnitude"), 
        min = min(quakes$mag), max = max(quakes$mag), step = 0.2,
        value = c(min(quakes$mag), max = max(quakes$mag))),
      
      sliderInput(
        "slider_depth", label = h3("Depth"), 
        min = min(quakes$depth), max = max(quakes$depth), step = 50,
        value = c(min(quakes$depth), max = max(quakes$depth))),
      
      selectInput(
        "select_var", label = h3("Variable to plot"),
        choices = c(
          "Magnitude" = "mag", 
          "Depth (m)" = "depth"))),
    
    mainPanel(
      leafletOutput("map", height=300),
      plotOutput("hist_var", height=300)))))
