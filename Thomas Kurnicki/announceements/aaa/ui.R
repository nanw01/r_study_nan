#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("German Credit predictive model comparison"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Would you like to grow or prune?",
                        min = 0.0095,
                        max = 0.019,
                        value = 0.015),
            selectInput("var", "What var do you want?", choices = c('checking'='checking', 'savings'='savings')),
            #numericInput("number", "input checking value:", min=1, max=4, step=1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            verbatimTextOutput("logit")
        )
    )
))
