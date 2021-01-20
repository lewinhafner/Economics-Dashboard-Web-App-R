#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(Quandl)

#Set Quandl API-Key
Quandl.api_key("8a7yrXdsRUL8ectacBY7")

# Header
header <- dashboardHeader(title = "Moonberg Terminal")

#Sidebar
sidebar <- dashboardSidebar(
    
    sidebarMenu(
        menuItem("Dashboard", tabName = "Dashboard", icon = icon("dashboard"))
        
    )
)

# Body
body <- dashboardBody(
    
    
    
  fluidRow(
      column(3,
             selectInput("Symbols",
                         h3("Symbol"),
                         choices = c("CAD/USD" = "FRED/DEXCAUS",
                                     "JPY/USD" = "FRED/DEXJPUS",
                                     "CHF/USD" = "FRED/DEXSZUS",
                                     "M2 Money Supply" = "FRED/M2SL",
                                     "Effectice Federal Funds Rate" = "FRED/FEDFUNDS",
                                     "Natural Rate of Unemployment (Short-term)" = "FRED/NROUST",
                                     "Natural Rate of Unemployment (Long-term)" = "FRED/NROU",
                                     "Nominal Potential Gross Domestic Product" = "FRED/NGDPPOT",
                                     "Real Potential Gross Domestic Product" = "FRED/GDPPOT",
                                     "Inflation, US Consumer Prices" = "FRED/FPCPITOTLZGUSA"
                                     
                                     ),
                         selected = "CAD/USD")),
      
      column(3,
             dateInput("start_date",
                       h3("Start Date"),
                       value = "2016-01-01")),
      
      column(3,
             dateInput("end_date",
                       h3("End Date"),
                       value = "2021-01-01"))
      
  ),
  
  mainPanel(
      plotOutput("FXResults")
  )

    
)

# Stick together header, sidebar and body
dashboardPage(skin = "black", header, sidebar, body)


