library(shiny)

ui <- fluidPage(
  titlePanel("Waluty elektroniczne"),

  sidebarLayout(
    sidebarPanel(
        selectInput("select", h3("Waluty"), choices = list("Bitcoin", "Inne"), selected = "Bitcoin")
    ),
    mainPanel(
              textOutput("selected_select")
  	)
  )
)
