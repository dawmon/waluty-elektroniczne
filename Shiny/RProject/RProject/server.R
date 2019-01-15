# Define server logic required to draw a histogram ----
server <- function(input, output) {

    x <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
    bitfinex <- fromJSON("https://api.bitfinex.com/v1/symbols", flatten = TRUE, simplifyVector = TRUE)
    list <- x[["bpi"]]
    y <- as.array(list)

    i <- 0
    bitlist <- list()
    value <- c("BTC/USD","LTC/USD","LTC/BTC","ETH/USD","ETH/BTC","ETC/BTC", "ETC/USD", "RRT/BTC", "ZEC/USD", "ZEC/BTC")

    for (a in bitfinex) {
        currency <- fromJSON(paste0("https://api.bitfinex.com/v1/pubticker/", a), flatten = TRUE, simplifyVector = TRUE)
        bitlist[[a]] <- currency[["last_price"]]
        Sys.sleep(1)
        i <- i + 1
        if (i > 9) break
    }

    names(bitlist) <- value
    df = data.frame(bitlist)


    output$selected_select <- renderText({

        for (i in names(y)) {
            if (i == input$date) {
                valueb <- y[[i]]
                break
            }
            else
                valueb <- "Brak danych"
        }

        paste("Wartosc <b>Bitcoina</b> dnia <b>", input$date, "</b>",
              "</br> <font size = 50px><b>", valueb, " USD </b></font>")

    })


    output$display <- renderPlot({
        plot(unlist(y), type = "b", col = "blue", xaxt = "n", xlab = "Data [yyyy-mm-dd]", ylab = "Wartosc [USD]",
             main = paste("Zmiana wartosci Bitcoina przez ostatnie 31 dni:"))

        axis(1, 0:30, names(y))
    })


    output$curr <- renderText({
        paste("Wartosci innych walut dla danej chwili</br>")
    })


    output$currt <- renderTable(
            { df }, hover = TRUE, spacing = "l", width = "100%", align = "c")


    output$currd <- renderPlot({
        plot(unlist(bitlist), type = "h", lwd = 15, col = "grey", xaxt = "n", xlab = " ", ylab = "Wartosc")

        axis(1, 1:10, names(bitlist))
    })
}
