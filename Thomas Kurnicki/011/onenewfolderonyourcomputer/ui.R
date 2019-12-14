#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(rhandsontable)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("cp",
                   "value of cp:",
                   min = 0.001,
                   max = 0.2,
                   value = 0.013)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput(outputId = "p"),
      plotOutput("hot")
      # ,
      # plotlyOutput(outputId = "xxxxxx"),
      # plotlyOutput(outputId = "xxxxxxxx")
    )
  )
))
