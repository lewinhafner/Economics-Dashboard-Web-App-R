#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library (ggplot2)
library(scales)
library(Quandl)
library("TTR")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

output$FXResults <- renderPlot({
    
    currency = Quandl (input$Symbols, start_date = input$start_date, end_date = input$end_date, type = "xts")
    currencydf = data.frame(currency)
    simplemovingaverage = SMA(currencydf$currency, n=20)
    plot (currencydf$currency, type = "l", col = "blue", xlab  = "Days", ylab = "Rate")
    lines(simplemovingaverage, type = "l", col = "red")
    title (main = input$Symbols)
    
    
})


})
