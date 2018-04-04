library(tidyverse)
library(shiny)
library(leaflet)
library(glue)

shinyServer(function(input, output, session) {
  
  d <- reactive({
    quakes %>%
      filter(
        mag   >= input$slider_mag[1],
        mag   <= input$slider_mag[2],
        depth >= input$slider_depth[1],
        depth <= input$slider_depth[2])
  })
  
  output$hist_var <- renderPlot({
    
    hist(d()[[input$select_var]], col = 'darkgray', border = 'white')
  })
  
  output$map <- renderLeaflet({
    
    leaflet(data = d()) %>% addTiles() %>%
      addCircleMarkers(
        radius = ~mag, color = "red", stroke = FALSE, fillOpacity = 0.5,
        popup = ~glue("mag: {mag}<br>depth: {depth} m"), label = ~as.character(mag)) %>%
      expandLimits(quakes$lat, quakes$long)
  })
})
