# Define server logic required to draw a histogram ----
server <- function(input, output) {

    x <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
    list <- x[["bpi"]]
    y <- as.array(list)


    output$selected_select <- renderText({


    for (i in names(y)) {
        if (i == input$date) {
            value <- y[[i]]
            break
        }
        else
            value <- "Brak danych"
    }

        paste("Wartosc dla ", "<b>", input$select, "</b>", " dnia ", "<b>", input$date, "</b>", 
              "</br>", "<font size = 50px><b>", value, " USD", "</b></font>")

    })


    output$display <- renderPlot({

        plot(unlist(y), xaxt = "n", xlab = "Data", ylab = "Wartosc [USD]",
             main = paste("Zmiana wartosci dla ", input$select, " przez ostatnie 31 dni:"))
        axis(1, 0:30, names(y))

    })
}

