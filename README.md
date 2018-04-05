# shiny-intro

Here are some introductory materials to accompany this presentation:

  [Creating Interactive Web Applications with R & Shiny](http://bit.ly/shiny-2018-04)

Numbered folders in this repository correspond with iterative development and enhancement of a Shiny app:

- `01_faithful`: default app from using RStudio, File > New File > Shiny Web App…
  ![](docs/screenshot-01_faithful.png)
- `02_quakes_mag`: swap to quakes dataset, adjust histogram by magnitude
- `03_quakes_depth`: add depth slider, select box for variable to histogram
- `04_quakes_map`: add leaflet map
- `05_quakes_dashboard`: enhance ui with shinydashboard
  ![](docs/screenshot-05_quakes_dashboard.png)

You can download all files in this repo at [master.zip](https://github.com/bbest/shiny-intro/archive/master.zip) (or use `git clone https://github.com/bbest/shiny-intro.git`). The latest versions of [R](https://cloud.r-project.org/) and [RStudio](https://www.rstudio.com/products/rstudio/download/#download) are highly recommended to follow along.

Be sure to check out the prepatory chunks of R code and outputs in the Rmarkdown `docs/index.Rmd` knitted to `docs/index.html` viewable at https://bbest.github.io/shiny-intro.