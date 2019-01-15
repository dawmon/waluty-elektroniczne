library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

# App title ----
    titlePanel("BTC/USD Price"),

    tags$h4(htmlOutput('minprice')),
    tags$h4(htmlOutput('maxprice')),
    
    plotOutput(outputId = "distPlot")

)