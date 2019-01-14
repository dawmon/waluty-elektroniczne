#x = list(1, 2, 7)
#y = list(2, 4, 5)
library(jsonlite)
server <- function(input, output) {
    output$distPlot <- renderPlot({
        x <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
        list <- x[["bpi"]]
        y <- as.array(list)

        y <- unlist(y)
        plot(y, xaxt = "n")
        axis(1, 0:30, names(y))
        #plot(x, y)
    })
	# Histogram of the Old Faithful Geyser Data ----
	# with requested number of bins
	# This expression that generates a histogram is wrapped in a call
	# to renderPlot to indicate that:
	#
	# 1. It is "reactive" and therefore should be automatically
	#    re-executed when inputs (input$bins) change
	# 2. Its output type is a plot

    #output$distPlot <- renderPlot({

    #    x <- 10
		#x <- faithful$waiting
        #bins <- seq(1, 10, length.out = input$bins + 1)
      #  bins <- seq(1, 10, length.out = 9)

      #  hist(x, breaks = bins, col = "#75AADB", border = "white",
	#	 xlab = "Waiting time to next eruption (in mins)",
	#	 main = "Histogram of waiting times")

    #})
    #output$distPlot <- plotOutput

    #output$distPlot <- renderPlot({

     #   x <- fromJSON("https://api.coindesk.com/v1/bpi/historical/close.json", flatten = TRUE, simplifyVector = TRUE)
    #list <- x[["bpi"]]
    #y <- as.array(list)

     #   dd <- data.frame(
    #    saldt = seq(min(as.Date(names(y))), max(as.Date(names(y))), by = "1 day"),
   #     salpr = cumsum(rnorm(31))
   #     )

    #    with(dd, plot(unlist(y), xlab = as.Date(names(y))))
    #axis.Date(1, at = seq(min(dd$saldt), max(dd$saldt), by = "1 day"), format = "%m-%Y")

    #})
}

