library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

# App title ----
  #titlePanel("Kurs Bitcoin"),
#div(HTML("Old <em>Faithful Geyser</em> Data")),
titlePanel(p(strong(em("Kurs Bitconia ")))),
#p(strong("bold font "), "italic font")),
   # p(code("code block")),
  # Sidebar layout with input and output definitions ----
#  sidebarLayout(

  # Sidebar panel for inputs ----
	#sidebarPanel(

	# Input: Slider for the number of bins ----
#	  sliderInput(inputId = "bins",
#				  label = "Number of bins:",
#				  min = 1,
#				  max = 50,
#				  value = 30)
#tags$h1("My header")
		#	  	),

				# Main panel for displaying outputs ----

    mainPanel(
      plotOutput(outputId = "distPlot")
  	)
  )
#)