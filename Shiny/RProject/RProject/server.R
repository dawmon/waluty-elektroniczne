# Define server logic required to draw a histogram ----
server <- function(input, output) {

    x <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
    bitfinex <- fromJSON("https://api.bitfinex.com/v1/symbols", flatten = TRUE, simplifyVector = TRUE)
    list <- x[["bpi"]]
    y <- as.array(list)

    i <- 0
    bitlist <- list()
    value <- list()

    for (a in bitfinex) {
        currency <- fromJSON(paste0("https://api.bitfinex.com/v1/pubticker/", a), flatten = TRUE, simplifyVector = TRUE)
        bitlist[[a]] <- currency[["last_price"]]
        Sys.sleep(1)
        i <- i + 1
        if (i > 5) break
    }

    output$selected_select <- renderText({
        for (i in names(bitlist)) value[[i]] <- bitlist[[i]]
        
        paste("Wartosc dla ", "<b>", input$select, "</b>", " dnia ", "<b>", input$date, "</b>", 
              "</br>", "<font size = 50px><b>", value[[input$select]], " USD", "</b></font>")
    })

    output$display <- renderPlot({
        plot(unlist(y), type = "b", col = "blue", xaxt = "n", xlab = "Data [yyyy-mm-dd]", ylab = "Wartosc [USD]",
             main = paste("Zmiana wartosci dla", input$select, "przez ostatnie 31 dni:"))

        axis(1, 0:30, names(y))
    })
}
