library(shiny)

ui <- fluidPage(
  titlePanel(title = h1(strong("Waluty elektroniczne"))),

  sidebarLayout(
    sidebarPanel(width = 3,
        selectInput("select", h3("Waluty"), choices = list("Bitcoin", "Inne"), selected = "Bitcoin"),
        dateInput("date", h3("Data"), value = Sys.Date())
    ),
    mainPanel(
              h2(htmlOutput("selected_select")),

              plotOutput("display")
  	)
  )
)
