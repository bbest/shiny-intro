library(tidyverse)
library(shiny)

shinyServer(function(input, output) {

  output$hist_mag <- renderPlot({
    
    # summary(quakes); ?quakes
    d <- quakes %>%
      filter(
        mag >= input$slider_mag[1],
        mag <= input$slider_mag[2])
    
    # draw the histogram of quakes
    hist(d$mag, col = 'darkgray', border = 'white')
    
  })
  
})
