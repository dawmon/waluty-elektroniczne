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

	output$distPlot <- renderPlot({

		x <- faithful$waiting
		bins <- seq(min(x), max(x), length.out = input$bins + 1)

		hist(x, breaks = bins, col = "#75AADB", border = "white",
		 xlab = "Waiting time to next eruption (in mins)",
		 main = "Histogram of waiting times")

    })

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

        with(dd, plot(unlist(y), xlab = as.Date(names(y))))
        axis.Date(1, at = seq(min(dd$saldt), max(dd$saldt), by = "1 day"), format = "%m-%Y")
        
    })


}

