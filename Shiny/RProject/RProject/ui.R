library(shiny)
library(jsonlite)

ui <- fluidPage(
  titlePanel(title = h1(strong("Waluty elektroniczne"), align = "center")),

  sidebarLayout(

  sidebarPanel(
        width = 3,
        dateInput("date", h3("Data"), value = Sys.Date() - 1)
    ),

    mainPanel(
        tabsetPanel(
            type = "tab",
            tabPanel("Bitcoin", h2(htmlOutput("selected_select")), plotOutput("display")),
            tabPanel("Inne", h2(htmlOutput("curr")), tableOutput("currt"), plotOutput("currd"))
        )
  	)
  )
)  
