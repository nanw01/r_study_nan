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
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("qqq",
                        "What cp do you want:",
                        min = 0.0075,
                        max = 0.02,
                        value = 0.013),
            selectInput("myvar","What var do you want?", 
                        choices = c("None"=" ","telephon"="+telephon","amount"="+amount")),
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("aaa"),
            verbatimTextOutput("logit")
            
        )
    )
))
