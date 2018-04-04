library(shiny)
library(shinydashboard)
# http://rstudio.github.io/shinydashboard/
  
dashboardPage(
  
  dashboardHeader(title = "Earthquakes off Fiji"),
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Map", tabName = "tab_map", icon = icon("map")),
      menuItem("Histogram", tabName = "tab_hist", icon = icon("bar-chart"))),
    
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
    
    dashboardBody(
      tabItems(
        tabItem("tab_map",
          leafletOutput("map", height=300)),
        tabItem("tab_hist",
          plotOutput("hist_var", height=300)))))
