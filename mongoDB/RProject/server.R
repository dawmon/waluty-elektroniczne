# Define server logic required to draw a histogram ----
server <- function(input, output) {

    # Histogram of the Old Faithful Geyser Data ----
    # with requested number of bins
    # This expression that generates a histogram is wrapped in a call
    # to renderPlot to indicate that:
    #
    # 1. It is "reactive" and therefore should be automatically
    #    re-executed when inputs (input$bins) change
    # 2. Its output type is a plot

    library(jsonlite)


    output$test <- renderPrint({

        #x <- fromJSON("https://api.blockchain.info/pools?timespan=5days")
        x <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
        #print(x)
        #plot(x, y = NULL, type = "h", lwd = 2)
        #v <- x[["bpi"]][1]
        #str(v)
        list <- x[["bpi"]]
        #str(list)
        y <- as.array(list)

        #for (i in names(y)) {
        #print(i)
        #print(y[[i]])
        #plot(time, i)
        #values <- i
        #}

        #dates <- names(y)
        #print(dates)
        #print(i)

        #print(typeof(dates))

        #plot(i, y[[i]], type = 'l', xlab = 't /s', ylab = 's1')

        # pre-allocate space
        f3 <- function(n) {
            df <- data.frame(x = numeric(n), y = character(n), stringsAsFactors = FALSE)
            for (i in names(y)) {
                df$x[i] <- i
                df$y[i] <- toString(i)
            }
            print(df)
        }

    })

    output$distPlot <- renderPlot({

        x <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
        list <- x[["bpi"]]
        y <- as.array(list)

        dd <- data.frame(
        saldt = seq(min(as.Date(names(y))), max(as.Date(names(y))), by = "1 day"),
        salpr = cumsum(rnorm(31))
        )


        plot(unlist(y), xaxt = "n")
        axis(1, 0:30, names(y))

    })


    last31 <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
    last31 <- last31[["bpi"]]
    last31 <- as.array(last31)
    last31 <- unlist(last31)

    output$minprice <- renderText(
    paste('Price : $', min(last31))
    )

    output$maxprice <- renderText(
    paste('Price : $', max(last31))
    )

}

