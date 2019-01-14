library(shiny)

ui <- fluidPage(
  titlePanel("Waluty elektroniczne"),

  sidebarLayout(
    sidebarPanel(
        selectInput("select", h3("Waluty"), choices = list("Bitcoin", "Inne"), selected = "Bitcoin"),
        dateInput("date", h3("Data"), value = Sys.Date())
    ),
    mainPanel(
              h2(htmlOutput("selected_select"))
  	)
  )
)
