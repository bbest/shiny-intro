library(tidyverse)
library(shiny)

shinyServer(function(input, output) {

  output$hist_var <- renderPlot({
    
    # summary(quakes); ?quakes
    d <- quakes %>%
      filter(
        mag   >= input$slider_mag[1],
        mag   <= input$slider_mag[2],
        depth >= input$slider_depth[1],
        depth <= input$slider_depth[2])
    
    # draw the histogram of quakes
    hist(d[[input$select_var]], col = 'darkgray', border = 'white')
    
  })
  
})
