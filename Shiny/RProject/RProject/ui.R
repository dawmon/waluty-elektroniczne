library(shiny)
library(jsonlite)

ui <- fluidPage(
  titlePanel(title = h1(strong("Waluty elektroniczne"))),

  sidebarLayout(

  sidebarPanel(
        width = 3,
        selectInput("select", h3("Waluta"), choices = names(bitlist), selected = "btcusd"),
        dateInput("date", h3("Data"), value = Sys.Date() - 1)
    ),

    mainPanel(
        h2(htmlOutput("selected_select")),
        plotOutput("display")
  	)
  )
)
