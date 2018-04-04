shinyServer(function(input, output, session) {
  
  get_df <- reactive({
    df <- quakes %>%
      filter(
        mag   >= input$slider_mag[1],
        mag   <= input$slider_mag[2],
        depth >= input$slider_depth[1],
        depth <= input$slider_depth[2])
    df$var <- df[[input$select_var]]
    df
  })
  
  output$hist_var <- renderPlot({
    
    hist(get_df()$var, col = 'darkgray', border = 'white')
  })
  
  output$map <- renderLeaflet({
    
    leaflet(data = get_df()) %>% 
      addTiles() %>%
      addCircleMarkers(
        lng = ~long, lat = ~lat,
        radius = ~mag, color = "red", stroke = FALSE, fillOpacity = 0.5,
        popup = ~glue("mag: {mag}<br>depth: {depth} m"), label = ~as.character(mag)) %>%
      expandLimits(quakes$lat, quakes$long)
  })
})
