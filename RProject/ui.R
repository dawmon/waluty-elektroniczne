library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

# App title ----
  #titlePanel("Kurs Bitcoin"),
#div(HTML("Old <em>Faithful Geyser</em> Data")),
titlePanel(strong(em("Kurs Bitconia "))),


    mainPanel(
      plotOutput(outputId = "distPlot")
  	)
  )
#)