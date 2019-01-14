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

        dd <- data.frame(
        saldt = seq(min(as.Date(names(y))), max(as.Date(names(y))), by = "1 day"),
        salpr = cumsum(rnorm(31))
        )


        plot(unlist(y), xaxt = "n")
        axis(1, 0:30, names(y))

    })
}

