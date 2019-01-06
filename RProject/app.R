library(shiny)
library(jsonlite)

#Jest to wersja projektu bez u¿ycia mongoDB
#runApp("NPR/NPR")
shinyApp(ui = htmlTemplate("www/index.html"), server)