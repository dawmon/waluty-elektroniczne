# Define server logic required to draw a histogram ----
server <- function(input, output) {

    output$selected_select <- renderText({

        paste("Wartosc dla ","<b>", input$select, "</b>", " dnia ")

    })
}

